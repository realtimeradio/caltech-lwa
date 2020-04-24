import logging
import helpers
import numpy as np
import struct
import time
import datetime
import casperfpga
from blocks import *

class Snap2Fengine(object):
    def __init__(self, host, ant_indices=None, logger=None, redishost='redishost'):
        self.host = host
        self.logger = logger or helpers.add_default_log_handlers(logging.getLogger(__name__ + "(%s)" % host))
        if redishost is None:
            self.fpga = casperfpga.CasperFpga(host=host, transport=casperfpga.TapcpTransport)
        else:
            self.fpga = casperfpga.CasperFpga(host=host, redishost=redishost, transport=casperfpga.RedisTapcpTransport)
        # Try and get the canonical name of the host
        # to use as a serial number
        try:
            self.serial = socket.gethostbyaddr(self.host)[0]
        except:
            self.serial = None

        # blocks
        self.adc         = Adc(self.fpga)
        self.sync        = Sync(self.fpga, 'sync')
        self.noise       = NoiseGen(self.fpga, 'noise', n_noise=4, n_outputs=64)
        self.input       = Input(self.fpga, 'input', n_streams=64)
        self.delay       = Delay(self.fpga, 'delay', n_streams=64)
        self.pfb         = Pfb(self.fpga, 'pfb')
        self.eq          = Eq(self.fpga, 'eq_core', n_streams=64, ncoeffs=2**12)
        self.eq_tvg      = EqTvg(self.fpga, 'eqtvg', n_streams=64, nchans=2**12)
        self.reorder     = ChanReorder(self.fpga, 'chan_reorder', nchans=2**12)
        self.packetizer  = Packetizer(self.fpga, 'packetizer', n_time_demux=2) # Round robin time packets to two destinations
        self.eth         = Eth(self.fpga, 'eth')
        self.corr        = Corr(self.fpga,'corr_0', n_chans=2**12 // 8) # Corr module collapses channels by 8x

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
            self.corr,
        ]

        self.initialized = False

    def is_programmed(self):
        """
        Lazy check to see if a board is programmed.
        Check for the "adc16_controller" register. If it exists, the board is deemed programmed.
        Returns:
            True if programmed, False otherwise
        """
        return 'adc16_controller' in self.fpga.listdev()

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

    def assign_slot(self, slot_num, chans, dests):
        """
        The F-engine generates 8192 channels, but can only
        output 6144(=8192 * 3/4), in order to keep within the output data rate cap.
        Each output packet contains 384 frequency channels for a single antenna.
        There are thus effectively 16 output slots, each corresponding
        to a block of 384 frequency channels. Each block can be filled with
        arbitrary channels (they can repeat, if you want), and sent
        to a particular IP address.
        slot_num -- a value from 0 to 15 -- the slot you want to allocate
        chans    -- an array of 384 channels, which you want to put in this slot's packet
        dests     -- A list of IP addresses of the odd and even X-engines for this chan range.

        """
        NCHANS_PER_SLOT = 384
        chans = np.array(chans, dtype='>L')
        if slot_num > self.packetizer.n_slots:
            raise ValueError("Only %d output slots can be specified" % self.packetizer.n_slots)
        if chans.shape[0] != NCHANS_PER_SLOT:
            raise ValueError("Each slot must contain %d frequency channels" % NCHANS_PER_SLOT)

        if (type(dests) != list) or (len(dests) != self.packetizer.n_time_demux):
            raise ValueError("Packetizer requires a list of desitination IPs with %d entries" % self.packetizer.n_time_demux)

        # Set the frequency header of this slot to be the first specified channel
        self.packetizer.set_chan_header(chans[0], slot_offset=slot_num)

        # Set the antenna header of this slot (every slot represents 3 antennas
        self.packetizer.set_ant_header(ant=self.ant_indices[0], slot_offset=slot_num)

        # Set the destination address of this slot to be the specified IP address
        self.packetizer.set_dest_ip(dests, slot_offset=slot_num)

        # set the channel orders
        # The channels supplied need to emerge in the first 384 channels of a block
        # of 512 (first 192 clks of 256clks for 2 pols)
        for cn, chan in enumerate(chans[::8]):
            self.reorder.reindex_channel(chan//8, slot_num*64 + cn)
