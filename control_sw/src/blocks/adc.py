import logging
import numpy as np
import struct
import socket
import time
import progressbar
import casperfpga
from casperfpga import ads5296
from lwa_f import helpers
from lwa_f.error_levels import *
from .block import Block

TAP_STEP_SIZE = 8
NSAMPLES = 256
NBOARDS = 2
NFMCS = 2

CONTROL_REG = 'sync'

RST_BIT = 0
EXT_SS_TRIG_EN_BIT = 1
SS_TRIG_BIT = 2
EXT_SYNC_EN_BIT = 3
SYNC_BIT = 4

class Adc(Block):
    """
    Instantiate a control interface for an ADC block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger
    """

    def __init__(self, host, name, logger=None):
        super(Adc, self).__init__(host, name, logger)
        # Check which ADCs are connected. Only if no ADC chips on an FMC board
        # respond do we ignore a port
        self.adcs = []
        self._connect_to_adcs()

    def _connect_to_adcs(self):
        """
        Populate the self.adcs attribute.

        Attempt to connect to ADCs on multiple FMC ports,
        by reading the reset register on each of the ADC board's
        ADS5296 chips. If any of the chips associated with an FMC
        port responds, consider this FMC port populated with an ADC,
        and add it to the self.adcs list.
        """
        for fmc in range(NFMCS):
            adc = ads5296.ADS5296fw(self.host, fmc)
            try:
                connected_chips = adc.is_connected()
            except:
                self._error("Failed to check ADC control register on fmc %d" % fmc)
                continue
            if np.any(connected_chips):
                self._info("Detected FMC ADC board on port %d" % fmc)
                if not np.all(connected_chips):
                    self._warning("Not all chips responded on port %d" % fmc)
                self.adcs += [adc]
            else:
                self._warning("Did not detect FMC ADC board on port %d" % fmc)

    def initialize(self, read_only=False, clocksource=1):
        """
        Initialize connected ADC boards.

        :param read_only: If True, don't do anything which would affect a running
            system. If False, train ADC->FPGA data links.
        :type read_only: bool

        :param clocksource: Which ADC board (0 or 1) on an FMC card should serve
            as the source of the clocks. Note that while this parameter is set
            for boards on all FMC cards, only the FMC card selected as the clock
            source at Simulink compile-time will be used for clocking.
        :type clocksource: int
        
        :return: True if initialization was successful. False otherwise.
        """
        if read_only:
            return
        assert clocksource in [0,1]
        # If we haven't yet connected to any ADCs, retry (maybe the board
        # has been programmed since the last attempt)
        if len(self.adcs) == 0:
            self._info("Retrying ADC connections")
            self._connect_to_adcs()
        # If there are still no ADCs, give up
        if len(self.adcs) == 0:
            self._error("No ADCs found! Giving up intialization")
            return
        self.write_int(CONTROL_REG, 0) # initialize all flags low
        for adc in self.adcs:
            for board in range(NBOARDS):
                self._info("FMC %d board %d: Setting clock source to %d" % (adc.fmc, board, clocksource))
                adc.reset_mmcm_assert(board)
                adc.set_clock_source(clocksource, board)
                adc.reset_mmcm_deassert(board)

        # Initialize all ADCs, then reset all MMCMs
        # This should leave the MMCMs locked no matter
        # which ADC chip is sourcing the clock.
        self._init()
        time.sleep(0.1) # wait for Initialization. Probably not needed
        for adc in self.adcs:
            for board in range(NBOARDS):
                adc.reset_mmcm(board)
        time.sleep(0.1) # wait for MMCM to come out of reset
        for adc in self.adcs:
            for board in range(NBOARDS):
                for cs in range(4*board, 4*board+1):
                    adc.enable_rst_data(range(8), cs)
                    adc.enable_rst_fclk(board)
                #adc.reset_mmcm(board)
                #time.sleep(0.1) # wait for MMCM to come out of reset
                # Enable VTCs before letting IODELAYs out of reset
                adc.enable_vtc_fclk(board)
                for cs in range(4*board, 4*board+1):
                    adc.enable_vtc_data(range(8), cs)
                # Reset deserializers
                adc.reset_iserdes(board)
                # Bring IDELAYs out of reset
                for cs in range(4*board, 4*board+1):
                    adc.disable_rst_data(range(8), cs)
                    adc.disable_rst_fclk(board)
            #self.reset()
            #self.sync()
            #self.calibrate()
        is_locked = self.mmcm_is_locked()
        if not is_locked:
            self._error("MMCMs not locked!")
            raise RuntimeError("MMCMs not locked!")
        # Flush FIFOs
        #for i in range(10): self.reset()
        #for i in range(10): self.sync()
        self.reset()
        self.sync()
        ok, delays, slacks = self.calibrate()
        # Return ADC to analog sampling mode
        self.use_data()
        return ok

    def mmcm_is_locked(self):
        """
        Read the ADC control register to determine if the clock PLLs are
        locked.

        :return: True if the ADC clocks are locked. False otherwise.
        :rtype: bool
        """
        mmcm_locked = True
        for adc in self.adcs:
            for board in range(2):
                this_board_locked = adc.mmcm_get_lock(board)
                self._info("FMC %d board %d clock rates: %s" % (adc.fmc, board, adc.read_clk_rates(board)))
                if this_board_locked is None:
                    # This board has no MMCM (it uses another board's)
                    continue
                mmcm_locked = mmcm_locked and this_board_locked
                if this_board_locked:
                    self._info("FMC %d board %d: MMCM locked" % (adc.fmc, board))
                else:
                    self._warning("FMC %d board %d: MMCM *NOT* locked" % (adc.fmc, board))
        return mmcm_locked

    def _trigger_snapshot(self):
        """
        Simultaneously trigger all ADC streams to record a snapshot of data.
        """
        self.change_reg_bits(CONTROL_REG, 0, SS_TRIG_BIT)
        self.change_reg_bits(CONTROL_REG, 1, SS_TRIG_BIT)
        self.change_reg_bits(CONTROL_REG, 0, SS_TRIG_BIT)

    def get_snapshot(self, fmc, signed=False, trigger=True):
        """
        Read a snapshot of data from all ADC channels on a single FMC card.
        Return data without interleaving ADC cores.

        :param fmc: Which FMC port (0 or 1) to read.
        :type fmc: int

        :param signed: If True, return data interpretted as signed 2's complement
            integers. If False, return data as unsigned integers.
        :type signed: bool

        :param trigger: If True, trigger a new simultaneous capture of data from
            all channels. If False, read existing data capture. Grabbing data
            without a new trigger may be useful if you wish to read channels
            from a second FMC port which were captured simultaneously with
            another port.
        :type trigger: bool

        :return: Array of captured data with dimensions
            [ADC_CHIPS_PER_FMC, ADC_LANES, TIME_SAMPLES]. Data from ADC
            lanes representing the same analog input are _not_ interleaved.
            Data from ADC lanes n,n+1 are associated with the same analog input.
        :rtype: numpy.array
        """
        out = np.zeros([8,8,NSAMPLES])
        if trigger:
            self._trigger_snapshot()
        # Loop over chips
        for i in range(8):     
            x = self.host.read('ads5296_wb_ram%d_%d_%d' % (fmc, i // 4, i % 4), NSAMPLES*2*2*4)
            d = struct.unpack('>%dH'%(NSAMPLES*2*4), x)
            # Remove 10-bit -> 16-bit padding
            v = [xx >> 6 for xx in d]
            # Loop over lanes
            for j in range(4): # ADCs
                for k in range(2): # interleaving
                    out[i, 2*j+k] = v[4*k+j::8]
        if signed:
            out[out>511] -= 1024
        return np.array(out, dtype=np.int32)
    
    def get_snapshot_interleaved(self, fmc, signed=False, trigger=True):
        """
        Read a snapshot of data from all ADC channels on a single FMC card.
        Return data with ADC cores interleaved.

        :param fmc: Which FMC port (0 or 1) to read.
        :type fmc: int

        :param signed: If True, return data interpretted as signed 2's complement
            integers. If False, return data as unsigned integers.
        :type signed: bool

        :param trigger: If True, trigger a new simultaneous capture of data from
            all channels. If False, read existing data capture. Grabbing data
            without a new trigger may be useful if you wish to read channels
            from a second FMC port which were captured simultaneously with
            another port.
        :type trigger: bool

        :return: numpy array of captured data with dimensions
            [ADC_CHANNELS_PER_FMC, TIME_SAMPLES].
        :rtype: numpy.ndarray
        """
        out = np.zeros([32,2*NSAMPLES])
        if trigger:
            self._trigger_snapshot()
        for i in range(8):     
            x = self.host.read('ads5296_wb_ram%d_%d_%d' % (fmc, i // 4, i % 4), NSAMPLES*2*2*4)
            d = struct.unpack('>%dH'%(NSAMPLES*2*4), x)
            v = [xx >> 6 for xx in d]
            for j in range(4):
                out[4*i + j] = v[j::4]
        if signed:
            out[out>511] -= 1024
        return np.array(out, dtype=np.int32)
    
    def _get_errs_by_delay(self, adc, step_size=TAP_STEP_SIZE, test_val=0b0000010101):
        """
        Get number of ADC link errors as a function of input delay tap setting.

        :param adc: ADS5296 object associated with an FMC ADC interface.
        :type adc: casperfpga.ads5296.AD5296

        :param step_size: Number of IDELAY tap steps between error counts.
        :type step_size: int

        :param test_val: The test value the ADC should transmit to the FPGA.
            In order for error detection and work framing to work correctly,
            this should be a value containing both ones and zeros, which,
            when repeated in a serial stream, has an unambiguous word start
            position.
        :type test_val: int

        :return: Array of errors with dimensions
            [DELAY_TRIAL, ADC_CHIPS_PER_FMC_CARD, DATA_LANES_PER_ADC_CHIP].
            A delay trial of ``n`` indicates an IDELAY tap setting of
            ``n`` x ``step_size``
        :rtype: list
        """
        for i in range(8):
            adc.enable_test_pattern('constant', i, val0=test_val)
        NTAPS=512
        NSTEPS = NTAPS // step_size
        d = np.zeros([NSTEPS, 8, 8, NSAMPLES]) # taps x chips x lanes x samples
        errs = np.zeros([NSTEPS, 8, 8]) # taps x chips x lanes
        for cs in range(8):
            #a.enable_rst_data(range(8), cs)
            adc.disable_rst_data(range(8), cs)
            adc.enable_vtc_data(range(8), cs)
            adc.disable_vtc_data(range(8), cs)
        self._info("FMC %d Scanning data delays" % adc.fmc)
        pb = progressbar.ProgressBar()
        for dn, delay in enumerate(pb(range(0, NTAPS, step_size))):
            self._debug("FMC %d Scanning delay %d" % (adc.fmc, delay))
            for cs in range(8):
                adc.load_delay_data(delay, range(8), cs)
            d[dn] = self.get_snapshot(adc.fmc)
        for t in range(NSTEPS):
            for c in range(8):
                for l in range(8):
                    errs[t,c,l] = np.count_nonzero(d[t,c,l,:] != test_val)
        return errs.tolist()
    
    def _get_errs(self, adc, use_ramp=False, test_val=0b0000010101):
        """
        Put all ADCs on an FMC interface in test mode, and check a snapshot
        of ADC data for transmission errors.

        :param adc: ADS5296 object associated with an FMC ADC interface.
        :type adc: casperfpga.ads5296.AD5296

        :param use_ramp: If True, set the ADC into ramp test mode, in which
            a counter is transmitted. If False, send the provided test value.
        :type use_ramp: bool
        
        :param test_val: The test value the ADC should transmit to the FPGA.
            In order for error detection and work framing to work correctly,
            this should be a value containing both ones and zeros, which,
            when repeated in a serial stream, has an unambiguous word start
            position.
        :type test_val: int

        :return: Array of number of errors detected per ADC chip and lane.
            Error array has dimensions [ADC_CHIPS_PER_FMC_CARD, DATA_LANES_PER_ADC_CHIP].
        :rtype: list
        """
        for i in range(8):
            if use_ramp:
                adc.enable_test_pattern('ramp', i)
            else:
                adc.enable_test_pattern('constant', i, val0=test_val)
        errs = np.zeros([8, 8]) # taps x chips x lanes
        d = self.get_snapshot(adc.fmc)
        for c in range(8):
            for l in range(8):
                if use_ramp:
                    ds = d[c,l]
                    for i in range(1,ds.shape[0]):
                        if ds[i] != ((ds[i-1] + 1) % 1024):
                            errs[c,l] += 1
                else:
                    errs[c,l] = np.count_nonzero(d[c,l,:] != test_val)
        return errs.tolist()
        
    
    def _get_best_delays(self, errs, step_size=TAP_STEP_SIZE):
        """
        Given an array of errors (per delay setting, per ADC chip, per data lane)
        such as that provided by ``_get_errs_by_delay``, determine the optimal
        IDELAY tap setting.

        :param errs: Array of error counts with dimensions
            [DELAY_TRIALS, ADC_CHIPS, DATA_LANES_PER_ADC_CHIP] such as that
            returned by ``_get_errs_by_delay``.
        :type errs: list
      
        :param step_size: Number of IDELAY tap steps between delay trials.
        :type step_size: int

        :return: (best_delays, best_slacks) tuple. ``best_delays`` is an
            array of shape [ADC_CHIPS, DATA_LANES_PER_ADC_CHIP] containing
            the optimal delay setting for each ADC chip and data lane.
            ``best_slacks`` is the range of delay values around the optimal
            value chosen which exhibited no errors.
        :rtype: (list, list)
        """
        errs = np.array(errs)
        nsteps, nchips, nlanes = errs.shape
        slack = np.zeros_like(errs)
        best_delay = np.zeros([nchips, nlanes], dtype=np.int32)
        best_slack = np.zeros_like(best_delay)
        for c in range(nchips):
            for l in range(nlanes):
                for s in range(nsteps):
                    #count number of zeros before this slot
                    count_before = 0
                    for j in range(s, 0, -1):
                        if errs[j, c, l] == 0:
                            count_before += 1
                        else:
                            break
                    #count number of zeros after this slot
                    count_after= 0
                    for j in range(s, nsteps, 1):
                        if errs[j, c, l] == 0:
                            count_after += 1
                        else:
                            break
                    slack[s,c,l] = min(count_before, count_after)
        for c in range(nchips):
            for l in range(nlanes):
                best_trial = slack[:,c,l].argmax()
                best_delay[c,l] = best_trial * step_size
                best_slack[c,l] = slack[best_trial,c,l] * step_size
                self._debug("Chip %d, Lane %d: Best delay: %d (slack %d)" % (c, l, best_delay[c,l], best_slack[c,l]))
        return best_delay.tolist(), best_slack.tolist()
    
    def _set_delays(self, adc, delays):
        """
        Set IDELAY tap values for all ADC data lanes on an FMC port.

        :param adc: ADS5296 object associated with an FMC ADC interface.
        :type adc: casperfpga.ads5296.AD5296

        :param delays: Array of delays to load, with shape
            [ADC_CHIPS, DATA_LANES_PER_ADC_CHIP], such as that returned
            by ``_get_best_delays``.
        :type delays: list
        """
        delays = np.array(delays)
        nchips, nlanes = delays.shape
        for cs in range(8):
            #adc.enable_rst_data(range(8), cs)
            adc.disable_rst_data(range(8), cs)
            adc.disable_vtc_data(range(8), cs)
        for c in range(nchips):
            for l in range(nlanes):
                adc.load_delay_data(delays[c,l], [l], c)
        for cs in range(8):
            adc.enable_vtc_data(range(8), cs)
    
    def print_sweep(self, errs, best_delays=None, step_size=TAP_STEP_SIZE):
        """
        Print, using ASCII, the valid data capture eye as a function of delay
        setting. Delays are printed such that one row represents a sweep
        of delays for a single ADC data lane.
        Each column in the row is ``X`` if data contained errors at this delay,
        ``-`` if no errors were detected at this delay, and ``|``, if this
        delay is considered the best setting in the sweep range.

        :param errs: Array of error counts with dimensions
            [DELAY_TRIALS, ADC_CHIPS, DATA_LANES_PER_ADC_CHIP] such as that
            returned by ``_get_errs_by_delay``.
        :type errs: list
      
        :param best_delays: Array of best delays, with shape
            [ADC_CHIPS, DATA_LANES_PER_ADC_CHIP], such as that returned
            by ``_get_best_delays``. These delays are marked with an
            ASCII ``|``.
        :type best_delays: list

        :param step_size: Number of IDELAY tap steps between delay trials.
        :type step_size: int
        """
        errs = np.array(errs)
        if best_delays is not None:
            best_delays = np.array(best_delays)
        nsteps, nchips, nlanes = errs.shape
        char = ["-", "X"]
        for c in range(nchips):
            for l in range(nlanes):
                msg = "Chip %d, Lane %d:    " % (c, l)
                for s in range(nsteps):
                    if best_delays is not None:
                        if s == best_delays[c,l] // step_size:
                            msg += "|"
                        else:
                            msg += "%s" % char[int(errs[s, c, l] != 0)]
                    else: 
                        msg += "%s" % char[int(errs[s, c, l] != 0)]
                self._info(msg)
    
    def _init(self):
        """
        Reset and initialize all ADC chips, using the ADS5296.init
        method.
        """
        for adc in self.adcs:
            for i in range(8):
                adc.init(i) # includes reset
    
    def use_toggle(self, val0, val1):
        """
        Set all ADCs into the "toggle" test mode, in which ADC
        samples are replaced with a toggling pattern of two
        10-bit values.

        :param val0: First value ADCs should output.
        :type val0: int

        :param val1: Second value ADCs should output.
        :type val1: int

        """

        val0 = val0 & 0x3ff
        val1 = val1 & 0x3ff
        for adc in self.adcs:
            for i in range(8):
                adc.enable_test_pattern('toggle', i, val0=val0, val1=val1)
    
    def use_ramp(self):
        """
        Set all ADCs into the "ramp" test mode, in which ADC
        samples are replaced with a 10-bit counter which
        increments with each ADC clock.
        """
        for adc in self.adcs:
            for i in range(8):
                adc.enable_test_pattern('ramp', i)
    
    def use_data(self):
        """
        Set all ADCs into normal operating mode, in which analog inputs
        are digitized and transmitted.
        """
        for adc in self.adcs:
            for i in range(8):
                adc.enable_test_pattern('data', i)

    def calibrate(self, use_ramp=False, fail_hard=True, step_size=TAP_STEP_SIZE):
        """
        Compute and set all ADC data lane input delays to their optimal values.
        After this call, the ADCs are left in test mode.

        :param use_ramp: If True, after calibration, use the ramp test
            pattern to verify the ADC->FPGA link is functioning correctly.
            If False, perform this verification with the same constant test
            value used for the calibration procedure.
        :type use_ramp: bool

        :param fail_hard: If True, raise an exception if the calibration run
            doesn't go to plan.
        :type fail_hard: bool

        :param step_size: Number of IDELAY tap steps between error counts.
        :type step_size: int

        :return: (status, delays, slack) tuple.
            ``status`` is True if the calibration procedure succeeded. False otherwise.
            ``delays`` is an N_ADC_BOARD x N_ADC_CHIP x DATA_LANES_PER_CHIP array of
            chosen delays.
            ``slack`` is an N_ADC_BOARD x N_ADC_CHIP x DATA_LANES_PER_CHIP array of
            slacks -- the number of delay taps between the chosen delay and the
            nearest delay which showed ADC errors.
        :rtype: bool, list, list
        """
        ok = True
        TEST_VAL = 0b0000010101
        best_by_adc = []
        slack_by_adc = []
        for adc in self.adcs:
            #self.reset() # Flush FIFOs and begin reading after next sync
            #self.sync() # Need to sync after moving fclk to re-lock deserializers
            for board in range(2):
                adc.set_bitslip_index(0, board)
                adc.decrement_bitslip_index(board) # empirically optimized
                adc.decrement_bitslip_index(board) # empirically optimized
            errs = np.array(self._get_errs_by_delay(adc, test_val=TEST_VAL,
                                                    step_size=step_size))
            for slip in range(2):
                rescan = False
                for board in range(2):
                    if not np.any(errs[1:-2, 4*board:4*(board+1), :] == 0):
                        rescan = True
                        self._info("Bitslipping board %d because everywhere was bad" % board)
                        adc.decrement_bitslip_index(board)
                        adc.decrement_bitslip_index(board)
                if rescan:
                    errs = np.array(self._get_errs_by_delay(adc, test_val=TEST_VAL,
                                                            step_size=step_size))
            for slip in range(5):
                slip_done = True
                if np.any(errs[0:5,:,:] == 0):
                    slip_done = False
                    #self.print_sweep(errs, best_delays=best)
                    for board in range(2):
                        # Make the error search wider here, to encourage boards to
                        # be slipped together
                        if np.any(errs[0:20, 4*board:4*(board+1), :] == 0):
                            self._info("Bitslipping board %d because delay start too large" % board)
                            adc.increment_bitslip_index(board)
                    errs = np.array(self._get_errs_by_delay(adc, test_val=TEST_VAL,
                                                            step_size=step_size))
                if np.any(errs[-5:-1,:,:] == 0):
                    slip_done = False
                    #self.print_sweep(errs, best_delays=best)
                    for board in range(2):
                        # Make the error search wider here, to encourage boards to
                        # be slipped together
                        if np.any(errs[-20:-1, 4*board:4*(board+1), :] == 0):
                            self._info("Bitslipping board %d because delay end too small" % board)
                            adc.decrement_bitslip_index(board)
                    errs = np.array(self._get_errs_by_delay(adc, test_val=TEST_VAL,
                                                            step_size=step_size))
                if slip_done:
                    break
            best, slack = self._get_best_delays(errs, step_size=step_size)
            best_by_adc += [best]
            slack_by_adc += [slack]
            self._info("FMC %d data lane delays:\n%s" % (adc.fmc, best))
            self._info("FMC %d data lane slacks:\n%s" % (adc.fmc, slack))
            if np.any(np.array(slack) < 20):
                self._warning("Delay solutions have small slack")
            self.print_sweep(errs, best_delays=best, step_size=step_size)
            #for cn, chipdelay in enumerate(best):
            #    data_delays_fh.write(",".join(map(str, chipdelay)))
            #    data_delays_fh.write("\n")
            self._set_delays(adc, best)
            #do_bitslip(adc)
            errs = np.array(self._get_errs(adc, use_ramp=use_ramp, test_val=TEST_VAL))
            adc_ok = (errs.sum() == 0)
            if not adc_ok:
                self._error("FMC %d: Data calibration Failure!" % adc.fmc)
                if fail_hard:
                    raise RuntimeError("FMC %d: Data calibration Failure!" % adc.fmc)
                ok = False
        return ok, best_by_adc, slack_by_adc

    def sync(self):
        """
        Toggle the ADC sync input.
        """
        self.change_reg_bits(CONTROL_REG, 0, SYNC_BIT)
        self.change_reg_bits(CONTROL_REG, 1, SYNC_BIT)
        self.change_reg_bits(CONTROL_REG, 0, SYNC_BIT)
    
    def reset(self):
        """
        Toggle the ADC reset input.
        """
        self.change_reg_bits(CONTROL_REG, 0, RST_BIT)
        self.change_reg_bits(CONTROL_REG, 1, RST_BIT)
        self.change_reg_bits(CONTROL_REG, 0, RST_BIT)
