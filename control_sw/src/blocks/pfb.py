import numpy as np

from .block import Block
from lwa_f.error_levels import *

class Pfb(Block):
    _N_CORES = 4 #: Number of FFT sub-cores per PFB block
    DEFAULT_FFT_SHIFT = 2**16-1 #: Default FFT shift
    def __init__(self, host, name, logger=None):
        super(Pfb, self).__init__(host, name, logger)
        self.SHIFT_OFFSET = 0
        self.SHIFT_WIDTH  = 16
        self.STAT_RST_BIT = 18

    def set_fft_shift(self, shift):
        """
        Set the FFT shift schedule.

        :param shift: Shift schedule to be applied.
        :type shift: int
        """
        self.change_reg_bits('ctrl', shift, self.SHIFT_OFFSET, self.SHIFT_WIDTH)

    def get_fft_shift(self):
        """
        Get the currently applied FFT shift schedule.

        :return: Shift schedule
        :rtype: int
        """
        return self.get_reg_bits('ctrl', self.SHIFT_OFFSET, self.SHIFT_WIDTH)

    def rst_stats(self):
        """
        Reset overflow event counters.
        """
        self.change_reg_bits('ctrl', 1, self.STAT_RST_BIT)
        self.change_reg_bits('ctrl', 0, self.STAT_RST_BIT)

    def _get_overflow_count_per_core(self):
        """
        Get the number of FFT overflow events since the last statistics
        reset, per FFT core.

        :return: _N_CORES-element list of overflow counts.
        :rtype: list of int
        """
        core_of_count = []
        for i in range(self._N_CORES):
            core_of_count += [self.read_uint('pfb16x_%d_status' % i)]
        return core_of_count
            
    def get_overflow_count(self):
        """
        Get the total number of FFT overflow events, since the last
        statistics reset.

        :return: Number of overflows
        :rtype: int
        """
        return sum(self._get_overflow_count_per_core())

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - overflow_count (int) : Number of FFT overflow events since last
              statistics reset. Any non-zero value is flagged with "WARNING".

            - fft_shift (str) : Currently loaded FFT shift schedule, formatted
              as a binary string, prefixed with "0b".

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.

        """

        stats = {}
        flags = {}
        stats['overflow_count'] = self.get_overflow_count()
        if stats['overflow_count'] != 0:
            flags['overflow_count'] = FENG_WARNING
        fft_shift = self.get_fft_shift()
        stats['fft_shift'] = '0b%s' % np.binary_repr(fft_shift, width=self.SHIFT_WIDTH)
        return stats, flags
        
    def initialize(self, read_only=False):
        """
        :param read_only: If False, sets FFT shift to the default value, and
            resets the overflow count. If True, do nothing.
        :type read_only: bool
        """
        if read_only:
            return
        self.write_int('ctrl', 0)
        self.set_fft_shift(self.DEFAULT_FFT_SHIFT)
        self.rst_stats()
