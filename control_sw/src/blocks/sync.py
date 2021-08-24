import time
from numpy import log2

from .block import Block

class Sync(Block):
    OFFSET_ACTIVE_HIGH = 0
    OFFSET_RST_TT_INT = 1
    OFFSET_MAN_LOAD_INT = 2
    OFFSET_TT_INT_LOAD_ARM = 3
    OFFSET_MAN_PPS = 4
    OFFSET_RST_TT = 5
    OFFSET_RST_ERR = 6
    OFFSET_ARM_SYNC_OUT = 7
    OFFSET_MAN_SYNC = 8
    OFFSET_ARM_NOISE = 9
    OFFSET_TT_LOAD_ARM = 10

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

    def count_pps(self):
        """
        :return: Number of external PPS pulses received.
        :rtype int:
        """
        return self.read_uint('ext_pps_count')

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

    def wait_for_pps(self, timeout=2.0):
        """
        Block until a PPS has been received.

        :param timeout: Timeout, in seconds, to wait.
        :type timeout: float

        :return: least-significant 32-bits of telescope time of
          last PPS pulse. Or, -1, on timeout.
        :rtype int:
        """
        t0 = time.time()
        c0 = self.read_uint('tt_lsb')
        c1 = self.read_uint('tt_lsb')
        while(c1 == c0):
            c1 = self.read_uint('tt_lsb')
            if time.time() > (t0 + timeout):
                self._warning("Timed out waiting for PPS")
                return -1
            time.sleep(0.05)
        return c1

    def arm_sync(self):
        """
        Arm sync pulse generator, which passes sync pulses to the
        design DSP.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_SYNC_OUT)
        self.change_reg_bits('ctrl', 1, self.OFFSET_ARM_SYNC_OUT)
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_SYNC_OUT)

    def arm_noise(self):
        """
        Arm noise generator resets.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('ctrl', 1, self.OFFSET_ARM_NOISE)
        self.change_reg_bits('ctrl', 0, self.OFFSET_ARM_NOISE)

    def sw_sync(self):
        """
        Issue a sync pulse from software. This will only do anything
        if appropriate arming commands have been made in advance.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_SYNC)
        self.change_reg_bits('ctrl', 1, self.OFFSET_MAN_SYNC)
        self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_SYNC)

    def set_output_sync_rate(self, mask):
        """
        Set the output sync generation rate. A sync is issued
        when the lower 32-bits of the telescope time counter,
        masked with ``~mask`` == 0. I.e., a mask of 0 will
        cause a sync every 2^32 clock cycles. A mask of 0xffff0000
        will create an output pulse every 2^16 clock cycles.
        Output sync pulses are extended by 256 clocks, so the output pulse rate
        should be lower than this.

        :param mask: Mask with which to bitwise AND the telescope time
            counter before comparing to 0.
        :type mask: int
        """
        self.write_int('tt_mask', mask)

    def update_telescope_time(self, fs_hz=196e6):
        """
        Arm PPS trigger receivers,
        having loaded an appropriate telescope time.

        :param fs_hz: The ADC clock rate, in Hz. Used to set the
            telescope time counter.
        :type fs_hz: int

        """
        x = self.wait_for_pps()
        has_pps = (x >= 0)
        if not has_pps:
            # Timed out, probably because this isn't the TT SNAP2 with PPS
            self._info("Skipping telescope time update, because this board doesn't have a PPS")
            return
        now = time.time()
        next_pps = int(now) + 1
        self._info("Loading new telescope time at %s" % time.ctime(next_pps))
        target_tt = int(next_pps * fs_hz)
        delay = next_pps - time.time()
        if delay < 0.2:
            self._error("Took too long to generate software sync")
        self.load_telescope_time(target_tt, software_load=False)
        loaded_time = time.time()
        spare = next_pps - loaded_time
        if spare < 0.2:
            self._warning("TT loaded with only %.2f seconds to spare" % spare)
        if spare < 0:
            self._error("TT loaded after the expected PPS arrival!")
        # Now wait for a PPS so that the TT will have been loaded before anything else happend
        if has_pps:
            self.wait_for_pps()

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
        next PPS.

        :param tt: Telescope time to load
        :type tt: int

        :param software_load: If True, immediately load via a software trigger. Else
            load on the next PPS arrival.
        :type software_load: bool
        """
        assert tt < 2**64 - 1
        self.write_int('tt_load_msb', tt >> 32)
        self.write_int('tt_load_lsb', tt & 0xffffffff)
        self.change_reg_bits('ctrl', 0, self.OFFSET_TT_LOAD_ARM)
        self.change_reg_bits('ctrl', 1, self.OFFSET_TT_LOAD_ARM)
        self.change_reg_bits('ctrl', 0, self.OFFSET_TT_LOAD_ARM)
        if software_load:
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_PPS)
            self.change_reg_bits('ctrl', 1, self.OFFSET_MAN_PPS)
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_PPS)

    def load_internal_time(self, tt, software_load=False):
        """
        Load a new starting value into the _internal_ telescope time counter on the
        next sync.

        :param tt: Telescope time to load
        :type tt: int

        :param software_load: If True, immediately load via a software trigger. Else
            load on the next external sync pulse arrival.
        :type software_load: bool
        """
        assert tt < 2**64 - 1
        self.write_int('int_tt_load_msb', tt >> 32)
        self.write_int('int_tt_load_lsb', tt & 0xffffffff)
        self.change_reg_bits('ctrl', 0, self.OFFSET_TT_INT_LOAD_ARM)
        self.change_reg_bits('ctrl', 1, self.OFFSET_TT_INT_LOAD_ARM)
        self.change_reg_bits('ctrl', 0, self.OFFSET_TT_INT_LOAD_ARM)
        if software_load:
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_LOAD_INT)
            self.change_reg_bits('ctrl', 1, self.OFFSET_MAN_LOAD_INT)
            self.change_reg_bits('ctrl', 0, self.OFFSET_MAN_LOAD_INT)

    def get_tt_of_sync(self):
        """
        Get the internal TT at which the last sync pulse arrived.

        :return: (tt, sync_number). ``tt`` is the internal TT of the last sync.
            ``sync_number`` is the sync pulse count corresponding to this TT.
        :rtype int:
        """
        # wait for a pulse so we are less likely to read over a boundary
        self.wait_for_sync()
        sync_number = self.count_ext()
        tt = (self.read_uint('ext_sync_tt_msb') << 32) + self.read_uint('ext_sync_tt_lsb')
        sync_number_reread = self.count_ext()
        if sync_number_reread != sync_number:
            self._error("Failed to read TT without being interrupted by a sync. Is the sync rate very high?")
            raise RuntimeError
        return tt, sync_number

    def update_internal_time(self, fs_hz=196e6):
        """
        Arm sync trigger receivers,
        having loaded an appropriate telescope time.

        :param fs_hz: The ADC clock rate, in Hz. Used to set the
            telescope time counter.
        :type fs_hz: int

        """
        # Figure out sync rate
        tt0, sync0 = self.get_tt_of_sync()
        tt1, sync1 = self.get_tt_of_sync()
        sync_period = (tt1 - tt0) / (sync1 - sync0)
        self._info("Detected sync period %.1f (2^%.1f) clocks" % (sync_period, log2(sync_period)))
        sync_period = int(sync_period)
        if sync_period < 1:
            self.warning("Might have issues synchronizing with a sync period < 1 second")
        # We assume that the master TT is tracking clocks since unix epoch.
        # Syncs should come every `sync_period` ADC clocks
        self.wait_for_sync()
        now = time.time()
        now_clocks = int(now * fs_hz)
        next_sync_clocks = ((now_clocks // sync_period) + 1) * sync_period
        next_sync = next_sync_clocks / fs_hz
        self._info("Loading new telescope time at %s" % time.ctime(next_sync))
        delay = next_sync - time.time()
        if delay < 0.2:
            self._error("Took too long to configure telescope time register")
        self.load_internal_time(next_sync_clocks, software_load=False)
        loaded_time = time.time()
        spare = next_sync - loaded_time
        if spare < 0.2:
            self._warning("Internal TT loaded with only %.2f seconds to spare" % spare)
        if spare < 0:
            self._error("Internal TT loaded after the expected sync arrival!")
        # Wait for a sync to pass so the TT is laoded before anything else happens
        self.wait_for_sync()

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - uptime_fpga_clks (int) : Number of FPGA clock ticks (= ADC clock ticks)
              since the FPGA was last programmed.

            - period_fpga_clks (int) : Number of FPGA clock ticks (= ADC clock ticks)
              between the last two internal sync pulses.

            - ext_count (int) : The number of external sync pulses since the FPGA
              was last programmed.

            - int_count (int) : The number of internal sync pulses since the FPGA
              was last programmed.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.
        """
        stats = {}
        flags = {}
        stats['uptime_fpga_clks'] = self.uptime()
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
            # Set output pulse rate to 1 per 2**29 clocks (every ~2.7 seconds)
            self.set_output_sync_rate(0xe0000000)
            self.reset_error_count()
