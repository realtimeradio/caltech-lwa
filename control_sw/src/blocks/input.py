import struct
import numpy as np

class Input(Block):
    _USE_NOISE = 0
    _USE_ADC   = 1
    _USE_ZERO  = 2
    _SNAPSHOT_SAMPLES_PER_POL = 2048

    def __init__(self, host, name, n_streams=64, n_bits=10, logger=None):
        """
        Instantiate an input contol block.
        
        Parameters
        ----------
        host : CasperFpga
            The CasperFpga instance running firmware with which
            this block is associated.
        name : The name of this block. This should match the
            top-level Simulink block name.
        logger : a Logger instance which this block should use
            for output. If `None`, default log handlers (as
            defined in the `helpers.py` library) will be used.
        n_streams : int
            Number of streams this block handles
        n_bits : int
            Number of bits per ADC sample
        """
        super(Input, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.n_bits = n_bits

    def get_adc_snapshot(self, stream):
        """
        Get a block of samples from `stream`
        
        Returns a numpy array of samples
        """
        assert (stream < self.n_streams), "Can't get snapshot of stream >= self.n_streams" 
        self.write_int('snap_sel', stream)
        self.write_int('snapshot_ctrl', 0)
        self.write_int('snapshot_ctrl', 1)
        self.write_int('snapshot_ctrl', 3)
        d = self.read('snapshot_bram', self._SNAPSHOT_SAMPLES_PER_POL)
        d = struct.unpack('>%dh' % self._SNAPSHOT_SAMPLES_PER_POL, d)
        return np.array(d)
        
    def get_power_spectra(self, stream, acc_len=1):
        """
        Perform a software FFT of samples from `antenna`.
        Accumulate power from `acc_len` snapshots.
        Returns power spectrum as numpy array
        """
        P = np.zeros(self._SNAPSHOT_SAMPLES_PER_POL // 2 + 1)
        for i in range(acc_len):
            v = self.get_adc_snapshot(antenna)
            P += np.abs(np.fft.rfft(v))**2
        return P

    def _switch(self, val, stream=None):
        """
        Switch stream number `stream` to input ID `val`.
        
        Parameters
        ----------
        val : int
            mux index to switch to
        stream : int
            Which stream to switch. If None, switch all.
        """
        assert (val < 4), "Mux input value not recognized!"
        if stream is not None:
            assert (stream < self.n_streams), "Can't switch stream >= self.n_streams" 
            reg = 'source_sel%d' % (stream // 16) # one register per 16 streams
            reg_pos = stream % 16
            self.change_reg_bits(reg, val, 2*reg_pos, 2)
        else:
            for stream in range(self.n_streams):
                self._switch(val, stream)

    def use_noise(self, stream=None):
        """
        Switch input to internal noise source.
        Inputs:
            stream (int): Which stream to switch. If None, switch all.
        """
        self.switch(self._USE_NOISE, stream)

    def use_adc(self, stream=None):
        """
        Switch input to ADC.
        Inputs:
            stream (int): Which stream to switch. If None, switch all.
        """
        self.switch(self._USE_ADC, stream)

    def use_zero(self, stream=None):
        """
        Switch input to zeros.
        Inputs:
            stream (int): Which stream to switch. If None, switch all.
        """
        self.switch(self._USE_ZERO, stream)

    def get_stats(self):
        """
        Get the mean, RMS, and powers of
        all ADCs
        Returns:
            means, powers, rmss. Each is a numpy array with one entry per input. (Or 12 entries if sum_cores=False)
        """
        self.write_int('rms_enable', 1)
        time.sleep(0.01)
        self.write_int('rms_enable', 0)
        x = np.array(struct.unpack('>%dl' % (2*self.n_streams), self.read('rms_levels', self.n_streams * 8)))
        self.write_int('rms_enable', 1)
        means    = x[0::2] / 2.**16
        powers   = x[1::2] / 2.**16
        rmss     = np.sqrt(powers)
        return means, powers, rmss

    def initialize(self):
        """
        Switch to ADCs. Begin computing stats.
         """
        self.use_adc()
        self.write_int('rms_enable', 1)

    def print_status(self):
        mean, power, rms = self.get_stats()
        for i in range(self.n_streams):
            self._info("stream %d : power %.3f, mean %.3f, rms %.3f" % (power[i], mean[i], rms[i]))

    def _set_histogram_input(self, i):
        """
        Set input of histogram block.
        Inputs:
            i (int): Stream number to select.
        """
        assert (i < self.n_streams), "Can't switch stream >= self.n_streams" 
        self.write_int('bit_stats_input_sel', i)

    def get_histogram(self, input, sum_cores=True):
        """
        Get a histogram for an ADC input.
        Inputs:
            input (int): ADC input from which to get data.
            sum_cores (Boolean): If True, compute one histogram from both A & B ADC cores. If False, compute separate histograms.

        Returns:
            If sum_cores is True:
                vals, hist
                    vals (numpy array): histogram bin centers
                    hist (numpy array): histogram data
            If sum_cores is False:
                vals, hist_a, hist_b
                    vals (numpy array): histogram bin centers
                    hist_a (numpy array): histogram data for "A" cores
                    hist_b (numpy array): histogram data for "B" cores
        """
        self._set_histogram_input(input)
        time.sleep(0.1)
        v = np.array(struct.unpack('>%dH' % (2*2**self.n_bits), self.read('bit_stats_histogram_output', 2*2*2**self.n_bits)))
        a = v[0:2**self.n_bits]
        b = v[2**self.n_bits : 2*2**self.n_bits]
        a = np.roll(a, 2**(self.n_bits - 1)) # roll so that array counts -128, -127, ..., 0, ..., 126, 127
        b = np.roll(b, 2**(self.n_bits - 1)) # roll so that array counts -128, -127, ..., 0, ..., 126, 127
        vals = np.arange(-2**(self.n_bits - 1), 2**(self.n_bits - 1))
        if sum_cores:
            return vals, a+b
        else:
            return vals, a, b

    def get_all_histograms(self):
        """
        Get histograms for all antpols, summing over all interleaving
        Input:
            antpol (int): Antpol number (zero-indexed)
        Returns:
            vals, hist
                vals (numpy array): histogram bin centers
                hist (numpy array): histogram data
        """
        out = np.zeros([self.n_streams, 2**self.n_bits])
        for stream in range(self.n_streams):
            x, out[stream,:] = self.get_histogram(stream, sum_cores=True)
        return x, out

    def print_histograms(self):
        x, hist = self.get_all_histograms()
        hist /= 1024.*1024
        for vn, v in enumerate(x):
            print('%5d:'%v, end=' ')
            for an, ant in enumerate(hist):
                print('%.3f'%ant[vn], end=' ')
            print()

    def plot_histogram(self, input, show=False):
        from matplotlib import pyplot as plt
        bins, d = self.get_histogram(input)
        #plt.hist(d, bins=bins)
        plt.bar(bins-0.5, d, width=1)
        if show:
            plt.show()

    def show_histogram_plot(self):
        """
        A helper method for plotting multiple histograms
        without importing your own pyplot.
        eg.
            for i in range(Input.n_streams):
                Input.plot_histogram(i)
            Input.show_histogram_plot()
        """
        from matplotlib import pyplot as plt
        plt.show()
