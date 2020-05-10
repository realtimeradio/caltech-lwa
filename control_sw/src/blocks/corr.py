import time
import struct
import numpy as np

from .block import Block

class Corr(Block):
    def __init__(self, host, name, acc_len=1024, logger=None, n_chans=1024):
        """
        Instantiate an correlation block, which allows correlation
        of pairs of inputs to be computed.
        
        Inputs:
            host (casperfpga.CasperFpga): Host FPGA object
            name (string): Name (in simulink) of this block
            acc_len (int): Number of spectra to accumulate
            n_chans (int) : Number of frequency channels _output_
        """
        super(Corr, self).__init__(host, name, logger)
        self.n_chans = n_chans
        self.acc_len = acc_len
        self.spec_per_acc = 8
   
    def set_input(self, pol1, pol2):
        """
        Set correlation inputs to `pol1`, `pol2`
        """
        self.write_int('input_sel',(pol1 + (pol2<<8)))
 
    def wait_for_acc(self):
        """
        Wait for a new accumulation to complete.
        """
        cnt = self.read_uint('acc_cnt')
        while self.read_uint('acc_cnt') < (cnt+1):
            time.sleep(0.1)

    def read_bram(self, flush_vacc=True):
        """ 
        Waits for the next accumulation to complete and then
        outputs the contents of the results BRAM. If you want a 
        fresh accumulation use get_new_corr(pol1, pol2) instead.
        Returns:
            complex numpy array containing cross-correlation spectra
        """
        if flush_vacc:
            self.wait_for_acc()
        spec = np.array(struct.unpack('>%sl' % (2*self.n_chans), self.read('dout',8*self.n_chans)))
        spec = (spec[0::2]+1j*spec[1::2])
        return spec
    
    def get_new_corr(self, pol1, pol2, flush_vacc=True):
        """
        Get a new correlation with the given inputs.
        Flushes a correlation after setting inputs, to prevent any contaminated results.
        Input Pol Mapping: [1a, 1b, 2a, 2b, 3a, 3b] : [0, 1, 2, 3, 4, 5, 6, 7]
        Returns: complex nump array of shape(1024,), containing cross-correlation spectra
                 with accumulation length divided out.

        """
        self.set_input(pol1,pol2)
        if flush_vacc:
            self.wait_for_acc()      # Wait two acc_len for new spectra to load
        spec = self.read_bram()/float(self.acc_len*self.spec_per_acc)
        return spec

    def plot_corr(self, pol1, pol2, show=False):
        from matplotlib import pyplot as plt
        spec = self.get_new_corr(pol1, pol2)
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

    def show_corr_plot(self):
        from matplotlib import pyplot as plt
        plt.show()

    def get_acc_len(self):
        """
        Get the currently loaded accumulation length. In spectra
        """
        #Convert to spectra from clocks. See Firmware for reasoning behind 1024
        self.acc_len = self.read_int('acc_len') // self.n_chans
        return self.acc_len

    def set_acc_len(self,acc_len):
        """
        Set the number of spectra to accumulate to `acc_len`
        """
        assert isinstance(acc_len, int), "Cannot set accumulation length to type %r" % type(acc_len)
        self.acc_len = acc_len
        acc_len = self.n_chans*acc_len  # Convert from spectra to FPGA clocks
        self.write_int('acc_len',acc_len)

    def initialize(self):
        self.set_acc_len(self.acc_len)
