import struct
import time
import numpy as np
from .block import Block
from lwa_f.error_levels import *

class Input(Block):
    """
    Instantiate a control interface for an Input block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param n_streams: Number of independent streams which may be delayed
    :type n_streams: int

    :param n_bits: Number of bits per ADC sample.
    :type n_bits: int
    """
    _USE_NOISE = 0
    _USE_ADC   = 1
    _USE_ZERO  = 2
    _INT_TO_POS = {}
    _INT_TO_POS[_USE_NOISE] = 'noise'
    _INT_TO_POS[_USE_ADC]   = 'adc'
    _INT_TO_POS[_USE_ZERO]  = 'zero'
    _SNAPSHOT_SAMPLES_PER_POL = 2048

    def __init__(self, host, name, n_streams=64, n_bits=10, logger=None):
        super(Input, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.n_bits = n_bits

    def get_switch_positions(self):
        """
        Get the positions of the input switches.

        :return: List of switch positions. Entry ``n`` contains the position
            of the switch associated with ADC input ``n``. Switch positions
            are "noise" (internal digital noise generators), "adc"
            (digitized ADC stream), or "zero" (constant 0).
        :rtype: list of str

        """
        pos = []
        for regn in range(self.n_streams // 16):
            reg_val = self.read_uint('source_sel%d' % regn)
            for i in range(16):
                v = (reg_val >> (2*i)) & 0b11
                pos += [self._INT_TO_POS[v]]
        return pos
                

    def _switch(self, val, stream=None):
        """
        Set the switch position of a single input stream.
        
        :param val: mux select value desired.
        :type val: int

        :param stream: Which stream to switch. If None, switch all.
        :type stream: int or None

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

        :param stream: Which stream to switch. If None, switch all.
        :type stream: int or None

        """
        self._info("Stream %s: switching to Noise" % stream)
        self._switch(self._USE_NOISE, stream)

    def use_adc(self, stream=None):
        """
        Switch input to ADC.

        :param stream: Which stream to switch. If None, switch all.
        :type stream: int or None

        """
        self.logger.info("Stream %s: switching to ADC" % stream)
        self._switch(self._USE_ADC, stream)

    def use_zero(self, stream=None):
        """
        Switch input to zeros.

        :param stream: Which stream to switch. If None, switch all.
        :type stream: int or None

        """
        self._info("Stream %s: switching to Zeros" % stream)
        self._switch(self._USE_ZERO, stream)

    def get_bit_stats(self):
        """
        Get the mean, RMS, and mean powers of all ADC streams.

        :return: (means, powers, rmss) tuple. Each member of the tuple is an
            array with ``self.n_streams`` elements.
        :rval: (numpy.ndarray, numpy.ndarray, numpy.ndarray)

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

    def initialize(self, read_only=False):
        """
        Initialize the block.

        :param read_only: If True, do nothing. If False, set the input
            multiplexers to ADC data and enable statistic computation.
        :type read_only: bool

        """
        if read_only:
            pass
        else:
            self.use_adc()
            self.write_int('rms_enable', 1)

    def get_status(self):
        stats = {}
        flags = {}
        switch_positions = self.get_switch_positions()
        mean, power, rms = self.get_bit_stats()
        for i in range(self.n_streams):
            stats['switch_position%.2d' % i] = switch_positions[i]
            if switch_positions[i] != 'adc':
                flags['switch_position%.2d' % i] = FENG_NOTIFY
            stats['power%.2d' % i] = power[i]
            stats['rms%.2d' % i]   = rms[i]
            stats['mean%.2d' % i]  = mean[i]
            if rms[i] > 30 or rms[i] < 5:
                flags['rms%.2d' % i] = FENG_WARNING
            if np.abs(mean[i]) > 2:
                flags['mean%.2d' % i] = FENG_WARNING
        return stats, flags

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
        self._info("Getting histogram for input %d" % input)
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
