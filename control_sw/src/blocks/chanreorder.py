class ChanReorder(Block):
    def __init__(self, host, name, nchans=2**10, logger=None):
        super(ChanReorder, self).__init__(host, name, logger)
        self.nchans = nchans
        self.format = 'L'

    def set_channel_order(self, order):
        """
        Re-order the channels to that they are
        sent with the order in the specified map
        """
        order = list(order)
        if len(order) != self.nchans:
            self._error("Tried to reorder channels, but map was the wrong length")
            return
        order_str = struct.pack('>%d%s' %(self.nchans,self.format), *order)
        self.write('reorder3_map1', order_str)

    def read_reorder(self, slot_num=None):
        reorder = self.read('reorder3_map1',1024*4)
        reorder = struct.unpack('>%d%s'%(self.nchans,self.format),reorder)
        if slot_num: 
            return reorder[slot_num*64:(slot_num*64)+(384//8)]
        else:
            return reorder 

    def reindex_channel(self, actual_index, output_index):
        self.write_int('reorder3_map1', actual_index, word_offset=output_index)

    def initialize(self):
        self.set_channel_order(np.arange(self.nchans))
