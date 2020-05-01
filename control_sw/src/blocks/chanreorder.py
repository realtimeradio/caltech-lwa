import struct

class ChanReorder(Block):
    n_parallel_chans = 8
    map_format = 'L'
    def __init__(self, host, name, n_chans=2**10, logger=None):
        super(ChanReorder, self).__init__(host, name, logger)
        self.n_chans = n_chans

    def set_channel_order(self, order):
        """
        Re-order the channels to that they are
        sent with the order in the specified map
        """
        order = list(order)
        if len(order) != self.n_chans:
            self._error("Tried to reorder channels, but map was the wrong length")
            return
        # We can only reorder blocks of n_parallel_chans, so make sure that the
        # user-provided order respects this limitation
        for i in range(self.n_chans // self.n_parallel_chans):
            block_start = self.n_parallel_chans * i
            block_stop  = (self.n_parallel_chans + 1) * i
            start_chan = order[block_start]
            req_stop_chan = start_chan + self.n_parallel_chans
            assert (order[block_start : block_stop] == list(range(start_chan, req_stop_chan))),
                'Can only reorder channels in blocks of 8'
        order_str = struct.pack('>%d%s' %(self.n_chans,self.map_format), *order)
        self.write('dynamic_map1', order_str)

    def read_reorder(self):
        reorder = self.read('dynamic_map1',1024*4)
        reorder = struct.unpack('>%d%s'%(self.n_chans,self.map_format),reorder)
        return reorder 

    def reindex_channel(self, input_index, output_index):
        """
        Reorder channels range(input_index : input_index + self.n_parallel_chans)
        such that they emerge in positions range(output_index : output_index + self.n_parallel_chans)

        Both `input_index` and `output_index` should be a multiple of `self.n_parallel_chans`
        """
        assert (input_index % self.n_parallel_chans == 0),
            "`input_index` must be a multiple of self.n_parallel_chans"
        assert (output_index % self.n_parallel_chans == 0),
            "`input_index` must be a multiple of self.n_parallel_chans"
        self.write_int('dynamic_map1', input_index, word_offset=output_index)

    def initialize(self):
        self.set_channel_order(np.arange(self.n_chans))
