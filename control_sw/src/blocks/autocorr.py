import time
import struct
import numpy as np

from .block import Block
from lwa_f.error_levels import *

class AutoCorr(Block):
    """
    Instantiate a control interface for an Auto-Correlation block. This
    provides auto-correlation spectra of post-FFT data.

    In order to save FPGA resourece, the auto-correlation block may use a single
    correlation core to compute the auto-correlation of a subset of the total
    number of ADC channels at any given time. This is the case when the
    block is instantiated with ``n_cores > 1`` and ``use_mux=True``.
    In this case, auto-correlation spectra are captured ``n_pols / n_cores``
    channels at a time. 

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param acc_len: Accumulation length initialization value, in spectra.
    :type acc_len: int

    :param n_chans: Number of frequency channels.
    :type n_chans: int

    :param n_pols: Number of individual data streams.
    :type n_pols: int

    :param n_cores: Number of accumulation cores in firmware design.
    :type n_cores: int

    :param use_mux: If True, only one core is instantiated and a multiplexer
        is used to switch different inputs into it. If False, multiple
        cores are instantiated simultaneously in firmware.
    :type use_mux: bool

    :ivar n_pols_per_block: Number of polarization streams handled by a
        single correlation core.
    """
    def __init__(self, host, name,
                 acc_len=2**15,
                 logger=None,
                 n_chans=4096,
                 n_pols=64,
                 n_cores=4,
                 use_mux=True,
                ):
        super(AutoCorr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self._acc_len = acc_len
        self.n_pols = n_pols
        self._n_cores = n_cores
        self._use_mux = use_mux
        self n_pols_per_block = self.n_pols // self._n_cores
   
    def _wait_for_acc(self):
        """
        Block until a new accumulation completes.
        """
        cnt = self.read_uint('acc_cnt')
        while self.read_uint('acc_cnt') < (cnt+1):
            time.sleep(0.1)

    def _set_mux(self, sel):
        """
        Set the core input multiplexer.

        :param sel: Multiplexer select value.
        :type sel: int
        """
        if not self._use_mux:
            return
        if sel >= self._n_cores:
            self.logger.error("Cannot select input %d when there are only %d cores" % (sel, self._n_cores))
            return
        self.write_int('mux_sel', sel)

    def _read_bram(self):
        """ 
        Read RAM containing autocorrelation spectra for all polarizations in a core.

        :return: Array of autocorrelation data, in float32 format. Array
            dimensions are [POLARIZATIONS, FREQUENCY CHANNEL].
        :rtype: numpy.array
        """
        if self._use_mux:
            dout = np.zeros([self.n_pols // self._n_cores, self.n_chans], dtype=np.float32)
            read_loop_range = range(1)
        else:
            dout = np.zeros([self.n_pols, self.n_chans], dtype=np.float32)
            read_loop_range = range(self._n_cores)
        n_words_per_stream = self.n_pols * self.n_chans // self._n_parallel_streams // self._n_cores
        n_pols_per_core = self.n_pols // self._n_cores
        n_chans_per_stream = self.n_chans // self._n_parallel_streams
        for core in read_loop_range:
            for stream in range(self._n_parallel_streams):
                if self._use_mux:
                    ramname = 'common_dout%d_bram' % (stream) # Why call it "common" rather than 0?!
                else:
                    ramname = '%d_dout%d_bram' % (core, stream)
                raw = self.read(ramname, 4*n_words_per_stream)
                x = struct.unpack('>%df' % n_words_per_stream, raw)
                for subpol in range(self.n_pols // self._n_cores):
                    dout[core*n_pols_per_core + subpol, stream::self._n_parallel_streams] = \
                        x[subpol*n_chans_per_stream:(subpol+1)*n_chans_per_stream]
        return dout
    
    def get_new_spectra(self, pol_block=0):
        """
        Get a new average power spectra.

        :param pol_block: If using multiplexing, read data for this polarization
            block. If not using multiplexing, this parameter does nothing, and
            data from all inputs will be returned.
            When multiplexing, Each call will return data for inputs
            ``self.n_pols_per_block x pol_block`` to
            ``self.n_pols_per_block x (pol_block+1) - 1 ``.
        :type pol_block: int

        :return: Float32 array of dimensions [POLARIZATION, FREQUENCY CHANNEL]
            containing autocorrelations with accumulation length divided out.
        :rtype: numpy.array
        """
        if self._use_mux:
            self._set_mux(pol_block)
        self._wait_for_acc()
        spec = self._read_bram() / float(self.get_acc_len())
        return spec

    def plot_spectra(self, pol_block=0, db=True, show=True):
        """
        Plot the spectra of all polarizations in a single pol_block,
        with accumulation length divided out
        
        :param pol_block: If using multiplexing, plot data for this polarization
            block. If not using multiplexing, this parameter does nothing, and
            data from all inputs will be plotted.
            When multiplexing, Each call will plot data for inputs
            ``self.n_pols_per_block x pol_block`` to
            ``self.n_pols_per_block x (pol_block+1) - 1 ``.
        :type pol_block: int

        :param db: If True, plot 10log10(power). Else, plot linear.
        :type db: bool

        :param show: If True, call matplotlib's `show` after plotting
        :type show: bool

        :return: matplotlib.Figure
        """
        from matplotlib import pyplot as plt
        specs = self.get_new_spectra(pol_block)
        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
            specs = 10*np.log10(specs)
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency Channel')
        if self._use_mux:
            channel_offset = pol_block * self.n_pols // self._n_pol_blocks
        else:
            channel_offset = 0
        for speci, spec in enumerate(specs):
            ax.plot(spec, label="pol_%d" % (channel_offset + speci))
        ax.legend()
        if show:
            plt.show()
        return f

    def get_acc_len(self):
        """
        Get the currently loaded accumulation length in units of spectra.

        :return: Current accumulation length
        :rtype: int
        """
        self._acc_len = self.read_int('acc_len')
        return self._acc_len

    def set_acc_len(self, acc_len):
        """
        Set the number of spectra to accumulate.

        :param acc_len: Number of spectra to accumulate
        :type acc_len: int
        """
        assert isinstance(acc_len, int), "Cannot set accumulation length to type %r" % type(acc_len)
        self._acc_len = acc_len
        self.write_int('acc_len',acc_len)

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - acc_len (int) : Currently loaded accumulation length in number of spectra.

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
            self.set_acc_len(self._acc_len)
