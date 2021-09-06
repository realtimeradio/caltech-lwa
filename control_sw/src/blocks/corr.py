import time
import struct
import numpy as np

from .block import Block
from lwa_f.error_levels import *

class Corr(Block):
    """
    Instantiate a control interface for a Correlation block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param acc_len: Accumulation length initialization value, in spectra.
    :type acc_len: int

    :param n_chans: Number of frequency channels in the correlation output.
    :type n_chans: int

    :param n_signals: Number of independent signals which may be correlated.
    :type n_signals: int
    """
    def __init__(self, host, name, acc_len=1024, logger=None, n_chans=1024, n_signals=64):
        super(Corr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self.n_signals = n_signals
        assert self.n_signals <= 2**8 # requirement from the mux control logic
        self.initial_acc_len = acc_len
        self._chan_sum_factor = 8 #: Number of adjacent frequency channels internally summed
        self._input_binary_point = 3 #: Input binary point
   
    def _set_input(self, signal1, signal2):
        """
        Set correlation inputs.

        :param signal1: First (unconjugated) signal index.
        :type signal1: int

        :param signal2: Second (conjugated) signal index.
        :type signal2: int
        """
        assert signal1 < self.n_signals
        assert signal2 < self.n_signals
        self.write_int('input_sel',(signal1 + (signal2<<8)))
 
    def _wait_for_acc(self):
        """
        Block until a new accumulation completes.
        """
        cnt = self.read_uint('acc_cnt')
        while self.read_uint('acc_cnt') < (cnt+1):
            time.sleep(0.1)

    def _read_bram(self):
        """ 
        Read the RAM containing correlation spectra.

        :return: Array of autocorrelation data, in complex int32 format.
        :rtype: numpy.array
        """
        spec = np.array(struct.unpack('>%sl' % (2*self.n_chans), self.read('dout',8*self.n_chans)))
        spec = (spec[0::2]+1j*spec[1::2])
        return spec
    
    def get_new_corr(self, signal1, signal2, flush_vacc=True):
        """
        Get a new correlation.
        Data are returned with summing factor divided out, and normalized to correspond to an input
        signal with real and imaginary parts each having a range of +/- 0.875

        :param signal1: First (unconjugated) signal index.
        :type signal1: int

        :param signal2: Second (conjugated) signal index.
        :type signal2: int

        :param flush_vacc: If True, throw away the first accumulation after
            setting the input selection registers. This is good practice the
            first time a new signal pair is read.
        :type flush_vacc: bool

        :return: Complex-valued cross-correlation spectra of `signal1` and `signal2` with
            accumulation length and frequency summing factor divided out.
        :rtype: numpy.array

        """
        self._set_input(signal1,signal2)
        if flush_vacc:
            self._wait_for_acc()      # Wait two acc_len for new spectra to load
        self._wait_for_acc()
        acc_len = self.get_acc_len()
        spec = self._read_bram()/float(acc_len*self._chan_sum_factor)/(2**(2*self._input_binary_point))
        return spec

    def plot_all_spectra(self, db=False, show=True):
        """
        Plot all auto-correlation spectra, with
        accumulation length divided out.

        :param db: If True, plot 10log10(power). Else, plot linear.
        :type db: bool

        :param show: If True, call matplotlib's `show` after plotting
        :type show: bool

        :return: matplotlib.Figure
        """
        from matplotlib import pyplot as plt

        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency [channel]')
        for i in range(self.n_signals):
            spec = self.get_new_corr(i, i, flush_vacc=True).real
            if db:
                spec = 10*np.log10(spec)
            ax.plot(spec, label="signal_%d" % i)
        ax.legend()
        if show:
            plt.show()
        return f

    def plot_corr(self, signal1, signal2, show=False):
        """
        Plot a correlation spectra, with accumulation length and frequency
        summing factor divided out, and normalized to correspond to an input
        signal with real and imaginary parts each having a range of +/- 0.875

        :param signal1: First (unconjugated) signal index.
        :type signal1: int

        :param signal2: Second (conjugated) signal index.
        :type signal2: int

        :param show: If True, call matplotlib's `show` after plotting
        :type show: bool

        :return: matplotlib.Figure
        """
        from matplotlib import pyplot as plt
        spec = self.get_new_corr(signal1, signal2, flush_vacc=True)
        f,ax = plt.subplots(2,2)
        ax[0][0].plot(spec.real)
        ax[0][0].set_title('Real')
        ax[0][1].plot(spec.imag)
        ax[0][1].set_title('Imag')
        ax[1][0].plot(np.angle(spec))
        ax[1][0].set_title('Phase')
        ax[1][1].plot(10*np.log10(np.abs(spec)))
        ax[1][1].set_title('Power [dB]')            

        if show:
            plt.show()
        return f

    def get_acc_len(self):
        """
        Get the currently loaded accumulation length in units of spectra.

        :return: Current accumulation length
        :rtype: int
        """
        #Convert to spectra from clocks.
        acc_len = self.read_int('acc_len') // self.n_chans
        return acc_len

    def set_acc_len(self,acc_len):
        """
        Set the number of spectra to accumulate.

        :param acc_len: Number of spectra to accumulate
        :type acc_len: int
        """
        assert isinstance(acc_len, int), "Cannot set accumulation length to type %r" % type(acc_len)
        acc_len = self.n_chans*acc_len  # Convert from spectra to FPGA clocks
        self.write_int('acc_len',acc_len)

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - acc_len : Currently loaded accumulation length in number of spectra.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.

        """
        stats = {
            'acc_len': self.get_acc_len(),
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
            self.get_acc_len()
        else:
            self.set_acc_len(self.initial_acc_len)
