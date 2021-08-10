import time
import struct
import numpy as np
from scipy.signal import medfilt

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

    :param n_parallel_streams: Number of streams processed by the firmware
        module in parallel.
    :type n_parallel_streams: int

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
                 n_parallel_streams=8,
                 n_cores=4,
                 use_mux=True,
                ):
        super(AutoCorr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self._acc_len = acc_len
        self.n_pols = n_pols
        self._n_parallel_streams = n_parallel_streams
        self._n_cores = n_cores
        self._use_mux = use_mux
        self.n_pols_per_block = self.n_pols // self._n_cores

    def get_acc_cnt(self):
        """
        Get the current accumulation count.

        :return count: Current accumulation count
        :rtype count: int
        """
        return self.read_uint('acc_cnt')
   
    def _wait_for_acc(self):
        """
        Block until a new accumulation completes, then return
        the count index.

        :return count: Current accumulation count
        :rtype count: int
        """
        cnt0 = self.get_acc_cnt()
        cnt1 = self.get_acc_cnt()
        # Counter overflow protection
        if cnt1 < cnt0:
            cnt1 += 2**32
        while cnt1 < ((cnt0+1) % (2**32)):
            time.sleep(0.1)
            cnt1 = self.get_acc_cnt()
        return cnt1

    def _set_mux(self, sel):
        """
        Set the core input multiplexer select value.

        :param sel: Multiplexer select value.
        :type sel: int
        """
        if not self._use_mux:
            return
        if sel >= self._n_cores:
            self.logger.error("Cannot select input %d when there are only %d cores" % (sel, self._n_cores))
            return
        self.write_int('mux_sel', sel)

    def _get_mux(self):
        """
        Get the core input multiplexer select value.

        :return sel: Current multiplexer select value
        :rtype sel: int

        """
        return self.read_uint('mux_sel')

    def _read_bram(self):
        """ 
        Read RAM containing autocorrelation spectra for all polarizations in a core.

        :return: Array of autocorrelation data, in float32 format. Array
            dimensions are [POLARIZATIONS, FREQUENCY CHANNEL].
        :rtype: numpy.array
        """
        if self._use_mux:
            dout = np.zeros([self.n_pols_per_block, self.n_chans], dtype=np.float32)
            read_loop_range = range(1)
        else:
            dout = np.zeros([self.n_pols, self.n_chans], dtype=np.float32)
            read_loop_range = range(self._n_cores)
        n_words_per_stream = self.n_pols_per_block * self.n_chans // self._n_parallel_streams
        n_chans_per_stream = self.n_chans // self._n_parallel_streams
        for core in read_loop_range:
            for stream in range(self._n_parallel_streams):
                if self._use_mux:
                    ramname = 'common_dout%d_bram' % (stream) # Why call it "common" rather than 0?!
                else:
                    ramname = '%d_dout%d_bram' % (core, stream)
                raw = self.read(ramname, 4*n_words_per_stream)
                x = struct.unpack('>%df' % n_words_per_stream, raw)
                for subpol in range(self.n_pols_per_block):
                    dout[core*self.n_pols_per_block + subpol, stream::self._n_parallel_streams] = \
                        x[subpol*n_chans_per_stream:(subpol+1)*n_chans_per_stream]
        return dout

    def _arm_readout(self):
        """
        Arm readout buffers to capture the next valid accumlation.
        Once this occurs, the buffers will not be overwritten until
        another arm is issued.
        """
        self.write_int('trig', 0)
        self.write_int('trig', 1)
        self.write_int('trig', 0)
    
    def get_new_spectra(self, pol_block=0, flush_vacc='auto', filter_ksize=None):
        """
        Get a new average power spectra.

        :param pol_block: If using multiplexing, read data for this polarization
            block. If not using multiplexing, this parameter does nothing, and
            data from all inputs will be returned.
            When multiplexing, Each call will return data for inputs
            ``self.n_pols_per_block x pol_block`` to
            ``self.n_pols_per_block x (pol_block+1) - 1``.

        :type pol_block: int

        :param flush_vacc: If ``True``, throw away a spectra before grabbing a valid
            one. This can be useful if the upstream analog settings may have changed
            during the last integration. If ``False``, return the first spectra
            available. If ``'auto'`` perform a flush if the input multiplexer has
            changed positions.
        :type flush_vacc: Bool or string

        :param filter_ksize: If not None, apply a spectral median filter
            with this kernel size. The kernet size should be odd.
        :type filter_ksize: int

        :return: Float32 array of dimensions [POLARIZATION, FREQUENCY CHANNEL]
            containing autocorrelations with accumulation length divided out.
        :rtype: numpy.array

        """

        assert flush_vacc in [True, False, 'auto'], "Don't understand value of `flush_vacc`"
        assert filter_ksize is None or filter_ksize % 2 == 1, "Filter kernel size should be odd"

        auto_flush = False
        if self._use_mux:
            if flush_vacc == 'auto':
                old_mux_state = self._get_mux()
            self._set_mux(pol_block)
            if flush_vacc == 'auto' and pol_block != old_mux_state:
                self._debug("Will auto-flush vacc because multiplexer changed state")
                auto_flush = True
        if flush_vacc == True or auto_flush:
            self._debug("Flushing accumulation")
            self._wait_for_acc()
        self._arm_readout()
        acc_cnt = self._wait_for_acc()
        spec = self._read_bram() / float(self.get_acc_len())
        npols, nchans = spec.shape
        if filter_ksize is not None:
            for pol in range(npols):
                spec[pol] = medfilt(spec[pol], kernel_size=filter_ksize)

        return spec

    def plot_all_spectra(self, db=True, show=True, filter_ksize=None):
        """
        Plot the spectra of all polarizations,
        with accumulation length divided out
        
        :param db: If True, plot 10log10(power). Else, plot linear.
        :type db: bool

        :param show: If True, call matplotlib's `show` after plotting
        :type show: bool

        :param filter_ksize: If not None, apply a spectral median filter
            with this kernel size. The kernet size should be odd.
        :type filter_ksize: int

        :return: matplotlib.Figure

        """
        assert filter_ksize is None or filter_ksize % 2 == 1, "Filter kernel size should be odd"
        from matplotlib import pyplot as plt
        specs = np.zeros([self.n_pols, self.n_chans], dtype=float)
        if self._use_mux:
            for i in range(self._n_cores):
                specs[i*self.n_pols_per_block:(i+1)*self.n_pols_per_block] = \
                    self.get_new_spectra(i, filter_ksize=filter_ksize)
        else:
            specs = self.get_new_spectra(filter_ksize=filter_ksize)
        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
            specs = 10*np.log10(specs)
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency Channel')
        for speci, spec in enumerate(specs):
            ax.plot(spec, label="pol_%d" % (speci))
        ax.legend()
        if show:
            plt.show()
        return f

    def plot_spectra(self, pol_block=0, db=True, show=True, filter_ksize=None):
        """
        Plot the spectra of all polarizations in a single pol_block,
        with accumulation length divided out
        
        :param pol_block: If using multiplexing, plot data for this polarization
            block. If not using multiplexing, this parameter does nothing, and
            data from all inputs will be plotted.
            When multiplexing, Each call will plot data for inputs
            ``self.n_pols_per_block x pol_block`` to
            ``self.n_pols_per_block x (pol_block+1) - 1``.

        :type pol_block: int

        :param db: If True, plot 10log10(power). Else, plot linear.
        :type db: bool

        :param show: If True, call matplotlib's `show` after plotting
        :type show: bool

        :param filter_ksize: If not None, apply a spectral median filter
            with this kernel size. The kernet size should be odd.
        :type filter_ksize: int

        :return: matplotlib.Figure

        """
        assert filter_ksize is None or filter_ksize % 2 == 1, "Filter kernel size should be odd"
        from matplotlib import pyplot as plt
        specs = self.get_new_spectra(pol_block, filter_ksize=filter_ksize)
        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
            specs = 10*np.log10(specs)
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency Channel')
        if self._use_mux:
            channel_offset = pol_block * self.n_pols_per_block
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
