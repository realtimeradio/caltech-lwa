class Packetizer(Block):
    def __init__(self, host, name, n_time_demux=2, logger=None):
        super(Packetizer, self).__init__(host, name, logger)
        self.n_time_demux = n_time_demux
        self.n_slots = 16

    def set_dest_ip(self, ip, slot_offset=0):
        for time_slot in range(self.n_time_demux):
            self.write_int('ips',ip[time_slot], word_offset=(time_slot * self.n_slots + slot_offset))

    def set_ant_header(self, ant, slot_offset=0): 
        for time_slot in range(self.n_time_demux):
            self.write_int('ants', ant, word_offset=(time_slot * self.n_slots + slot_offset))
        
    def set_chan_header(self, chan, slot_offset=0):
        for time_slot in range(self.n_time_demux):
            self.write_int('chans', chan, word_offset=(time_slot*self.n_slots + slot_offset))


    def initialize(self):
        for time_slot in range(self.n_slots):
            self.set_dest_ip([0,0], time_slot)
            self.set_ant_header(0, time_slot)
            self.set_chan_header(0, time_slot)

    def assign_slot(self, slot_num, chans, dests, reorder_block, ant):
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
        reorder_block -- a ChanReorder block object, which allows the
                         packetizer to manipulate the channel ordering of the design. Bit gross. Sorry.
        ants     -- The antenna index of the first antenna on this board. One packet contains 3 antennas

        """
        NCHANS_PER_SLOT = 384
        chans = np.array(chans, dtype='>L')
        if slot_num > self.n_slots:
            raise ValueError("Only %d output slots can be specified" % self.n_slots)
        if chans.shape[0] != NCHANS_PER_SLOT:
            raise ValueError("Each slot must contain %d frequency channels" % NCHANS_PER_SLOT)

        if (type(dests) != list) or (len(dests) != self.n_time_demux):
            raise ValueError("Packetizer requires a list of desitination IPs with %d entries" % self.n_time_demux)

        # Set the frequency header of this slot to be the first specified channel
        self.set_chan_header(chans[0], slot_offset=slot_num)

        # Set the antenna header of this slot (every slot represents 3 antennas
        self.set_ant_header(ant=ant, slot_offset=slot_num)

        # Set the destination address of this slot to be the specified IP address
        self.set_dest_ip(dests, slot_offset=slot_num)

        # set the channel orders
        # The channels supplied need to emerge in the first 384 channels of a block
        # of 512 (first 192 clks of 256clks for 2 pols)
        for cn, chan in enumerate(chans[::8]):
            reorder_block.reindex_channel(chan//8, slot_num*64 + cn)
    def reset(self):
        # stop traffic before reset
        self.disable_tx()
        # toggle reset
        self.change_reg_bits('ctrl', 0, 0)
        self.change_reg_bits('ctrl', 1, 0)
        self.change_reg_bits('ctrl', 0, 0)

    def enable_tx(self):
        self.change_reg_bits('ctrl', 1, 1)

    def disable_tx(self):
        self.change_reg_bits('ctrl', 0, 1)

    def initialize(self):
        #Set ip address of the SNAP
        ipaddr = socket.inet_aton(socket.gethostbyname(self.host.host))
        self.blindwrite('sw', ipaddr, offset=0x10)
        self.set_port(self.port)

    def set_source_port(self, port):
        # see config_10gbe_core in katcp_wrapper
        self.blindwrite('sw', struct.pack('>BBH', 0, 1, port), offset=0x20)
                        
    def print_status(self):
        rv = self.get_status()
        for key in rv.keys():
            print '%12s : %d'%(key,rv[key])
