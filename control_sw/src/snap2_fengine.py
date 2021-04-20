import logging
import socket
import numpy as np
import struct
import time
import datetime
import casperfpga
from . import helpers
from . import __version__
from .error_levels import *
from .blocks import block
from .blocks import adc
from .blocks import sync
from .blocks import noisegen
from .blocks import input
from .blocks import delay
from .blocks import pfb
from .blocks import autocorr
from .blocks import eq
from .blocks import eqtvg
from .blocks import chanreorder
from .blocks import packetizer
from .blocks import eth
from .blocks import corr

class Snap2Fengine():
    """
    A control class for LWA352's SNAP2 F-Engine firmware.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    """
    def __init__(self, host, logger=None):
        self.hostname = host #: hostname of the F-Engine's host SNAP2 board
        #: Underlying CasperFpga control instance
        self._cfpga = casperfpga.CasperFpga(
                        host=self.hostname,
                        transport=casperfpga.TapcpTransport,
                    )

        # blocks
        #: Control interface to high-level FPGA functionality
        self.fpga        = fpga.Fpga(self._cfpga, "")
        #: Control interface to ADC block
        self.adc         = adc.Adc(self._cfpga, 'adc')
        #: Control interface to Synchronization / Timing block
        self.sync        = sync.Sync(self._cfpga, 'sync')
        #: Control interface to Noise Generation block
        self.noise       = noisegen.NoiseGen(self._cfpga, 'noise', n_noise=3, n_outputs=64)
        #: Control interface to Input Multiplex block
        self.input       = input.Input(self._cfpga, 'input', n_streams=64)
        #: Control interface to Coarse Delay block
        self.delay       = delay.Delay(self._cfpga, 'delay', n_streams=64)
        #: Control interface to PFB block
        self.pfb         = pfb.Pfb(self._cfpga, 'pfb')
        #: Control interface to Autocorrelation block
        self.autocorr    = autocorr.AutoCorr(self._cfpga, 'autocorr')
        #: Control interface to Equalization block
        self.eq          = eq.Eq(self._cfpga, 'eq', n_streams=64, n_coeffs=2**9)
        #: Control interface to post-equalization Test Vector Generator block
        self.eq_tvg      = eqtvg.EqTvg(self._cfpga, 'post_eq_tvg', n_streams=64, n_chans=2**12)
        #: Control interface to Channel Reorder block
        self.reorder     = chanreorder.ChanReorder(self._cfpga, 'chan_reorder', n_chans=2**12)
        #: Control interface to Packetizer block
        self.packetizer  = packetizer.Packetizer(self._cfpga, 'packetizer')
        #: Control interface to 40GbE interface block
        self.eth         = eth.Eth(self._cfpga, 'eth')
        #: Control interface to Correlation block
        self.corr        = corr.Corr(self._cfpga,'corr_0', n_chans=2**12 // 8) # Corr module collapses channels by 8x

        # The order here can be important, blocks are initialized in the
        # order they appear here

        #: Dictionary of all control blocks in the firmware system.
        self.blocks = {
            'fpga'      : self.fpga,
            'adc'       : self.adc,
            'sync'      : self.sync,
            'noise'     : self.noise,
            'input'     : self.input,
            'delay'     : self.delay,
            'pfb'       : self.pfb,
            'eq'        : self.eq,
            'eq_tvg'    : self.eq_tvg,
            'reorder'   : self.reorder,
            'packetizer': self.packetizer,
            'eth'       : self.eth,
            'autocorr'  : self.autocorr,
            'corr'      : self.corr,
        }

    def initialize(self, read_only=True):
        """
        Call the ```initialize`` methods of all underlying blocks.

        :param read_only: If True, call the underlying initialization methods
            in a read_only manner.
        :type read_only: bool
        """
        for blockname, block in self.blocks.items():
            if read_only:
                self.logger.info("Initializing block (read only): %s" % blockname)
            else:
                self.logger.info("Initializing block (writable): %s" % blockname)
            block.initialize(read_only=read_only)

    def get_status_all(self):
        """
        Call the ``get_status`` methods of all blocks in ``self.blocks``.

        :return: The contents of the underlying ``get_status`` calls, in a
            dictionary keyed by the names of the blocks in ``self.blocks``.
        """
        stats = {}
        for blockname, block in self.blocks.items():
            stats[blockname] = block.get_status()
        return stats

    def print_status_all(self, use_color=True):
        """
        Print the status returned by ``get_status`` for all blocks in the system.

        :param use_color: If True, highlight values with colors based on
            error codes.
        :type use_color: bool

        """
        print('Fengine stats:')
        self.print_status(use_color)
        for blockname, block in self.blocks.items():
            print('Block %s stats:' % blockname)
            block.print_status()

    def configure_output(self, base_ant, n_chans_per_packet, chans, ips, ports=None):
        """
        Configure channel reordering and packetizer modules to emit a selection
        of frequency channels.

        :param base_ant: Antenna ID which should be written to output packet
            headers. In general this should be the first antenna
            on this F-engine board.
        :type base_ant: int

        :param n_chans_per_packet: Number of channels per packet.
        :type n_chans_per_packet: int

        :param chans: A list of channel indices to be sent, e.g. ``range(0,1024)``.
            The number of channels in this list should be an integer multiple
            of ``n_chans_per_packet``. An assertion error is raised if this
            is not the case.
        :type chans: list of int

        :param ips: A list of IP addresses to which packets should be sent. The
            order of values in ``ips`` and ``chans`` should reflect where different
            channels should be sent. The ``n`` th IP address in ``ips`` is the
            destination to which channels
            ``chans[n*n_chans_per_packet : (n+1)*n_chans_per_packet]`` should
            be sent. As such, ``ips`` should have ``len(chans) // n_chans_per_packet``
            elements. IP addresses should be provided in dotted-quad string
            representation.
        :type ips: list of str

        :param ports: The UDP destination ports to which packets should be
            transmitted. Addressing rules are the same as for ``ips``. If
            None, all packets are transmitted to UDP port 10000.
        :type ports: list of int
        """
        chans = np.array(chans)
        assert chans.shape[0] % n_chans_per_packet == 0, \
            "Number of chans to send must be an inter number of packets"
        n_packets = chans.shape[0] // n_chans_per_packet

        packet_starts, packet_payloads, channel_indices = \
            self.packetizer.get_packet_info(n_chans_per_packet, chan_block_size=self.reorder.n_parallel_chans)

        packet_starts = packet_starts[0:n_packets]
        packet_payloads = packet_payloads[0:n_packets]
        channel_indices = channel_indices[0:n_packets]
        ports = ports or [10000]*n_packets
        assert n_packets == len(packet_starts)
        assert len(ips) == n_packets
        assert len(ports) == n_packets

        # channel_indices above gives the channel IDs which will
        # be sent. Remap the ones we _want_ into these slots
        i = 0
        output_order = list(range(self.reorder.n_chans))
        for chan_range in channel_indices:
            for chan in chan_range:
                output_order[chan] = chans[i]
                i += 1
        self.reorder.set_channel_order(output_order)
            
        ant_indices = [base_ant] * n_packets # Only the first antenna number goes in the header

        self.packetizer.write_config(
            packet_starts,
            packet_payloads,
            chans[::n_chans_per_packet],
            ant_indices,
            ips,
            ports,
            print_config=True
        )
