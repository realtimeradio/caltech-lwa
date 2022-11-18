import time
from numpy import log2

from .block import Block
from lwa_f.error_levels import *

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
    OFFSET_LOOPBACK_EN = 11

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
        :return: The number of FPGA clock ticks between the last two external sync pulses
            received from the timing distribution system.
        :rtype int:
        """
        return self.read_uint('ext_sync_period') + 1

    def count_ext(self):
        """
        :return: Number of external sync pulses received from the timing distribution system.
        :rtype int:
        """
        return self.read_uint('ext_sync_count')

    def count_pps(self):
        """
        :return: Number of external PPS pulses received. This counter will only
            increment reliably on the single board which has a PPS connected.
        :rtype int:
        """
        try:
            return self.read_uint('ext_pps_count')
        except:
            self._warning("firmware bug workaround. PPS count register doesn't exist")
            return 0

    def period_pps(self):
        """
        :return: The number of FPGA clock ticks between the last two PPS pulses.
            This period report will only be meaningful is this board has a PPS connected.
        :rtype int:
        """
        return self.read_uint('ext_pps_period') + 1

    def count_int(self):
        """
        :return: Number of internally generated sync pulses counted.
            The "internal" pulses are output on a physical board connector.
            For one board, this signal drives the timing distribution system.
        :rtype int:
        """
        return self.read_uint('int_sync_count')

    def get_latency(self):
        """
        :return: Number of FPGA clock ticks between sync transmission and reception.
            This measurement is only meaningful for the board which has its internal pulse
            output connected to the timing distribution system input.
        :rtype int:
        """
        return self.read_uint('latency')

    def get_latency_variations(self):
        """
        :return: Number of latency variations between sync transmission and reception
            since reset_error_count
        :rtype int:
        """
        return self.read_uint('latency_variations')

    def get_period_variations(self):
        """
        :return: The number of sync period variations in pulses received from the
            timing distribution system since last reset_error_count()
        :rtype int:
        """
        return self.read_uint('ext_period_variations')

    def get_pps_period_variations(self):
        """
        :return: The number of PPS period variations since last reset_error_count().
            This is only meaninful if a board has a PPS input connected.
        :rtype int:
        """
        return self.read_uint('ext_pps_period_variations')

    def reset_error_count(self):
        """
        Reset error counters to 0.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_ERR)
        self.change_reg_bits('ctrl', 1, self.OFFSET_RST_ERR)
        self.change_reg_bits('ctrl', 0, self.OFFSET_RST_ERR)

    def enable_loopback(self):
        """
        Internally loop back the sync output and input.
        """
        self.change_reg_bits('ctrl', 1, self.OFFSET_LOOPBACK_EN)

    def disable_loopback(self):
        """
        Disable the internal loopback between the sync output and input.
        """
        self.change_reg_bits('ctrl', 0, self.OFFSET_LOOPBACK_EN)
    
    def wait_for_sync(self, timeout=20):
        """
        Block until a sync has been received.

        :param timeout: Timeout, in seconds, to wait.
        :type timeout: float
        """
        t0 = time.time()
        c = self.count_ext()
        while(self.count_ext() == c):
            if time.time() > (t0 + timeout):
                self._error("Timed out waiting  %.1f seconds for sync pulse" % timeout)
                raise RuntimeError("Timed out waiting %.1f seconds for a sync pulse" % timeout)
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
                self._info("Timed out waiting for PPS")
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

    def update_telescope_time(self, fs_hz=196000000):
        """
        Load the PPS-locked telescope time counters with the correct time
        on the next PPS pulse.

        Loading procedure is:
          1. Wait for a PPS to pass, or for a timeout waiting for a PPS
          2. If no PPS was detected. Do nothing and return from this function,
             skipping steps 3,4,5
          3. Inferring the exact time of the observed PPS arrival via current
             system time, which is assumed to be aligned to GPS time to
             better than 0.5 seconds, compute how many ADC clocks will
             have occurred at the time of the upcoming PPS.
          4. Load this value on the next PPS pulse using ``load_telescope_time``
          5. Verify (using ``count_pps``) that no PPS pulses have occurred while
             performing steps 2 and 3. Generate an error if this is not the case.

        :param fs_hz: The ADC clock rate, in Hz. Used to set the
            telescope time counter.
        :type fs_hz: int

        """
        x = self.wait_for_pps()
        count_start = self.count_pps()
        has_pps = (x >= 0)
        if not has_pps:
            # Timed out, probably because this isn't the TT SNAP2 with PPS
            self._info("Skipping telescope time update, because this board doesn't have a PPS")
            return
        first_pps = time.time()
        if (abs(first_pps - round(first_pps))) > 0.05:
            self._warning("System time and GPS time seem to differ by >50 ms")
        next_pps = round(first_pps) + 1
        self._info("Loading new telescope time at %s" % time.ctime(next_pps))
        target_tt = int(next_pps * fs_hz)
        self.load_telescope_time(target_tt, software_load=False)
        loaded_time = time.time()
        spare = first_pps + 1 - loaded_time
        if spare < 0.2:
            self._warning("TT loaded with only %.2f seconds to spare" % spare)
        if spare < 0:
            self._error("TT loaded after the expected PPS arrival!")
            raise RuntimeError("TT loaded after the expected PPS arrival!")
        count_stop = self.count_pps()
        if count_stop != count_start:
            self._error("TT loaded after the expected PPS arrival!")
            raise RuntimeError("TT loaded after the expected PPS arrival!")
        # Now wait for a PPS so that the TT will have been loaded before anything else happend
        if has_pps:
            pps_cnt_after = self.wait_for_pps()

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

    def get_tt_of_sync(self, wait_for_sync=True):
        """
        Get the internal TT at which the last sync pulse arrived, optionally
        waiting for a pulse to pass before reading its arrival time and returning.

        :param wait_for_sync: If True, wait for a sync pulse to pass before
            measuring its arrival time and returning.
        :type wait_for_sync: bool

        :return: (tt, sync_number). ``tt`` is the internal TT of the last sync.
            ``sync_number`` is the sync pulse count corresponding to this TT.
        :rtype int:
        """
        if wait_for_sync:
            # wait for a pulse so we are less likely to read over a boundary
            self.wait_for_sync()
        sync_number = self.count_ext()
        tt = (self.read_uint('ext_sync_tt_msb') << 32) + self.read_uint('ext_sync_tt_lsb')
        sync_number_reread = self.count_ext()
        if sync_number_reread != sync_number:
            self._error("Failed to read TT without being interrupted by a sync. Is the sync rate very high?")
            raise RuntimeError
        return tt, sync_number

    def get_tt_of_pps(self, wait_for_sync=True):
        """
        Get the internal TT at which the last PPS pulse arrived, optionally
        waiting for a pulse to pass before reading its arrival time and returning.

        :param wait_for_sync: If True, wait for a sync pulse to pass before
            measuring its arrival time and returning.
        :type wait_for_sync: bool

        :return: (tt, sync_number). ``tt`` is the internal TT of the last PPS.
            ``sync_number`` is the PPS pulse count corresponding to this TT.
        :rtype int:
        """
        if wait_for_sync:
            # wait for a pulse so we are less likely to read over a boundary
            self.wait_for_pps()
        sync_number = self.count_pps()
        tt = (self.read_uint('tt_msb') << 32) + self.read_uint('tt_lsb')
        sync_number_reread = self.count_pps()
        if sync_number_reread != sync_number:
            self._error("Failed to read TT without being interrupted by a sync. Is the sync rate very high?")
            raise RuntimeError
        return tt, sync_number

    def update_internal_time(self, fs_hz=196000000):
        """
        Load the sync-pulse-locked telescope time counters with the correct time
        on the next sync pulse.
        Since sync pulses are derived from the telescope
        time of the one SNAP board which drives the timing distribution network,
        ``update_telescope_time()`` should have been run on this unique board
        prior to the use of ``update_internal_time``.

        Loading procedure is:
          1. Wait for a sync pulse to pass
          2. Compute how many, ``m``,  sync periods (determined by ``period()``)
             have passed since UNIX time 0, inferring the exact arrival time
             of the last sync by comparison with system time, which
             is assumed to be aligned to GPS time to better than 50% of a sync
             pulse period.
          3. Compute the telescope time (``(m+1)*period``) of the next expected
             sync pulse arrival.
          4. Load this value on the next sync pulse using ``load_internal_time``
          5. Verify (using ``count_ext``) that no sync pulses have occurred while
             performing steps 2 and 3. Generate an error if this is not the case.

        :param fs_hz: The ADC clock rate, in Hz. Used to set the
            telescope time counter.
        :type fs_hz: int

        """
        sync_period = self.period()
        self._info("Detected sync period %.1f (2^%.1f) clocks" % (sync_period, log2(sync_period)))
        if ((log2(sync_period) % 1) != 0):
            self._warning("Odd sync period detected")
        if sync_period < fs_hz:
            self._warning("Might have issues synchronizing with a sync period < 1 second")
        # We assume that the master TT is tracking clocks since unix epoch.
        # Syncs should come every `sync_period` ADC clocks
        self.wait_for_sync()
        count_start = self.count_ext()
        first_sync = time.time() 
        first_sync_clocks = int(first_sync * fs_hz)
        first_sync_exact = (first_sync_clocks / sync_period) # pulse ID since time origin
        next_sync_clocks = (round(first_sync_exact) + 1) * sync_period
        if (abs(first_sync_exact - round(first_sync_exact)) * sync_period / fs_hz) > 0.05:
            self._warning("System time and Sync time seem to differ by >50 ms")
        next_sync = next_sync_clocks / fs_hz
        self._info("Loading new telescope time at %s" % time.ctime(next_sync))
        self.load_internal_time(next_sync_clocks, software_load=False)
        loaded_time = time.time()
        spare = first_sync + (sync_period / fs_hz) - loaded_time
        if spare < 0.2:
            self._warning("Internal TT loaded with only %.2f seconds to spare" % spare)
        if spare < 0:
            self._error("Internal TT loaded after the expected sync arrival!")
            # Don't raise here, the count test below is the concrete one
        count_stop = self.count_pps()
        if count_stop != count_start:
            self._error("TT loaded after the expected sync arrival!")
            raise RuntimeError("TT loaded after the expected sync arrival!")
        # Wait for a sync to pass so the TT is loaded before anything else happens
        self.wait_for_sync()

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - uptime_fpga_clks (int) : Number of FPGA clock ticks (= ADC clock ticks)
              since the FPGA was last programmed.

            - period_fpga_clks (int) : Number of FPGA clock ticks (= ADC clock ticks)
              between the last two internal sync pulses.

            - period_variations (int) : Number of different external sync periods measured
              since the last error count reset. Any value other than zero is flagged as
              a warning.

            - period_pps_fpga_clks (int) : Number of FPGA clock ticks (= ADC clock ticks)
              between the last two external PPS sync pulses.

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
        stats['period_pps_fpga_clks'] = self.period_pps()
        stats['period_variations'] = self.get_period_variations()
        stats['ext_count'] = self.count_ext()
        stats['int_count'] = self.count_int()
        if stats['period_variations'] > 0:
            flags['period_variations'] = FENG_WARNING
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
