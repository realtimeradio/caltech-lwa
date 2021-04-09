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

class Snap2Fengine(block.Block):
    def __init__(self, host, ant_indices=None, logger=None):
        self.hostname = host
        self.fpga = casperfpga.CasperFpga(
                        host=self.hostname,
                        transport=casperfpga.TapcpTransport,
                    )

        # Top-level F-engine sees all registers
        super(Snap2Fengine, self).__init__(self.fpga, None, logger)

        # Try and get the canonical name of the host
        # to use as a serial number
        try:
            self.serial = socket.gethostbyaddr(self.hostname)[0]
        except:
            self._exception("Couldn't get host by address %s" % self.hostname)
            self.serial = None

        # blocks
        self.sysmon      = casperfpga.sysmon.Sysmon(self.fpga)
        self.adc         = adc.Adc(self.fpga, 'adc')
        self.sync        = sync.Sync(self.fpga, 'sync')
        self.noise       = noisegen.NoiseGen(self.fpga, 'noise', n_noise=3, n_outputs=64)
        self.input       = input.Input(self.fpga, 'input', n_streams=64)
        self.delay       = delay.Delay(self.fpga, 'delay', n_streams=64)
        self.pfb         = pfb.Pfb(self.fpga, 'pfb')
        self.autocorr    = autocorr.AutoCorr(self.fpga, 'autocorr')
        self.eq          = eq.Eq(self.fpga, 'eq', n_streams=64, n_coeffs=2**9)
        self.eq_tvg      = eqtvg.EqTvg(self.fpga, 'post_eq_tvg', n_streams=64, n_chans=2**12)
        self.reorder     = chanreorder.ChanReorder(self.fpga, 'chan_reorder', n_chans=2**12)
        self.packetizer  = packetizer.Packetizer(self.fpga, 'packetizer')
        self.eth         = eth.Eth(self.fpga, 'eth')
        self.corr        = corr.Corr(self.fpga,'corr_0', n_chans=2**12 // 8) # Corr module collapses channels by 8x

        self.ants = [None] * 64 # An attribute to store the antenna names of this board's inputs
        self.ant_indices = ant_indices or range(64) # An attribute to store the antenna numbers used in packet headers
        
        # The order here can be important, blocks are initialized in the
        # order they appear here
        self.blocks = [
            self.adc,
            self.sync,
            self.noise,
            self.input,
            self.delay,
            self.pfb,
            self.eq,
            self.eq_tvg,
            self.reorder,
            self.packetizer,
            self.eth,
            self.autocorr,
            self.corr,
        ]

    def is_programmed(self):
        """
        Lazy check to see if a board is programmed.
        Check for the "version_version" register. If it exists, the board is deemed programmed.
        Returns:
            True if programmed, False otherwise
        """
        return 'version_version' in self.listdev()

    def initialize(self, read_only=True):
        for block in self.blocks:
            if read_only:
                self._info("Initializing block (read only): %s" % block.name)
            else:
                self._info("Initializing block (writable): %s" % block.name)
            block.initialize(read_only=read_only)

    def get_status_all(self):
        stats = {}
        stats['feng'] = self.get_status()
        for block in self.blocks:
            stats[block.name] = block.get_status()
        return stats

    def print_status_all(self, use_color=True):
        print('Fengine stats:')
        self.print_status(use_color)
        for block in self.blocks:
            print('Block %s stats:' % block.name)
            block.print_status()

    def get_status(self):
        """
        Get FPGA stats.
        returns: Dictionary of stats
        """
        stats = {}
        flags = {}
        stats['programmed'] = self.is_programmed()
        meta = self.fpga.transport.get_metadata()
        stats['flash_firmware'] = meta['filename']
        stats['flash_firmware_md5'] = meta['md5sum']
        stats['timestamp'] = datetime.datetime.now().isoformat()
        stats['serial'] = self.serial
        stats['host'] = self.host
        stats['sw_version'] = __version__
        try:
            stats.update(self.sysmon.get_all_sensors())
            stats['sys_mon'] = 'reporting'
            flags['sys_mon'] = FENG_OK
        except:
            stats['sys_mon'] = 'not reporting'
            flags['sys_mon'] = FENG_ERROR
        if not stats['programmed']:
            flags['programmed'] = FENG_WARNING
        if stats['sw_version'].endswith('dirty'):
            flags['sw_version'] = FENG_WARNING
        if stats['serial'] is None:
            flags['serial'] = FENG_WARNING
        return stats, flags

    def configure_output(self, n_chans_per_packet, chans, ips, ports=None, ants=None):
        """
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
        ports = ports or [10000]*n_packetrs
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
            
        if ants is None:
            ant_indices = [self.ant_indices[0]] * n_packets # Only the first antenna number goes in the header
        else:
            ant_indices = ants

        self.packetizer.write_config(
            packet_starts,
            packet_payloads,
            chans[::n_chans_per_packet],
            ant_indices,
            ips,
            ports,
            print_config=True
        )
