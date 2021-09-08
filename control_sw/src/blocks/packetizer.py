import numpy as np
import struct

from .block import Block

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

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param n_chans: Number of frequency channels in the correlation output.
    :type n_chans: int

    :param n_signals: Number of independent analog streams in the system
    :type n_signals: int

    :param sample_rate_mhz: ADC sample rate in MHz. Used for data rate checks.
    :type sample_rate_mhz: float
    """
    sample_width = 1 # Sample width in bytes: 4+4bit complex = 1 Byte
    word_width = 32 # Granularity of packet size in Bytes
    line_rate_gbps = 40 # Link speed in Gbits/s
    def __init__(self, host, name, n_chans=4096, n_signals=64, sample_rate_mhz=200.0, logger=None):
        super(Packetizer, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self.n_signals = n_signals
        self.sample_rate_mhz = sample_rate_mhz
        self.n_total_words = self.sample_width * self.n_chans * self.n_signals // self.word_width
        self.n_words_per_chan = self.sample_width * self.n_signals // self.word_width
        assert self.n_words_per_chan > 1, \
            "Packetizer software not compatible with n_signals / word_width combination"
        self.full_data_rate_gbps = 8*self.sample_width * self.n_signals * self.sample_rate_mhz*1e6/2. / 1.0e9

    def get_packet_info(self, n_pkt_chans, occupation=0.95, chan_block_size=8):
        """
        Get the packet boundaries for packets containing a given number of
        frequency channels.
        

        :param n_pkt_chans: The number of channels per packet.
        :type n_pkt_chans: int

        :param occupation: The maximum allowed throughput capacity of the underlying link.
            The calculation does not include application or protocol overhead,
            so must necessarily be < 1.
        :type occupation: float

        :param chan_block_size: The granularity with which we can start packets.
            I.e., packets must start on an n*`chan_block` boundary.
        :type chan_block_size: int

        :return: packet_starts, packet_payloads, channel_indices

            ``packet_starts`` : list of ints
                The word indexes where packets start -- i.e., where headers should be
                written.
                For example, a value [0, 1024, 2048, ...] indicates that headers
                should be written into underlying brams at addresses 0, 1024, etc.
            ``packet_payloads`` : list of range()
                The range of indices where this packet's payload falls. Eg:
                [range(1,257), range(1025,1281), range(2049,2305), ... etc]
                These indices should be marked valid, and the last given an EOF.
            ``channel_indices`` : list of range()
                The range of channel indices this packet will send. Eg:
                [range(1,129), range(1025,1153), range(2049,2177), ... etc]
                Channels to be sent should be re-indexed so that they fall into
                these ranges.
        """
        assert occupation < 1, "Link occupation must be < 1"
        pkt_size = n_pkt_chans * self.n_words_per_chan * self.word_width
        assert pkt_size <= 8192, "Can't send packets > 8192 bytes!"

        # Figure out what fraction of channels we can fit on the link
        self._info("Full data rate is %.2f Gbps" % self.full_data_rate_gbps)
        chan_frac = occupation * self.line_rate_gbps / self.full_data_rate_gbps
        self._info("%.2f link occupation => Max %.2f bandwidth sent" % (occupation, chan_frac))
        # Round down to an integer number of channels
        n_sent_chans = int(np.floor(chan_frac * self.n_chans))
        self._info("%.2f link occupation => Max %.d channels sent" % (occupation, n_sent_chans))
        # Round down to a whole number of packets
        n_pkts = (n_sent_chans // n_pkt_chans)
        n_sent_chans = n_pkt_chans * n_pkts
        self._info("Will allocate %d channels in %d packets" % (n_sent_chans, n_pkts))

        # Channels can only be sent in positions which are a multiple of chan_block_size
        possible_chan_starts = range(0, self.n_chans, chan_block_size)
        # Start words are these values scaled by number of words per channel _and_
        # with 1 added -- data are delayed by 1 so that we can insert a header before word 0
        possible_start_words = [(c*self.n_words_per_chan + 1) for c in possible_chan_starts]

        # Now figure out how many of the total words we're going to use and divide up the deadtime
        # Reckon on using a full n_words_per_chan block for a header, even though a header
        # only needs a single word.
        n_words_used = (n_sent_chans + n_pkts) * self.n_words_per_chan
        spare_words = self.n_total_words - n_words_used # This is necessarily a multiple of n_words_per_chan
        self._info("Number of words used: %d" % n_words_used)
        self._info("Number of words spare: %d" % spare_words)
        assert spare_words % self.n_words_per_chan == 0, "This shouldn't be possible!"
        assert spare_words >= 0, "Configuration doesn't have space for header words"
        # Allocate enough words per packet for the data and header
        spare_chans_per_packet = ((self.n_chans - n_sent_chans) // n_pkts)
        self._info("Number of spare chans per packet: %d" % spare_chans_per_packet)
        spare_chans_per_packet = chan_block_size * ((spare_chans_per_packet // chan_block_size)-1)
        self._info("Using %d spare chans per packet" % spare_chans_per_packet)
        packet_starts = []
        packet_payloads = []
        channel_indices = []
        w_cnt = 0
        for pkt in range(n_pkts):
            packet_starts += [w_cnt]
            w_cnt += 1
            # Find place we can start a payload
            for i in possible_start_words:
                if i >= w_cnt:
                    w_cnt = i
                    break
            packet_payloads += [range(w_cnt, w_cnt + n_pkt_chans * self.n_words_per_chan)]
            # And which channels would these be?
            channel_indices += [range(w_cnt // self.n_words_per_chan,
                                      w_cnt // self.n_words_per_chan + n_pkt_chans)]
            w_cnt += n_pkt_chans * self.n_words_per_chan
            assert (w_cnt < self.n_total_words), \
                "Packet %d: Tried to allocate word %d > %d" % (pkt, w_cnt, self.n_total_words)
            # Add in padding space
            w_cnt += spare_chans_per_packet * self.n_words_per_chan
        return packet_starts, packet_payloads, channel_indices
        
    def write_config(self, packet_starts, packet_payloads, channel_indices,
            ant_indices, dest_ips, dest_ports, nchans_per_packet, nchans_per_xeng,
            n_signals_per_packet, n_signals_per_xeng, print_config=False):
        """
        Write the packetizer configuration BRAMs with appropriate entries.

        :param packet_starts:
            Word-indices which are the first entry of a packet and should
            be populated with headers (see `get_packet_info()`)
        :type packet_starts: list of int

        :param packet_payloads:
            Word-indices which are data payloads, and should be mared as
            valid (see `get_packet_info()`)
        :type packet_payloads: list of range()s

        :param channel_indices:
            Header entries for the channel field of each packet to be sent
        :type channel_indices: list of ints

        :param ant_indices:
            Header entries for the antenna field of each packet to be sent
        :type ant_indices: list of ints

        :param dest_ips: list of str
            IP addresses for each packet to be sent.
        :type dest_ips:

        :param dest_ports:
            UDP destination ports for each packet to be sent.
        :type dest_ports: list of int

        :param nchans_per_packet: Number of frequency channels per packet sent.
        :type nchans_per_packet: int

        :param nchans_per_xeng: Total number of frequency channels sent to each
            destination IP.
        :type nchans_per_xeng: int

        :param n_signals_per_packet: Number of signals in each packet sent.
        :type n_signals_per_packet: int

        :param n_signals_per_xeng: Number of signals expected by each destination IP.
        :type n_signals_per_xeng: int

        :param print:
            If True, print config for debugging
        :type print: bool

        All parameters should have identical lengths.
        """

        def format_flags(is_header=False, is_valid=False, is_eof=False):
            flags = (int(is_eof) << 16) + (int(is_valid) << 8) + (int(is_header) << 0)
            return flags

        def deformat_flags(f):
            is_eof = bool((f >> 16) & 1)
            is_vld = bool((f >>  8) & 1)
            is_hdr = bool((f >>  0) & 1)
            return is_hdr, is_vld, is_eof

        def ip2int(x):
            octets = list(map(int, x.split('.')))
            ip = 0
            ip += (octets[0] << 24)
            ip += (octets[1] << 16)
            ip += (octets[2] << 8)
            ip += (octets[3] << 0)
            return ip

        n_packets = len(packet_starts)
        assert len(packet_payloads) == n_packets
        assert len(channel_indices) == n_packets
        assert len(ant_indices) == n_packets
        assert len(dest_ips) == n_packets
        assert len(dest_ports) == n_packets

        chans = [0] * self.n_total_words
        ants  = [0] * self.n_total_words 
        ips   = [0] * self.n_total_words 
        ports = [0] * self.n_total_words
        flags = [0] * self.n_total_words 

        for i in range(n_packets):
            channel_index = channel_indices[i]
            channel_block_id = (channel_index % nchans_per_xeng ) // nchans_per_packet
            chans[packet_starts[i]] = (channel_block_id << 24) + channel_index
            #print(channel_index, channel_block_id, chans[packet_starts[i]])
            ants[packet_starts[i]]  = ant_indices[i]
            flags[packet_starts[i]] = format_flags(is_header=True, is_valid=True)
            for w in packet_payloads[i]:
                flags[w] = format_flags(is_header=False, is_valid=True)
            # Insert the Destination IP synchronous with the EOF
            ips[w]   = ip2int(dest_ips[i])
            ports[w]   = dest_ports[i]
            # Overwrite the last entry with the EOF
            flags[w] = format_flags(is_header=False, is_valid=True, is_eof=True)

        self.write('chans', struct.pack('>%dI' % self.n_total_words, *chans))
        self.write('ants',  struct.pack('>%dI' % self.n_total_words, *ants))
        self.write('ips',   struct.pack('>%dI' % self.n_total_words, *ips))
        self.write('ports', struct.pack('>%dI' % self.n_total_words, *ports))
        self.write('flags', struct.pack('>%dI' % self.n_total_words, *flags))

        self.write_int('n_pols', (n_signals_per_packet<<16) + n_signals_per_xeng)
        self.write_int('n_chans', (nchans_per_packet<<16) + nchans_per_xeng)

        if print_config:
            for i in range(self.n_total_words):
                is_hdr, is_vld, is_eof = deformat_flags(flags[i])
                print('%4d: %4d %3d %.5d 0x%.8x' % (i, chans[i], ants[i], ports[i], ips[i]), end=' ')
                if is_vld:
                    print('valid', end=' ')
                if is_hdr:
                    print('header', end=' ')
                if is_eof:
                    print('EOF', end=' ')
                print()
