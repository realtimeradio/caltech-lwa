import logging
import numpy as np
import struct
import socket
import time
import casperfpga
import helpers

class Adc(Block)
    def __init__(self, host, sample_rate=500, num_chans=2, resolution=8, ref=10, logger=None, **kwargs):
        """
        Instantiate an ADC block.
        
        Inputs:
           host (casperfpga.Casperfpga): Host FPGA
           sample_rate (float): Sample rate in MS/s
           num_chans (int): Number of channels per ADC chip. Valid values are 1, 2, or 4.
           resolution (int): Bit resolution of the ADC. Valid values are 8, 12.
           ref (float): Reference frequency (in MHz) from which ADC clock is derived. If None, an external sampling clock must be used.
        """
        self.logger = logger or helpers.add_default_log_handlers(logging.getLogger(__name__ + ":%s" % (host.host)))
        casperfpga.snapadc.SNAPADC.__init__(self, host, ref=ref, logger=self.logger)
        self.name            = 'SNAP_adc'
        self.num_chans       = num_chans
        self.interleave_mode = 4 >> num_chans
        self.clock_divide    = 1
        self.sample_rate     = sample_rate
        self.resolution      = resolution
        self.host = host # the SNAPADC class doesn't directly expose this
        self._retry = kwargs.get('retry',5)
        self._retry_wait = kwargs.get('retry_wait',1)

    def set_gain(self, gain):
        """
        Set the coarse gain of the ADC. Allowed values
        are 1, 1.25, 2, 2.5, 4, 5, 8, 10, 12.5, 16, 20, 25, 32, 50.
        """
        gain_map = {
          1    : 0b0000,
          1.25 : 0b0001,
          2    : 0b0010,
          2.5  : 0b0011,
          4    : 0b0100,
          5    : 0b0101,
          8    : 0b0110,
          10   : 0b0111,
          12.5 : 0b1000,
          16   : 0b1001,
          20   : 0b1010,
          25   : 0b1011,
          32   : 0b1100,
          50   : 0b1101
        }

        if gain not in gain_map.keys():
            raise ValueError("Gain %f is not allowed! Only gains %s are allowed" % (gain, gain_map.keys()))
        
        self.adc.write((gain_map[gain]<<4) + gain_map[gain], 0x2b)
        

    def initialize(self):
        """
        Initialize the configuration of the ADC chip.
        Returns True if initialization was successful. False otherwise.
        """
        status = True
        for i in range(self._retry):
            if self.init(self.sample_rate, self.num_chans):
                if i == 0:
                    self.logger.info("ADC configured OK")
                if i > 0:
                    self.logger.warning("ADC took %d attempts to configure" % (i+1))
                break
            if i == self._retry - 1:
                self.logger.error("ADC failed to configure after %d attempts" % (i+1))
                status = False

        self.selectADC()
        self.adc.selectInput([1,1,3,3])
        self.set_gain(4)
        return status
