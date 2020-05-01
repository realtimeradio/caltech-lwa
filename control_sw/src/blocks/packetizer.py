class Packetizer(Block):
    """
    The packetizer block allows dynamic definition of
    packet sizes and contents.
    In firmware, it is a simple block which allows
    insertion of header entries  and EOFs at any point in the
    incoming data stream.
    It is up to the user to configure this block such that it
    behaves in a reasonable manner -- i.e.
       - Output data rate does not overflow the downstream Ethernet core
       - Packets have a reasonable size
       - EOFs and headers are correctly placed.
    """
    sample_width = 1 # Sample width in bytes: 4+4bit complex = 1 Byte
    word_width = 32 # Granularity of packet size in Bytes
    line_rate_gbps = 40 # Link speed in Gbits/s
    def __init__(self, host, name, n_chans=4096, n_pols=64, sample_rate_mhz=200.0, logger=None):
        super(Packetizer, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self.n_pols = n_pols
        self.sample_rate_mhz = sample_rate_mhz
        self.n_total_words = self.sample_width * self.n_chans * self.n_pols // self.word_width
        self.n_words_per_chan = self.sample_width * self.n_pols // self.word_width
        assert self.n_words_per_chan > 1,
            "Packetizer software not compatible with n_pols / word_width combination"
        self.full_data_rate_gbps = 8*self.sample_width * self.n_pols * self.n_chans * self.sample_rate_mhz*1e6 / 1.0e9

    def get_packet_info(self, n_pkt_chans, occupation=0.95):
        """
        Get the packet boundaries for packets with payload sizes
        `n_bytes`.
        
        Parameters
        ----------
        n_pkt_chans : int
            The number of channels per packet.
        occupation : float
            The maximum allowed throughput capacity of the underlying link.
            The calculation does not include application or protocol overhead,
            so must necessarily be < 1.
        sample_rate : float
            The ADC sampling rate, in MHz. Used to assess link occupation

        Returns
        -------
        packet_starts, packet_payloads, channel_indices

        packet_starts : list of ints
            The word indexes where packets start -- i.e., where headers should be
            written.
            For example, a value [0, 1024, 2048, ...] indicates that headers
            should be written into underlying brams at addresses 0, 1024, etc.
        packet_payloads : list of range()
            The range of indices where this packet's payload falls. Eg:
            [range(1,257), range(1025,1281), range(2049,2305), ... etc]
            These indices should be marked valid, and the last given an EOF.
        channel_indices : list of range()
            The range of channel indices this packet will send. Eg:
            [range(1,129), range(1025,1153), range(2049,2177), ... etc]
            Channels to be sent should be re-indexed so that they fall into
            these ranges.
        """
        assert occupation < 1, "Link occupation must be < 1"
        pkt_size = n_pkt_chans * self.n_words_per_chan * self.word_width
        assert pkt_size <= 8192, "Can't send packets > 8192 bytes!"

        # Figure out what fraction of channels we can fit on the link
        self.logger.info("Full data rate is %.2f Gbps" % self.full_data_rate_gbps)
        chan_frac = occupation * self.line_rate_gbps / self.full_data_rate_gbps
        self.logger.info("%.2f link occupation => %.2f bandwidth sent" % (occupation, chan_frac))
        # Round down to an integer number of channels
        n_sent_chans = int(np.floor(chan_frac * self.n_chans))
        self.logger.info("%.2f link occupation => %.d channels sent" % (occupation, n_sent_chans))
        # Round down to a whole number of packets
        n_pkts = (n_sent_chans // n_pkt_chans)
        n_sent_chans = n_pkt_chans * n_pkts
        self.logger.info("Will send %d channels in %d packets" % (n_sent_chans, n_pkts))
        # Now figure out how many of the total words we're going to use and divide up the deadtime
        # Reckon on using a full n_words_per_chan block for a header, even though a header
        # only needs a single word.
        n_words_used = (n_sent_chans + n_pkts) * self.n_words_per_chan
        spare_words = self.n_total_words - n_words_used # This is necessarily a multiple of n_words_per_chan
        assert spare_words % self.n_words_per_chan == 0, "This shouldn't be possible!"
        assert spare_words >= 0, "Configuration doesn't have space for header words"
        # Allocate enough words per packet for the data and header
        n_words_per_packet = (n_sent_chans + 1) * self.n_words_per_chan
        spare_words_per_packet = ((spare_words // self.n_words_per_chan) // n_pkts) * self.n_words_per_chan
        packet_starts = np.arange(n_pkts) * (n_words_per_packet + spare_words_per_packet)
        packet_payloads = []
        channel_indices = []
        for i in range(n_pkts):
            # Payload starts after the header, for which we've allocated n_words_per_chan
            packet_payloads += packet_starts[i] + self.n_words_per_chan
            channel_indices += packet_payloads[i] // self.n_words_per_chan
        return packet_starts, packet_payloads, channel_indices
        
    def write_config(self, packet_starts, packet_payloads, channel_indices, ant_indices, ips, print_config=False):
        """
        Write the packetizer configuration BRAMs with appropriate entries.

        Parameters
        ----------
        packet_starts : list of ints
            Word-indices which are the first entry of a packet and should
            be populated with headers (see `get_packet_info()`)
        packet_payloads : list of range()s
            Word-indices which are data payloads, and should be mared as
            valid (see `get_packet_info()`)
        channel_indices : list of ints
            Header entries for the channel field of each packet to be sent
        ant_indices : list of ints
            Header entries for the antenna field of each packet to be sent
        ips : list of str
            IP addresses for each packet to be sent.
        print : bool
            If True, print config for debugging

        All parameters should have identical lengths.
        """

        def format_flags(is_header=False, is_valid=False, is_eof=False):
            flags = (int(is_eof) << 16) + (int(is_vld) << 8) + (int(is_header) << 0)
            return flags

        def deformat_flags(f):
            is_eof = bool((f >> 16) & 1)
            is_vld = bool((f >>  8) & 1)
            is_hdr = bool((f >>  0) & 1)
            return is_hdr, is_vld, is_eof

        n_packets = len(packet_starts)
        assert len(packet_payloads) == n_packets
        assert len(channel_indices) == n_packets
        assert len(ant_indices) == n_packets
        assert len(ips) == n_packets

        chans = [0] * self.n_total_words
        ants  = [0] * self.n_total_words 
        ips   = [0] * self.n_total_words 
        flags = [0] * self.n_total_words 

        for i in range(n_packets):
            chans[packet_starts[i]] = pack(channel_indices[i])
            ants[packet_starts[i]]  = pack(ant_indices[i])
            ips[packet_starts[i]]   = pack(ips[i])
            flags[packet_starts[i]] = pack(format_flags(is_header=True, is_valid=True))
            for w in packet_payloads[i]:
                flags[w] = format_flags(is_header=False, is_valid=True)
            # Overwrite the last entry with the EOF
	    flags[w] = format_flags(is_header=False, is_valid=True, is_eof=True)

        self.write('chans', struct.pack('>%dL' % self.n_total_words, *chans))
        self.write('ants',  struct.pack('>%dL' % self.n_total_words, *ants))
        self.write('ips',   struct.pack('>%dL' % self.n_total_words, *ips))
        self.write('flags', struct.pack('>%dL' % self.n_total_words, *flags))

        if print_config:
            for i in range(self.n_total_words):
                is_hdr, is_vld, is_eof = deformat_flags(flags[i])
                print('%4d: %4d %3d 0x%.8x' % (i, chans[i], ants[i], ips[i]), end=' ')
                if is_vld:
                    print('valid', end=' ')
                if is_hdr:
                    print('header', end=' ')
                if is_eof:
                    print('EOF', end=' ')
                print()
