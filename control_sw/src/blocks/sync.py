from .block import Block

class Sync(Block):
    PERIOD_BASE_DIVISOR = 13 * 4 * 8192
    def __init__(self, host, name, logger=None):
        super(Sync, self).__init__(host, name, logger)
        self.OFFSET_ARM_SYNC  = 0
        self.OFFSET_ARM_NOISE = 1
        self.OFFSET_SW_SYNC   = 4
    
    def uptime(self):
        """
        Returns uptime in seconds, assumes 250 MHz FPGA clock
        """
        return self.read_uint('uptime')

    def set_delay(self, delay):
        """
        Set the delay, in FPGA clock ticks, between the arrival of an external
        sync pulse and the issuing of an internal trigger.
        inputs:
            delay (integer) : Number of FPGA clocks delay
        """
        self.write_int('sync_delay', delay)

    def period(self):
        """
        Returns period of sync in pulses, in FPGA clock ticks
        """
        return self.read_uint('period')

    def change_period(self,period):
        """
        Change the period of the sync pulse
        """
        assert (period % self.PERIOD_BASE_DIVISOR == 0), \
            'Period should be a multiple of %d' % self.PERIOD_BASE_DIVISOR
        self.host.write_int('timebase_sync_period',period)
        self._info("Changed sync period to %.2f"%period)

    def count(self):
        """
        Returns Number of external sync pulses received.
        """
        return self.read_uint('count')
    
    def wait_for_sync(self):
        """
        Block until a sync has been received.
        """
        c = self.count()
        while(self.count() == c):
            time.sleep(0.05)

    def arm_sync(self):
        """
        Arm sync pulse generator.
        """
        self.change_reg_bits('arm', 0, self.OFFSET_ARM_SYNC)
        self.change_reg_bits('arm', 1, self.OFFSET_ARM_SYNC)
        self.change_reg_bits('arm', 0, self.OFFSET_ARM_SYNC)

    def arm_noise(self):
        """
        Arm noise generator resets
        """
        self.change_reg_bits('arm', 0, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('arm', 1, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('arm', 0, self.OFFSET_ARM_NOISE)

    def sw_sync(self):
        """
        Issue a software sync pulse
        """
        self.change_reg_bits('arm', 0, self.OFFSET_SW_SYNC)
        self.change_reg_bits('arm', 1, self.OFFSET_SW_SYNC)
        self.change_reg_bits('arm', 0, self.OFFSET_SW_SYNC)

    def print_status(self):
        self._info('Uptime: %d seconds' % (self.name, self.uptime()))
        self._info('Period: %d FPGA clocks' % (self.name, self.period()))
        self._info('Count : %d' % (self.name, self.count()))

    def initialize(self):
        """
        Initialize this block. Set sync period to 0.
        """
        self.write_int('arm', 0)
        #self.change_period(2**16 * 9*7*6*5*3)
        self.change_period(self.PERIOD_BASE_DIVISOR * 256)
