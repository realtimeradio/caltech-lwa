import logging
import socket
import numpy as np
import struct
import time
import datetime
import os
import casperfpga
from . import helpers
from . import __version__
from .error_levels import *
from .blocks import block
from .blocks import fpga
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
    n_pols_per_board = 64   #: Number of analog inputs per FPGA
    n_pols_per_xeng = 352*2 #: Number of analog inputs per X-engine
    def __init__(self, host, logger=None):
        self.hostname = host #: hostname of the F-Engine's host SNAP2 board
        #: Python Logger instance
        self.logger = logger or helpers.add_default_log_handlers(logging.getLogger(__name__ + ":%s" % (host)))
        #: Underlying CasperFpga control instance
        self._cfpga = casperfpga.CasperFpga(
                        host=self.hostname,
                        transport=casperfpga.TapcpTransport,
                    )
        try:
            self._cfpga.get_system_information()
        except:
            self.logger.error("Failed to read and decode .fpg header from flash")
        self.blocks = {}
        try:
            self._initialize_blocks()
        except:
            self.logger.error("Failed to inialize firmware blocks. "
                              "Maybe the board needs programming.")

    def is_connected(self):
        """
        :return: True if there is a working connection to a SNAP2. False otherwise.
        :rtype: bool
        """
        return self._cfpga.is_connected()

    def _initialize_blocks(self):
        """
        Initialize firmware blocks, populating the ``blocks`` attribute.
        """

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
        self.eqtvg       = eqtvg.EqTvg(self._cfpga, 'post_eq_tvg', n_streams=64, n_chans=2**12)
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
            'eqtvg'     : self.eqtvg,
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
        If the FPGA is not programmed with F-engine firmware, will only
        return basic FPGA status.

        :return: (status_dict, flags_dict) tuple.
            Each is a dictionary, keyed by the names of the blocks in
            ``self.blocks``. These dictionaries contain, respectively, the
            status and flags returned by the ``get_status`` calls of
            each of this F-Engine's blocks.
        """
        stats = {}
        flags = {}
        if not self.blocks['fpga'].is_programmed():
            stats['fpga'], flags['fpga'] = self.blocks['fpga'].get_status()
        else:
            for blockname, block in self.blocks.items():
                stats[blockname], flags[blockname] = block.get_status()
        return stats, flags

    def print_status_all(self, use_color=True):
        """
        Print the status returned by ``get_status`` for all blocks in the system.
        If the FPGA is not programmed with F-engine firmware, will only
        print basic FPGA status.

        :param use_color: If True, highlight values with colors based on
            error codes.
        :type use_color: bool

        """
        if not self.blocks['fpga'].is_programmed():
            print('FPGA stats (not programmed with F-engine image):')
            self.blocks['fpga'].print_status()
        else:
            for blockname, block in self.blocks.items():
                print('Block %s stats:' % blockname)
                block.print_status()

    def configure_output(self, antenna_ids, n_chans_per_packet, n_chans_per_xeng, chans, ips, ports=None, debug=False):
        """
        Configure channel reordering and packetizer modules to emit a selection
        of frequency channels.


        :param n_chans_per_packet: Number of channels per packet.
        :type n_chans_per_packet: int

        :param n_chans_per_xeng: Number of channels per xeng.
        :type n_chans_per_xeng: int

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

        :param antenna_ids: A list of Antenna IDs which should be written to output packet
            headers. Addressing rules are the same as for ``ips``.
        :type antenna_ids: list

        :param debug: Set to True to print extra diagnostic information.
        :type debug: bool

        :param n_boards: Transmit packets with headers indicating they came from
            this many different boards. For example, if n_boards=2, the board
            will transmit two streams of packets with antenna IDs ``base_ant``
            and ``base_ant+64``
        """
        chans = np.array(chans)
        assert chans.shape[0] % n_chans_per_packet == 0, \
            "Number of chans to send must be an integer number of packets"
        n_packets = chans.shape[0] // n_chans_per_packet

        assert n_chans_per_packet % self.reorder.n_parallel_chans == 0, \
            "Number of channels per packet must be an integer multiple of %d" % self.reorder.n_parallel_chans

        packet_starts, packet_payloads, channel_indices = \
            self.packetizer.get_packet_info(n_chans_per_packet, chan_block_size=self.reorder.n_parallel_chans)

        self.logger.debug("Packet starts: %s" % packet_starts)
        self.logger.debug("Packet payloads: %s" % packet_payloads)
        self.logger.debug("Channel indices: %s" % channel_indices)

        packet_starts = packet_starts[0:n_packets]
        packet_payloads = packet_payloads[0:n_packets]
        channel_indices = channel_indices[0:n_packets]
        self.logger.debug("Reduced Packet starts: %s" % packet_starts)
        self.logger.debug("Reduced Packet payloads: %s" % packet_payloads)
        self.logger.debug("Reduced Channel indices: %s" % channel_indices)
        ports = ports or [10000]*n_packets
        assert n_packets == len(packet_starts)
        assert len(ips) == n_packets
        assert len(ports) == n_packets
        assert len(antenna_ids) == n_packets

        # channel_indices above gives the channel IDs which will
        # be sent. Remap the ones we _want_ into these slots
        i = 0
        # initialize map to all -1
        output_order = [-1 for _ in range(self.reorder.n_chans)]
        for chan_range in channel_indices:
            for chan in chan_range:
                output_order[chan] = chans[i]
                i += 1
        # Fill gaps in the map with unused channels. All channels _must_
        # be used somewhere, since the underlying reorder is not double
        # buffered.
        # 1. Make a list of unused channels
        possible_channels = list(range(self.reorder.n_chans))
        for i, chan in enumerate(output_order):
            if chan == -1:
                continue
            possible_channels.remove(chan)
        # 2. Insert the unused channels in the map
        for i, chan in enumerate(output_order):
            if chan == -1:
                output_order[i] = possible_channels.pop(0)

        self.reorder.set_channel_order(output_order)
            
        self.packetizer.write_config(
            packet_starts,
            packet_payloads,
            chans[::n_chans_per_packet],
            antenna_ids,
            ips,
            ports,
            n_chans_per_packet,
            n_chans_per_xeng,
            self.n_pols_per_board,
            self.n_pols_per_xeng,
            print_config=debug,
        )

    def deprogram(self):
        """
        Reprogram the FPGA into its default boot image.
        """
        self._cfpga.transport.progdev(0)

    def program(self, fpgfile=None, force=False):
        """
        Program an .fpg file to a SNAP2 FPGA. If the name of the file
        matches what is already in flash, this command will simply
        reboot the FPGA. If the name of the file doesn't match, the
        new bitstream will be uploaded. This will take <=5 minutes.

        :param fpgfile: The .fpg file to be loaded. Should be a path to a
            valid .fpg file. If None is given, the image currently in flash
            will be loaded.
        :type fpgfile: str

        :param force: If True, write the firmware to flash even if the SNAP claims
            it is already loaded. Has no effect if ``fpgfile=None``.
        :type force: boolean

        """

        if fpgfile and not isinstance(fpgfile, str):
            raise TypeError("wrong type for fpgfile")
        if not isinstance(force, bool):
            raise TypeError("wrong type for force")

        if fpgfile and not os.path.exists(fpgfile):
            raise RuntimeError("Path %s doesn't exist" % fpgfile)

        try:
            if fpgfile is None:
                self.logger.info("Loading existing firmware to %s" % (self.hostname))
                self._cfpga.transport.prog_user_image()
                loaded_fpg = self._cfpga.transport.get_metadata()['filename']
                self.logger.info("Loaded %s" % loaded_fpg)
                try:
                    self._cfpga.get_system_information()
                except:
                    self.logger.error("Failed to get firmware metadata from flash")
            else:
                self.logger.info("Loading firmware %s to %s" % (fpgfile, self.hostname))
                self._cfpga.transport.upload_to_ram_and_program(fpgfile, force=force)
        except:
            self.logger.exception("Exception when loading new firmware")
            raise RuntimeError("Error during load")
        try:
            self._initialize_blocks()
        except:
            self.logger.exception("Exception when reinitializing firmware blocks")
            raise RuntimeError("Error reinitializing blocks")
