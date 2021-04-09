import time
import struct
import numpy as np

from .block import Block
from lwa_f.error_levels import *

class AutoCorr(Block):
    def __init__(self, host, name,
                 acc_len=2**15,
                 logger=None,
                 n_chans=4096,
                 n_pols=64,
                 n_parallel_streams=8,
                 n_cores=4,
                 use_mux=True,
                ):
        """
        Instantiate an correlation block, which allows correlation
        of pairs of inputs to be computed.
        
        Inputs:
            host (casperfpga.CasperFpga): Host FPGA object
            name (string): Name (in simulink) of this block
            acc_len (int): Number of spectra to accumulate
            n_chans (int) : Number of frequency channels output
            n_pols (int) : Number of polarizations processed
            n_parallel_streams (int) : Number of parallel data channels processed
            n_firmware_cores (int) : Number of firmware autocorr submodules
            use_mux (bool) : If True, multiplex streams into a common core
        """
        super(AutoCorr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self._acc_len = acc_len
        self.n_pols = n_pols
        self._n_parallel_streams = n_parallel_streams
        self._n_cores = n_cores
        self._use_mux = use_mux
   
    def _wait_for_acc(self):
        """
        Wait for a new accumulation to complete.
        """
        cnt = self.read_uint('acc_cnt')
        while self.read_uint('acc_cnt') < (cnt+1):
            time.sleep(0.1)

    def _set_mux(self, sel):
        """
        Set the core input multiplexer to input `sel`
        """
        if not self._use_mux:
            return
        if sel >= self._n_cores:
            self.logger.error("Cannot select input %d when there are only %d cores" % (sel, self._n_cores))
            return
        self.write_int('mux_sel', sel)

    def _read_bram(self):
        """ 
        Reads ram containing autocorrelation spectra for all polarizations.
        Returns:
            numpy array containing uint64 autocorrelation spectra
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
    
    def get_new_spectra(self, core_block=0):
        """
        Get a new accumulation.
        Inputs:
            core_block (int) : If using multiplexing, read input block ID `core_block`
        Returns: numpy array of shape(n_pol, n_chans), containing
                 autocorrelations with accumulation length divided out.

        """
        if self._use_mux:
            self._set_mux(core_block)
        self._wait_for_acc()
        spec = self._read_bram() / float(self.get_acc_len())
        return spec

    def plot_spectra(self, core_block=0, db=True, show=True):
        """
        Plot spectra of all polarizations, with accumulation length divided out
        
        Inputs:
            core_block (int) : If using multiplexing, read input block ID `core_block`
            db (bool): If True, plot 10log10(power). Else, plot linear
            show (bool): If True, call matplotlib's `show` after plotting
        Returns: matplotlib Figure
        """
        from matplotlib import pyplot as plt
        specs = self.get_new_spectra(core_block)
        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
            specs = 10*np.log10(specs)
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency Channel')
        if self._use_mux:
            channel_offset = core_block * self.n_pols // self._n_cores
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
        Get the currently loaded accumulation length. In spectra
        """
        self._acc_len = self.read_int('acc_len')
        return self._acc_len

    def set_acc_len(self,acc_len):
        """
        Set the number of spectra to accumulate to `acc_len`
        """
        assert isinstance(acc_len, int), "Cannot set accumulation length to type %r" % type(acc_len)
        self._acc_len = acc_len
        self.write_int('acc_len',acc_len)

    def get_status(self):
        stats = {
            'acc_len': self.get_acc_len(),
        }
        flags = {}
        return stats, flags

    def initialize(self, read_only=False):
        if read_only:
            self.get_acc_len()
        else:
            self.set_acc_len(self._acc_len)
