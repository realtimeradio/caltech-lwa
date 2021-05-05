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
        :return: Time in FPGA clock ticks since the FPGA was last programmed.
            Resolution is 2**32 (21 seconds at 200 MHz)

        :rtype: int
        """
        return self.read_uint('uptime_msb') << 32

    def period(self):
        """
        :return: The number of FPGA clock ticks between the last two external sync pulses.
        :rtype int:
        """
        return self.read_uint('ext_sync_period')

    def count_ext(self):
        """
        :return: Number of external sync pulses received.
        :rtype int:
        """
        return self.read_uint('ext_sync_count')

    def count_int(self):
        """
        :return: Number of internal sync pulses received.
        :rtype int:
        """
        return self.read_uint('int_sync_count')

    def get_latency(self):
        """
        :return: Number of FPGA clock ticks between sync transmission and reception
        :rtype int:
        """
        return self.read_uint('latency') & 0xff

    def get_error_count(self):
        """
        :return: Number of sync errors.
        :rtype int:
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

        :param tt: Telescope time to load
        :type tt: int

        :param software_load: If True, immediately load via a software trigger. Else
            load on the next external sync pulse arrival.
        :type software_load: bool
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
        stats = {}
        flags = {}
        stats['uptime_secs'] = self.uptime()
        stats['period_fpga_clks'] = self.period()
        stats['ext_count'] = self.count_ext()
        stats['int_count'] = self.count_int()
        return stats, flags

    def initialize(self, read_only=False):
        """
        Initialize block.

        :param read_only: If False, initialize system control register to 0
            and reset error counters. If True, do nothing.
        :type read_only: bool

        """
        if read_only:
            pass
        else:
            self.write_int('ctrl', 0)
            self.reset_error_count()
