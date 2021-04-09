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

TAP_STEP_SIZE = 4
NSAMPLES = 256
USE_EMBEDDED_BRAM = False
NBOARDS = 2
NFMCS = 2

TRIG_REG = 'snapshot_trigger'

class Adc(Block):
    def __init__(self, host, name, logger=None, **kwargs):
        """
        Instantiate an ADC block.
        
        Inputs:
           host (casperfpga.Casperfpga): Host FPGA
           sample_rate (float): Sample rate in MS/s
           num_chans (int): Number of channels per ADC chip. Valid values are 1, 2, or 4.
           resolution (int): Bit resolution of the ADC. Valid values are 8, 12.
           ref (float): Reference frequency (in MHz) from which ADC clock is derived. If None, an external sampling clock must be used.
        """
        super(Adc, self).__init__(host, name, logger)
        # Check which ADCs are connected. Only if no ADC chips on an FMC board
        # respond do we ignore a port
        self.adcs = []
        self._connect_to_adcs()

    def _connect_to_adcs(self):
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
        Initialize the configuration of the ADC chip.
        Returns True if initialization was successful. False otherwise.
        """
        if read_only:
            return
        # If we haven't yet connected to any ADCs, retry (maybe the board
        # has been programmed since the last attempt)
        if len(self.adcs) == 0:
            self._info("Retrying ADC connections")
            self._connect_to_adcs()
        # If there are still no ADCs, give up
        if len(self.adcs) == 0:
            self._error("No ADCs found! Giving up intialization")
            return
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
        self.mmcm_is_locked()
        # Flush FIFOs
        for i in range(10): self.reset()
        for i in range(10): self.sync()
        self.calibrate()
        return True

    def mmcm_is_locked(self):
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

    def trigger_snapshot(self):
        self.write_int(TRIG_REG, 0b0)          
        self.write_int(TRIG_REG, 0b1)
        self.write_int(TRIG_REG, 0b0)

    def get_snapshot(self, fmc, signed=False):
        out = np.zeros([8,8,NSAMPLES])
        self.trigger_snapshot()
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
    
    def get_snapshot_interleaved(self, fmc, signed=False):
        out = np.zeros([32,2*NSAMPLES])
        self.trigger_snapshot()
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
        for dn, delay in enumerate(progressbar.progressbar(range(0, NTAPS, step_size))):
            self._debug("FMC %d Scanning delay %d" % (adc.fmc, delay))
            for cs in range(8):
                adc.load_delay_data(delay, range(8), cs)
            d[dn] = self.get_snapshot(adc.fmc)
        for t in range(NSTEPS):
            for c in range(8):
                for l in range(8):
                    errs[t,c,l] = np.count_nonzero(d[t,c,l,:] != test_val)
        return errs
    
    def _get_errs(self, adc, use_ramp=False, test_val=0b0000010101):
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
        return errs
        
    
    def _get_best_delays(self, errs, step_size=TAP_STEP_SIZE):
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
        return best_delay, best_slack
    
    def set_delays(self, a, delays, step_size=TAP_STEP_SIZE):
        nchips, nlanes = delays.shape
        for cs in range(8):
            #a.enable_rst_data(range(8), cs)
            a.disable_rst_data(range(8), cs)
            a.disable_vtc_data(range(8), cs)
        for c in range(nchips):
            for l in range(nlanes):
                a.load_delay_data(delays[c,l], [l], c)
        for cs in range(8):
            a.enable_vtc_data(range(8), cs)
    
    def print_sweep(self, errs, best_delays=None, step_size=TAP_STEP_SIZE):
        nsteps, nchips, nlanes = errs.shape
        char = ["-", "X"]
        for c in range(nchips):
            for l in range(nlanes):
                msg = "Chip %d, Lane %d:    " % (c, l)
                for s in range(nsteps):
                    if best_delays is not None:
                        if s == best_delays[c,l] // TAP_STEP_SIZE:
                            msg += "|"
                        else:
                            msg += "%s" % char[int(errs[s, c, l] != 0)]
                    else: 
                        msg += "%s" % char[int(errs[s, c, l] != 0)]
                self._debug(msg)
    
    def _init(self):
        for adc in self.adcs:
            for i in range(8):
                adc.init(i) # includes reset
    
    def _use_ramp(self):
        for adc in self.adcs:
            for i in range(8):
                adc.enable_test_pattern('ramp', i)
    
    def _use_data(self):
        for adc in self.adcs:
            for i in range(8):
                adc.enable_test_pattern('data', i)

    def calibrate(self, use_ramp=False):
        ok = True
        TEST_VAL = 0b0000010101
        for adc in self.adcs:
            #self.reset() # Flush FIFOs and begin reading after next sync
            #self.sync() # Need to sync after moving fclk to re-lock deserializers
            errs = self._get_errs_by_delay(adc, test_val=TEST_VAL)
            best, slack = self._get_best_delays(errs)
            self._info("FMC %d data lane delays:\n%s" % (adc.fmc, best))
            self._info("FMC %d data lane slacks:\n%s" % (adc.fmc, slack))
            if np.any(slack < 20):
                self.warning("Delay solutions have small slack")
            self.print_sweep(errs, best_delays=best)
            #for cn, chipdelay in enumerate(best):
            #    data_delays_fh.write(",".join(map(str, chipdelay)))
            #    data_delays_fh.write("\n")
            self.set_delays(adc, best)
            #do_bitslip(adc)
            errs = np.array(self._get_errs(adc, use_ramp=use_ramp, test_val=TEST_VAL))
            adc_ok = (errs.sum() == 0)
            if not adc_ok:
                self._error("FMC %d: Data calibration Failure!" % adc.fmc)
                ok = False
        return ok

    def sync(self):
        self.write_int('sync', 0)
        self.write_int('sync', 1)
        self.write_int('sync', 0)
    
    def reset(self):
        self.write_int('rst', 0)
        self.write_int('rst', 1)
        self.write_int('rst', 0)
