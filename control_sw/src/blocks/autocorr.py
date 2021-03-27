import time
import struct
import numpy as np

from .block import Block

class AutoCorr(Block):
    def __init__(self, host, name,
                 acc_len=2**16,
                 logger=None,
                 n_chans=4096,
                 n_pols=64,
                 n_parallel_streams=8,
                 n_cores=4,
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
        """
        super(AutoCorr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self._acc_len = acc_len
        self.n_pols = n_pols
        self._n_parallel_streams = n_parallel_streams
        self._n_cores = n_cores
   
    def _wait_for_acc(self):
        """
        Wait for a new accumulation to complete.
        """
        cnt = self.read_uint('acc_cnt')
        while self.read_uint('acc_cnt') < (cnt+1):
            time.sleep(0.1)

    def _read_bram(self):
        """ 
        Reads ram containing autocorrelation spectra for all polarizations.
        Returns:
            numpy array containing uint64 autocorrelation spectra
        """
        dout = np.zeros([self.n_pols, self.n_chans], dtype=np.float32)
        n_words_per_stream = self.n_pols * self.n_chans // self._n_parallel_streams // self._n_cores
        n_pols_per_core = self.n_pols // self._n_cores
        n_chans_per_stream = self.n_chans // self._n_parallel_streams
        for core in range(self._n_cores):
            for stream in range(self._n_parallel_streams):
                raw = self.read('%d_dout%d_bram' % (core, stream), 4*n_words_per_stream)
                x = struct.unpack('>%df' % n_words_per_stream, raw)
                for subpol in range(self.n_pols // self._n_cores):
                    dout[core*n_pols_per_core + subpol, stream::self._n_parallel_streams] = \
                        x[subpol*n_chans_per_stream:(subpol+1)*n_chans_per_stream]
        return dout
    
    def get_new_spectra(self):
        """
        Get a new accumulation.
        Returns: numpy array of shape(n_pol, n_chans), containing
                 autocorrelations with accumulation length divided out.

        """
        self._wait_for_acc()
        spec = self._read_bram() / float(self._acc_len)
        return spec

    def plot_spectra(self, db=True, show=True):
        """
        Plot spectra of all polarizations, with accumulation length divided out
        
        Inputs:
            db (bool): If True, plot 10log10(power). Else, plot linear
            show (bool): If True, call matplotlib's `show` after plotting
        Returns: matplotlib Figure
        """
        from matplotlib import pyplot as plt
        spec = self.get_new_spectra()
        f, ax = plt.subplots(1,1)
        if db:
            ax.set_ylabel('Power [dB]')
        else:
            ax.set_ylabel('Power [linear]')
        ax.set_xlabel('Frequency Channel')
        for i in range(self.n_pols):
            ax.plot(10*np.log10(np.abs(spec[i])), label="pol_%d"%i)
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

    def initialize(self):
        self.set_acc_len(self._acc_len)
