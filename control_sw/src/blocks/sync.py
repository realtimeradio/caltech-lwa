from .block import Block

class Sync(Block):
    PERIOD_BASE_DIVISOR = 13 * 4 * 8192
    OFFSET_EXT_LOAD  = 0
    OFFSET_MAN_LOAD  = 1 
    OFFSET_RST_TT    = 2
    OFFSET_RST_ERR   = 3
    OFFSET_ARM_SYNC  = 4
    OFFSET_SW_SYNC   = 5
    OFFSET_ARM_NOISE = 6

    def __init__(self, host, name, logger=None):
        super(Sync, self).__init__(host, name, logger)
    
    def uptime(self):
        """
        Returns uptime in FPGA clock ticks. Resolution is 2**32 (21 seconds at 200 MHz)
        """
        return self.read_uint('uptime_msb') << 32

    def period(self):
        """
        Returns the number of FPGA clock ticks between the last two external sync pulses.
        """
        return self.read_uint('ext_sync_period')

    def count_ext(self):
        """
        Returns Number of external sync pulses received.
        """
        return self.read_uint('ext_sync_count')

    def count_int(self):
        """
        Returns Number of internal sync pulses received.
        """
        return self.read_uint('int_sync_count')

    def get_latency(self):
        """
        Returns Number of FPGA clock ticks between sync transmission and reception
        """
        return self.read_uint('latency') & 0xff

    def get_error_count(self):
        """
        Returns count of number of sync errors
        """
        return self.read_uint('latency') >> 8

    def reset_error_count(self):
        """
        Reset internal error counter to 0.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_ERR)
        self.change_reg_bits('ctrl', 1, self.OFFSET_RST_ERR)
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_ERR)
    
    def wait_for_sync(self):
        """
        Block until a sync has been received.
        """
        c = self.count_ext()
        while(self.count_ext() == c):
            time.sleep(0.05)

    def arm_sync(self):
        """
        Arm sync pulse generator.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_SYNC)
        self.change_reg_bits('ctrl', 1, self.OFFSET_ARM_SYNC)
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_SYNC)

    def arm_noise(self):
        """
        Arm noise generator resets
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('ctrl', 1, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_NOISE)

    def sw_sync(self):
        """
        Issue a software sync pulse
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_SW_SYNC)
        self.change_reg_bits('ctrl', 1, self.OFFSET_SW_SYNC)
        self.change_reg_bits('ctrl', 0, self.OFFSET_SW_SYNC)

    def reset_telescope_time(self):
        """
        Reset the telescope time counter to 0 immediately.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_TT)
        self.change_reg_bits('ctrl', 1, self.OFFSET_RST_TT)
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_TT)

    def load_telescope_time(self, tt, software_load=False):
        """
        Load a new starting value into the telescope time counter on the
        next sync.

        Parameters
        ----------
            tt (int) : Telescope time to load
            software_load (bool) : If True, immediately load via a software trigger
        """
        assert tt < 2**64 - 1
        self.write_int('tt_load_msb', tt >> 32)
        self.write_int('tt_load_lsb', tt & 0xffffffff)
        if software_load:
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_LOAD)
            self.change_reg_bits('ctrl', 1, self.OFFSET_MAN_LOAD)
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_LOAD)
        else:
            self.change_reg_bits('ctrl', 1, self.OFFSET_EXT_LOAD)
            self.wait_for_sync()
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_LOAD)

    def get_status(self):
        rv = {
            'uptime': self.uptime(),
            'period': self.period(),
            'ext_count': self.count_ext(),
            'int_count': self.count_int(),
        }
        return rv

    def print_status(self):
        self._info('Uptime: %d seconds' % (self.uptime()))
        self._info('Period: %d FPGA clocks' % (self.period()))
        self._info('External Sync Count : %d' % (self.count_ext()))
        self._info('Internal Sync Count : %d' % (self.count_int()))

    def initialize(self, read_only=False):
        """
        Initialize this block. Set sync period to 0.
        """
        if read_only:
            pass
        else:
            self.write_int('ctrl', 0)
        #self.change_period(2**16 * 9*7*6*5*3)
        #self.change_period(self.PERIOD_BASE_DIVISOR * 256)
