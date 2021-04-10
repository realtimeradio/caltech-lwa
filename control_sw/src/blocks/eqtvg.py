import numpy as np
import struct
from .block import Block
from lwa_f.error_levels import *

class EqTvg(Block):
    _FORMAT = 'B'
    def __init__(self, host, name, n_streams=64, n_chans=2**12, logger=None):
        super(EqTvg, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.n_chans = n_chans
        self._stream_size = struct.calcsize(self._FORMAT)*self.n_chans

    def tvg_enable(self):
        self.write_int('tvg_en', 1)

    def tvg_disable(self):
        self.write_int('tvg_en', 0)

    def tvg_is_enabled(self):
        return bool(self.read_int('tvg_en'))
    
    def write_stream_tvg(self, stream, test_vector):
        """
        Write a test vector `tv` to stream number `stream`.
        
        Parameters
        ----------
        stream : int
            Index of stream to which test vectors should be loaded
        test_vector : numpy.Array
            Test vector array, with `self.n_chans` elements
        """
        tv = np.array(test_vector, dtype='>%s'%self._FORMAT)
        assert (tv.shape[0] == self.n_chans), "Test vector should have self.n_chans elements!"
        core_name = 'core%d_tv' % (stream // 16)
        sub_index = stream % 16
        self.write(core_name, tv.tostring(), offset=sub_index*self._stream_size)

    def write_const_per_stream(self):
        """
        Write a constant to all the channels of a stream,
        with stream `i` taking the value `i`
        """
        for stream in range(self.n_streams):
            self.write_stream_tvg(stream, np.ones(self.n_chans)*stream)

    def write_freq_ramp(self):
        """
        Write a frequency ramp to the test vector 
        that is repeated for all antennas. 
        """
        ramp = np.arange(self.n_chans)
        ramp = np.array(ramp, dtype='>%s' %self._FORMAT) # tvg values are only 8 bits
        for stream in range(self.n_streams):
            self.write_stream_tvg(stream, ramp)

    def read_stream_tvg(self, stream):
        """
        Read the test vector loaded to stream number `stream`.
        
        Parameters
        ----------
        stream : int
            Index of stream from which test vectors should be read.

        Returns
        -------
        tv : numpy.Array
            Test vector array.
        """
        core_name = 'core%d_tv' % (stream // 16)
        sub_index = stream % 16
        s = self.read(core_name, self._stream_size, offset=sub_index*self._stream_size)
        tvg = np.fromstring(s, dtype='>%s' %self._FORMAT)
        return tvg

    def get_status(self):
        stats = {}
        flags = {}
        stats['tvg_enabled'] = self.tvg_is_enabled()
        if stats['tvg_enabled']:
            flags['tvg_enabled'] = FENG_NOTIFY
        return stats, flags

    def initialize(self, read_only=False):
        if read_only:
            pass
        else:
            self.tvg_disable()
            self.write_freq_ramp()
