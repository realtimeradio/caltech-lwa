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
    def __init__(self, host, logger=None):
        self.hostname = host
        self._cfpga = casperfpga.CasperFpga(
                        host=self.hostname,
                        transport=casperfpga.TapcpTransport,
                    )

        # blocks
        self.fpga        = fpga.Fpga(self._cfpga, "")
        self.adc         = adc.Adc(self._cfpga, 'adc')
        self.sync        = sync.Sync(self._cfpga, 'sync')
        self.noise       = noisegen.NoiseGen(self._cfpga, 'noise', n_noise=3, n_outputs=64)
        self.input       = input.Input(self._cfpga, 'input', n_streams=64)
        self.delay       = delay.Delay(self._cfpga, 'delay', n_streams=64)
        self.pfb         = pfb.Pfb(self._cfpga, 'pfb')
        self.autocorr    = autocorr.AutoCorr(self._cfpga, 'autocorr')
        self.eq          = eq.Eq(self._cfpga, 'eq', n_streams=64, n_coeffs=2**9)
        self.eq_tvg      = eqtvg.EqTvg(self._cfpga, 'post_eq_tvg', n_streams=64, n_chans=2**12)
        self.reorder     = chanreorder.ChanReorder(self._cfpga, 'chan_reorder', n_chans=2**12)
        self.packetizer  = packetizer.Packetizer(self._cfpga, 'packetizer')
        self.eth         = eth.Eth(self._cfpga, 'eth')
        self.corr        = corr.Corr(self._cfpga,'corr_0', n_chans=2**12 // 8) # Corr module collapses channels by 8x

        # The order here can be important, blocks are initialized in the
        # order they appear here
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
        for blockname, block in self.blocks.items():
            if read_only:
                self.logger.info("Initializing block (read only): %s" % blockname)
            else:
                self.logger.info("Initializing block (writable): %s" % blockname)
            block.initialize(read_only=read_only)

    def get_status_all(self):
        stats = {}
        for blockname, block in self.blocks.items():
            stats[blockname] = block.get_status()
        return stats

    def print_status_all(self, use_color=True):
        print('Fengine stats:')
        self.print_status(use_color)
        for blockname, block in self.blocks.items():
            print('Block %s stats:' % blockname)
            block.print_status()

    def configure_output(self, base_ant, n_chans_per_packet, chans, ips, ports=None, ants=None):
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
