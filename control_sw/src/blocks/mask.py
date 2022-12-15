import time
import struct

from .block import Block
from lwa_f.error_levels import *

class Mask(Block):
    """
    Instantiate a control interface for a Mask block, which performs
    zeroing of spectra based on a runtime-programmable power threshold.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param acc_len: Accumulation length initialization value, in spectra.
    :type acc_len: int

    :param n_chans: Number of frequency channels in a spectra.
    :type n_chans: int

    :param n_signals: Number of independent signals being processed by this block
    :type n_signals: int

    :param n_cores: Number of independent masking cores
    :type n_cores: int

    :param flag_threshold: Flag threshold intialization value
    :type flag_threshold: float

    """
    def __init__(self, host, name, acc_len=240000, logger=None, n_chans=4096,
                 n_cores=4, n_signals=64, flag_threshold):
        super(Corr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self.n_signals = n_signals
        self.n_cores = n_cores
        assert self.n_signals % self.n_cores == 0
        self._n_signals_per_core = self.n_signals // self.n_cores
        self.initial_acc_len = acc_len
        self.initial_flag_threshold = flag_threshold
        self._input_binary_point = 17 #: Input data binary point
   
    def _wait_for_acc(self):
        """
        Block until a new accumulation completes.

        :return: Current accumulation count at time of function return
        :rtype: int
        """
        cnt = self.get_current_acc_count()
        while self.get_current_acc_count() < (cnt+1):
            time.sleep(0.1)
        return = self.get_current_acc_count()

    def get_current_acc_count(self):
        """
        Get the accumulation count of the last completed accumulation.

        :return: Accumulation count
        :rtype: int
        """
        return = self.read_uint('acc_cnt')

    def set_acc_start_time(self, tt):
        """
        Set the Telescope Time which should be used as the start
        boundary for future accumulations.

        :param tt: Telescope Time, in units of FPGA clock ticks since UNIX epoch
        :type tt: int
        """
        # Check that the start time is on an allowed FFT boundary
        fft_size = self.n_chans * 2
        assert tt % fft_size == 0, "Time must be an FFT boundary"
        tt_lsb = tt & 0xffffffff
        tt_msb = (tt >> 32) & 0xffffffff
        self.write_int('target_tt_msb', tt_msb)
        self.write_int('target_tt_lsb', tt_lsb)
        # Ideally would be able to check if this is in the past/future
        # and by how much...

    def set_flag_threshold(self, v):
        """
        Set the flag threshold. If the sum of power in a spectra
        is greater than this value, the spectra is replaced with zeroes,
        and the flag accumulation count is incremented by 1.

        :param v: Threshold level
        :type v: float
        """
        v *= 2**self._input_binary_point
        assert v < 2**32, "Threshold exceeded maximum allowed"
        self.write_int('threshold', v)

    def get_flag_threshold(self):
        """
        Get the flag threshold. If the sum of power in a spectra
        is greater than this value, the spectra is replaced with zeroes,
        and the flag accumulation count is incremented by 1.

        :return: Threshold level
        :rtype: float
        """
        v = self.read_uint('threshold')
        v /= 2**self._input_binary_point
        return v

    def _read_vaccs(self):
        """ 
        Read the flag vacc outputs.

        :return: Array of flag counts, where element `i` holds the number of
            spectra flagged in the last accumulation period.
        :rtype: list(int)
        """
        r = b''
        for core in range(self._n_cores):
            r += self.read('core%d_flag_count' % core, 4*self._n_signals_per_core)
        v = struct.unpack('>%dI' % self._n_signals, r)
        return v
    
    def get_flag_count(self):
        """
        Get the next accumulation's flag counts.

        :return: Array of flag counts, where element `i` holds the number of
            spectra flagged in the last accumulation period.
        :rtype: list(int)
        """
        this_acc = self._wait_for_acc()
        v = self._read_vaccs()
        if self.get_current_acc_count() != this_acc:
            self._error("Took too long to read out flag accumulator. An integration was missed")
        return v

    def get_acc_len(self):
        """
        Get the currently loaded accumulation length in units of spectra.

        :return: Current accumulation length
        :rtype: int
        """
        acc_len = self.read_int('acc_len')
        return acc_len

    def set_acc_len(self,acc_len):
        """
        Set the number of spectra to accumulate.

        :param acc_len: Number of spectra to accumulate
        :type acc_len: int
        """
        assert isinstance(acc_len, int), "Cannot set accumulation length to type %r" % type(acc_len)
        self.write_int('acc_len',acc_len)

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - acc_len : Currently loaded accumulation length in number of spectra.
            - flag_threshold : Currently loaded flagging threshold.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.

        """
        stats = {
            'acc_len': self.get_acc_len(),
            'flag_threshold': self.get_flag_threshold(),
        }
        flags = {}
        return stats, flags

    def initialize(self, read_only=False):
        """
        Initialize the block, setting (or reading) the accumulation length.

        :param read_only: If False, set the accumulation length to the value provided
            when this block was instantiated. If True, use whatever accumulation length
            is currently loaded.
        :type read_only: bool
        """
        if read_only:
            continue
        else:
            self.set_acc_len(self.initial_acc_len)
            self.set_flag_threshold(self.initial_flag_threshold)
