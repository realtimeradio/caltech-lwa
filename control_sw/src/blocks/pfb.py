import numpy as np

from .block import Block
from lwa_f.error_levels import *

class Pfb(Block):
    N_CORES = 4
    def __init__(self, host, name, logger=None):
        super(Pfb, self).__init__(host, name, logger)
        self.SHIFT_OFFSET = 0
        self.SHIFT_WIDTH  = 16
        self.STAT_RST_BIT = 18

    def set_fft_shift(self, shift):
        self.change_reg_bits('ctrl', shift, self.SHIFT_OFFSET, self.SHIFT_WIDTH)

    def get_fft_shift(self):
        return self.get_reg_bits('ctrl', self.SHIFT_OFFSET, self.SHIFT_WIDTH)

    def rst_stats(self):
        self.change_reg_bits('ctrl', 1, self.STAT_RST_BIT)
        self.change_reg_bits('ctrl', 0, self.STAT_RST_BIT)

    def _get_overflow_count_per_core(self):
        core_is_of = []
        for i in range(self.N_CORES):
            core_is_of += [self.read_uint('pfb16x_%d_status' % i) != 0]
        return core_is_of
            
    def get_overflow_count(self):
        return sum(self._get_overflow_count_per_core())

    def get_status(self):
        stats = {}
        flags = {}
        stats['overflow_count'] = self.get_overflow_count()
        if stats['overflow_count'] != 0:
            flags['overflow_count'] = FENG_WARNING
        fft_shift = self.get_fft_shift()
        stats['fft_shift'] = '0b%s' % np.binary_repr(fft_shift, width=self.SHIFT_WIDTH)
        return stats, flags
        
    def initialize(self, read_only=False):
        if read_only:
            return
        self.write_int('ctrl', 0)
        self.set_fft_shift(0b110101010101)
        self.rst_stats()
