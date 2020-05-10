import logging
import numpy as np
import struct
import time
import datetime
import casperfpga
from . import helpers
from .blocks import sync, noisegen, input, delay, pfb, eq, eqtvg, chanreorder, packetizer, eth, corr

class Snap2Fengine(object):
    def __init__(self, host, ant_indices=None, logger=None):
        self.host = host
        self.logger = logger or helpers.add_default_log_handlers(logging.getLogger(__name__ + "(%s)" % host))
        self.fpga = casperfpga.CasperFpga(host=host, transport=casperfpga.TapcpTransport)
        # Try and get the canonical name of the host
        # to use as a serial number
        try:
            self.serial = socket.gethostbyaddr(self.host)[0]
        except:
            self.serial = None

        # blocks
        #self.adc         = Adc(self.fpga)
        self.sync        = sync.Sync(self.fpga, 'sync')
        self.noise       = noisegen.NoiseGen(self.fpga, 'noise', n_noise=4, n_outputs=64)
        self.input       = input.Input(self.fpga, 'input', n_streams=64)
        self.delay       = delay.Delay(self.fpga, 'delay', n_streams=64)
        self.pfb         = pfb.Pfb(self.fpga, 'pfb')
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
            #self.adc,
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
            self.corr,
        ]

        self.initialized = False

    def is_programmed(self):
        """
        Lazy check to see if a board is programmed.
        Check for the "version_version" register. If it exists, the board is deemed programmed.
        Returns:
            True if programmed, False otherwise
        """
        return 'version_version' in self.fpga.listdev()

    def initialize(self):
        for block in self.blocks:
            self.logger.info("Initializing block: %s" % block.name)
            block.initialize()
        self.initialized = True

    def get_fpga_stats(self):
        """
        Get FPGA stats.
        returns: Dictionary of stats
        """
        stat = {}
        stat['timestamp'] = datetime.datetime.now().isoformat()
        stat['uptime'] = self.sync.uptime()
        stat['pps_count'] = self.sync.count()
        stat['serial'] = self.serial
        return stat

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
