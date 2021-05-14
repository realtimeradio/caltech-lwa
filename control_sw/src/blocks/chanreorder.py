import struct
import numpy as np
from .block import Block

class ChanReorder(Block):
    """
    Instantiate a control interface for a Channel Reorder block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param n_chans: Number of channels in the system.
    :type n_chans: int
    """
    n_parallel_chans = 8 #: Number of channels per reorder word
    map_format = 'L'
    def __init__(self, host, name, n_chans=2**10, logger=None):
        super(ChanReorder, self).__init__(host, name, logger)
        self.n_chans = n_chans

    def set_channel_order(self, order):
        """
        Re-order channels so that they are
        sent with the order in the specified map.

        There are various requirements of the map which must be met.

            - Every integer multiple of `self.n_parallel_chans` of the map must
              start on an integer multiple of `n_parallel_chans`.
              Eg., for `n_parallel_chans = 8` `order[0] = 16` is acceptable.
              `order[0] = 4` is not.
            - Blocks of `n_parallel_channels` must be consecutive. Eg., if
              `n_parallel_chans=8`, `order[16:24] = [0,1,2,3,4,5,6,7]` is
              acceptable. `order[16:24] = [0,1,2,3,8,9,10,11]` is not.
            - The provided map must be `self.n_chans` elements long.

        :param order: The order to which data should be mapped. I.e., if
            `order[0] = 16`, then the first channel out of the F-engine
            will be channel 16. The order map should meet the above criteria.
            A ValueError exception will be raised if they are not.
        :type order: list of int
        """
        order = list(order)
        self._debug("Channel reorder map: %s" % order)
        if len(order) != self.n_chans:
            self._error("Tried to reorder channels, but map was the wrong length")
            raise ValueError
        # We can only reorder blocks of n_parallel_chans, so make sure that the
        # user-provided order respects this limitation
        for i in range(self.n_chans // self.n_parallel_chans):
            block_start = self.n_parallel_chans * i
            block_stop  = self.n_parallel_chans * (i + 1)
            start_chan = order[block_start]
            req_stop_chan = start_chan + self.n_parallel_chans
            if not (order[block_start : block_stop] == list(range(start_chan, req_stop_chan))):
                self._info("order[block_start]: %d" % order[block_start])
                self._info("order[block_stop]: %d" % order[block_stop])
                self._info("start_chan: %d" % start_chan)
                self._info("req_stop_chan: %d" % req_stop_chan)
                self._error('Can only reorder channels in blocks of 8')
                raise ValueError
        # The order to be written should reindex taking into account the parallel channels
        order_to_write = [x // 8 for x in order[::self.n_parallel_chans]]
        order_str = struct.pack('>%d%s' %(self.n_chans // self.n_parallel_chans, self.map_format),
                                   *order_to_write)
        self.write('dynamic_map1', order_str)

    def read_reorder(self, raw=False):
        """
        Read the currently loaded reorder map.

        :param raw: If True, return the map as loaded onto the FPGA. If False,
            return the resulting channel map -- i.e., the channel ordering
            being output by this F-engine.
        :type raw: bool

        :return: The reorder map currently loaded.
        :rtype: list
        """
        reorder = self.read('dynamic_map1', 4 * self.n_chans // self.n_parallel_chans)
        reorder = struct.unpack('>%d%s'%(self.n_chans // self.n_parallel_chans, self.map_format), reorder)
        if raw:
            # Return the actual contents of the underlying map
            return reorder 
        else:
            # Expand the order to obtain actual channel numbers
            # irrespective of the underlying number of parallel channels
            expanded_order = []
            for i in reorder:
                expanded_order += list(range(i * self.n_parallel_chans, (i + 1) *  self.n_parallel_chans))
            return expanded_order

    #def reindex_channel(self, input_index, output_index):
    #    """
    #    Reorder channels range(input_index : input_index + self.n_parallel_chans)
    #    such that they emerge in positions range(output_index : output_index + self.n_parallel_chans)

    #    Both `input_index` and `output_index` should be a multiple of `self.n_parallel_chans`
    #    """
    #    assert (input_index % self.n_parallel_chans == 0), \
    #        "`input_index` must be a multiple of self.n_parallel_chans"
    #    assert (output_index % self.n_parallel_chans == 0), \
    #        "`input_index` must be a multiple of self.n_parallel_chans"
    #    self.write_int('dynamic_map1', input_index, word_offset=output_index)

    def initialize(self, read_only=False):
        """
        Initialize the block.

        :param read_only: If True, this method is a no-op. If False,
            initialize the block with the identity map. I.e., map channel
            `n` to channel `n`.
        :type read_only: bool
        """
        if read_only:
            pass
        else:
            self.set_channel_order(np.arange(self.n_chans))
