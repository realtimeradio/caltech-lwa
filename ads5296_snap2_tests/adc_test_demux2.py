#!/usr/bin/env python

import numpy as np
import struct
import time
import argparse
import sys
import os

import casperfpga
import logging

import progressbar

logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)
stdout_handler = logging.StreamHandler(sys.stdout)
stdout_handler.setLevel(logging.INFO)
stderr_handler = logging.StreamHandler(sys.stderr)
stderr_handler.setLevel(logging.DEBUG)
logger.addHandler(stdout_handler)
logger.addHandler(stderr_handler)

TAP_STEP_SIZE = 4
NSAMPLES = 256
USE_EMBEDDED_BRAM = True

FMC_NAMES = ['fmca', 'fmcb']

try:
    from casperfpga import ads5296
except ImportError:
    logger.error("Couldn't import ADS5296 control library from casperfpga")
    logger.error("Are you using the correct python environment?")

#def get_snapshot(a, signed=False):
#    out = np.zeros([8,8,NSAMPLES])
#    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)          
#    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b1)
#    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)
#    # Loop over chips
#    for i in range(8):     
#        x = a.fpga.read('snapshot%d_snapshot_bram' % i, 8192)
#        d = struct.unpack('>4096H', x)
#        # Remove 10-bit -> 16-bit padding
#        v = [xx >> 6 for xx in d]
#        # Loop over lanes
#        for j in range(4): # ADCs
#            for k in range(2): # interleaving
#                out[i, 2*j+k] = v[4*k+j::8]
#    if signed:
#        out[out>511] -= 1024
#    return np.array(out, dtype=np.int32)

def get_snapshot(adcs, signed=False, use_embedded=USE_EMBEDDED_BRAM):
    n_adcs = len(adcs)
    out = np.zeros([n_adcs, 8,8,NSAMPLES])
    if use_embedded:
        trig_reg = 'snapshot_trig'
    else:
        trig_reg = '%s_snapshot0_snapshot_ctrl' % FMC_NAMES[0]
    adcs[0].fpga.write_int(trig_reg, 0b0)          
    adcs[0].fpga.write_int(trig_reg, 0b1)
    adcs[0].fpga.write_int(trig_reg, 0b0)
    # Loop over ADCs
    for adcn, a in enumerate(adcs):
        # Loop over chips
        for i in range(8):     
            if use_embedded:
                x = a.fpga.read('ads5296_wb_ram%d_%d_%d' % (a.fmc, i // 4, i % 4), NSAMPLES*2*2*4)
            else:
                x = a.fpga.read('%s_snapshot%d_snapshot_bram' % (FMC_NAMES[a.fmc], i), NSAMPLES*2*2*4)
            d = struct.unpack('>%dH'%(NSAMPLES*2*4), x)
            # Remove 10-bit -> 16-bit padding
            v = [xx >> 6 for xx in d]
            # Loop over lanes
            for j in range(4): # ADCs
                for k in range(2): # interleaving
                    out[adcn, i, 2*j+k] = v[4*k+j::8]
    if signed:
        out[out>511] -= 1024
    return np.array(out, dtype=np.int32)

def get_deep_snapshot(a):
    a.fpga.write_int("%s_single_chan_ss_ctrl" % FMC_NAMES[a.fmc], 0b0)
    a.fpga.write_int("%s_single_chan_ss_ctrl" % FMC_NAMES[a.fmc], 0b1)
    a.fpga.write_int("%s_single_chan_ss_ctrl" % FMC_NAMES[a.fmc], 0b0)
    x = a.fpga.read("%s_single_chan_ss_bram" % FMC_NAMES[a.fmc], 2*2**16)
    d = struct.unpack(">%dh" % (2**16), x)
    return np.array([d], dtype=np.int32) >> 6 # 10 bit samples are in MSBs of 16-bit words

def get_snapshot_interleaved(adcs, signed=False, use_embedded=USE_EMBEDDED_BRAM):
    n_adcs = len(adcs)
    out = np.zeros([n_adcs, 32,2*NSAMPLES])
    if use_embedded:
        trig_reg = 'snapshot_trig'
    else:
        trig_reg = '%s_snapshot0_snapshot_ctrl' % FMC_NAMES[0]
    adcs[0].fpga.write_int(trig_reg, 0b0)          
    adcs[0].fpga.write_int(trig_reg, 0b1)
    adcs[0].fpga.write_int(trig_reg, 0b0)
    # Loop over ADCs
    for adcn, a in enumerate(adcs):
        for i in range(8):     
            if use_embedded:
                x = a.fpga.read('ads5296_wb_ram%d_%d_%d' % (a.fmc, i // 4, i % 4), NSAMPLES*2*2*4)
            else:
                x = a.fpga.read('%s_snapshot%d_snapshot_bram' % (FMC_NAMES[a.fmc], i), NSAMPLES*2*2*4)
            d = struct.unpack('>%dH'%(NSAMPLES*2*4), x)
            v = [xx >> 6 for xx in d]
            for j in range(4):
                out[adcn, 4*i + j] = v[j::4]
    if signed:
        out[out>511] -= 1024
    return np.array(out, dtype=np.int32)

def get_data_delays(a, step_size=TAP_STEP_SIZE, test_val=0b0000010101):
    for i in range(8):
        a.enable_test_pattern('constant', i, val0=test_val)
    NTAPS=512
    NSTEPS = NTAPS // step_size
    d = np.zeros([NSTEPS, 8, 8, NSAMPLES]) # taps x chips x lanes x samples
    errs = np.zeros([NSTEPS, 8, 8]) # taps x chips x lanes
    for cs in range(8):
        #a.enable_rst_data(range(8), cs)
        a.disable_rst_data(range(8), cs)
        a.enable_vtc_data(range(8), cs)
        a.disable_vtc_data(range(8), cs)
    logger.info("Scanning data delays")
    for dn, delay in enumerate(progressbar.progressbar(range(0, NTAPS, step_size))):
        for cs in range(8):
            a.load_delay_data(delay, range(8), cs)
        d[dn] = get_snapshot([a])[0]
    for t in range(NSTEPS):
        for c in range(8):
            for l in range(8):
                errs[t,c,l] = np.count_nonzero(d[t,c,l,:] != test_val)
    return errs

def do_bitslip(a):
    TEST_VAL = 0b1111100000
    for i in range(8):
        a.enable_test_pattern('constant', i, val0=TEST_VAL)
    d = get_snapshot([a])[0]
    for chip in range(8):
        for chan in range(4):
            v = d[chip, chan, 0]
            v_str = np.binary_repr(v, width=10)
            # concat two strings and turn to ints for comparison with shifts
            v2 = int(v_str + v_str, 2)
            for i in range(5):
                logger.info(chip, chan, np.binary_repr((v2>>10)&1023, width=10))
                if ((v2 >> 10) & 1023) == TEST_VAL:
                    # Word boundary OK
                    break
                a.bitslip((chip%4)*4 + chan, chip//4)
                v2 = v2 << 2
                logger.info(np.binary_repr(get_snapshot([a])[0][chip,chan,0], width=10))
                

def get_errs(a, use_ramp=False, test_val=0b0000010101):
    for i in range(8):
        if use_ramp:
            a.enable_test_pattern('ramp', i)
        else:
            a.enable_test_pattern('constant', i, val0=test_val)
    errs = np.zeros([8, 8]) # taps x chips x lanes
    d = get_snapshot([a])[0]
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
    

def get_best_delays(errs, step_size=TAP_STEP_SIZE):
    nsteps, nchips, nlanes = errs.shape
    slack = np.zeros_like(errs)
    best = np.zeros([nchips, nlanes], dtype=np.int32)
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
            best[c,l] = slack[:,c,l].argmax()*step_size
            #logger.debug("Chip %d, Lane %d: Best delay: %d" % (c, l, best[c,l]))
    return best

def set_delays(a, delays, step_size=TAP_STEP_SIZE):
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

def print_sweep(errs, best_delays=None, step_size=TAP_STEP_SIZE):
    nsteps, nchips, nlanes = errs.shape
    char = ["-", "X"]
    for c in range(nchips):
        for l in range(nlanes):
            msg = "Chip %d, Lane %d:\t" % (c, l)
            for s in range(nsteps):
                if best_delays is not None:
                    if s == best_delays[c,l] // TAP_STEP_SIZE:
                        msg += "|"
                    else:
                        msg += char[int(errs[s, c, l] != 0)]
                else: 
                    msg += char[int(errs[s, c, l] != 0)]
            #msg += '\n'
            logger.debug(msg)
        

def print_snapshot(fmcs, binary=False):
    for fmc in fmcs:
        for i in range(8):             
            s = ''
            for j in range(6):
                for k in range(8):
                    if k%2:
                        d = fmc[i,k]
                    else:
                        d = fmc[i,k,1:]
                    if binary:
                        s += np.binary_repr(d[j], width=10)
                    else:
                        s += "%3d" % d[j]
                    s += "    "
                s += "\n"
            logger.debug(s)

def init(a):
    for i in range(8):
        a.init(i) # includes reset

def use_ramp(a):
    for i in range(8):
        a.enable_test_pattern('ramp', i)

def use_data(a):
    for i in range(8):
        a.enable_test_pattern('data', i)

def sync(fpga):
    fpga.write_int('sync', 0)
    fpga.write_int('sync', 1)
    fpga.write_int('sync', 0)

def reset(fpga):
    fpga.write_int('rst', 0)
    fpga.write_int('rst', 1)
    fpga.write_int('rst', 0)

def cal_fclk(a):
    delay0, slack0 = a.calibrate_fclk(0)
    delay1, slack1 = a.calibrate_fclk(1)
    logger.info("Board 0 FCLK Delay %d (slack %d)" % (delay0, slack0))
    logger.info("Board 1 FCLK Delay %d (slack %d)" % (delay1, slack1))
    if slack0 == 0 or slack1 == 0:
        return False, delay0, delay1
    else:
        return True, delay0, delay1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Configure an ADS5296 board and grab data",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--fmcA", action="store_true",
                        help="Use FMC A; aka FMC 0; aka 'right hand'")
    parser.add_argument("--fmcB", action="store_true",
                        help="Use FMC B; aka FMC 1; aka 'left hand'")
    parser.add_argument("--program", action="store_true",
                        help="Reprogram the FPGA from flash address 0")
    parser.add_argument("--host", type=str, default="snap2-rev2-10",
                        help="Snap hostname / IP address")
    parser.add_argument("--clocksource", type=int, default=None,
                        help="Board form which FPGA clock should be derived. 0='lower', 1='upper'")
    parser.add_argument("--init", action="store_true",
                        help="Reset and initialize ADCs")
    parser.add_argument("--sync", action="store_true",
                        help="Strobe ADC sync line")
    parser.add_argument("--use_ramp", action="store_true",
                        help="Turn on ramp test mode")
    #parser.add_argument("--cal_fclk", action="store_true",
    #                    help="Sweep FCLK delays and use to set ADC data")
    #parser.add_argument("--load_fclk", action="store_true",
    #                    help="Load fclk delays from a provided file specified with --fclk_delayfile")
    #parser.add_argument("--fclk_delayfile", type=str, default="fclk_delays.csv",
    #                    help="File to which new FCLK calibration delays should be written/read")
    parser.add_argument("--cal_data", action="store_true",
                        help="Sweep data line delays and use to set ADC data")
    parser.add_argument("--data_delayfile", type=str, default="data_delays.csv",
                        help="File to which new data lane calibration delays should be written/read")
    parser.add_argument("--load_data", action="store_true",
                        help="Load data delays from a provided file specified with --data_delayfile")
    parser.add_argument("--err_cnt", action="store_true",
                        help="Get error counts")
    parser.add_argument("--reset_error_count", action="store_true",
                        help="Reset the firmware error counters")
    parser.add_argument("--check_errors", action="store_true",
                        help="Set the ADCs to RAMP mode, and watch the firmware error counters. Use Ctrl-C to exit")
    parser.add_argument("--outfile", type=str, default=None,
                        help="Custom output filename")
    parser.add_argument("--header", type=str, default="",
                        help="Custom header text to be written to ithe third line of output file")
    parser.add_argument("-f", "--force", action="store_true",
                        help="Force overwriting of any existing output file")
    parser.add_argument("--print_binary", action="store_true",
                        help="print a snapshot excerpt in binary")
    parser.add_argument("-C", "--channel", type=int, default=None,
                        help="grab 64k samples for a single channel")
    parser.add_argument("-N", dest="n_dumps", type=int, default=0,
                        help="Number of captures to dump to disk. 0 for no file output")
    args = parser.parse_args()


    #if args.load_fclk and args.cal_fclk:
    #    logger.error("--load_fclk and --cal_fclk arguments are mutually exclusive. Exiting.")
    #    exit()

    if args.load_data and args.cal_data:
        logger.error("--load_data and --cal_data arguments are mutually exclusive. Exiting.")
        exit()

    if args.n_dumps != 0 and args.check_errors:
        logger.error("--check_errors and --n_dumps arguments are mutually exclusive. Exiting.")
        exit()

    if args.check_errors and not args.use_ramp:
        logger.warning("WARNING: --check_errors will only produce meaningful results in --use_ramp mode")

    logger.info("Connecting to %s" % args.host)
    s = casperfpga.CasperFpga(args.host, transport=casperfpga.TapcpTransport)

    if args.program:
        logger.info("Reprogramming from flash address 0")
        s.transport.progdev(0)

    fmcs = []
    if args.fmcA:
        logger.info("Using FMC 0 (A; right hand side)")
        fmcs += [ads5296.ADS5296fw(s, 0, logger=logger)]
    if args.fmcB:
        logger.info("Using FMC 1 (B; left hand side)")
        fmcs += [ads5296.ADS5296fw(s, 1, logger=logger)]

    if len(fmcs) == 0:
        logger.error("Use --fmcA or --fmcB to select one or both FMC ports")
        exit()

    for adc in fmcs:
        logger.info("FMC %d firmware has pinout version %d" % (adc.fmc, adc.get_version()))

    #for fmc in fmcs:
    #    fmc.quiet = False
    
    if args.clocksource is not None:
        # set clock source switch
        assert args.clocksource in [0,1], "--clocksource must be 0 or 1"
        for adc in fmcs:
            for board in range(2):
                logger.info("FMC %d board %d: Setting clock source to %d" % (adc.fmc, board, args.clocksource))
                adc.reset_mmcm_assert(board)
                adc.set_clock_source(args.clocksource, board)
                adc.reset_mmcm_deassert(board)
        
    if args.init:
        # Initialize all ADCs, then reset all MMCMs
        # This should leave the MMCMs locked no matter
        # which ADC chip is sourcing the clock.
        for adc in fmcs:
            init(adc)
        time.sleep(0.1) # wait for Initialization. Probably not needed
        for adc in fmcs:
            for board in range(2):
                adc.reset_mmcm(board)
        time.sleep(0.1) # wait for MMCM to come out of reset
        for adc in fmcs:
            for board in range(2):
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
        # Flush FIFOs
        reset(s)
        sync(s)

    for adc in fmcs:
        if args.use_ramp:
            use_ramp(adc)
        else:
            use_data(adc)
            
    if args.sync:
        sync(s)

    for adc in fmcs:
        for i in range(2):
            mmcm_locked = adc.mmcm_get_lock(i)
            if mmcm_locked is not None:
                logger.info("FMC %d core %d MMCM locked?: %s" % (adc.fmc, i, mmcm_locked))
            clocks = adc.read_clk_rates(i)
            logger.info("FMC %d board %d, lclk, fclk[0..3]: %s" % (adc.fmc, i, clocks))

    clockrate = s.estimate_fpga_clock()
    logger.info("FPGA clock: %f" % clockrate)
    if (clockrate == 0):
        logger.error("Exiting because no clock detected")
        exit()

   
    #if args.cal_fclk:
    #    fclk_delays_fh = open(args.fclk_delayfile, "w")
    #elif args.load_fclk:
    #    fclk_delays_fh = open(args.fclk_delayfile, "r")
    if args.cal_data:
        data_delays_fh = open(args.data_delayfile, "w")
    elif args.load_data:
        data_delays_fh = open(args.data_delayfile, "r")

    ok = True 
    #for adc in fmcs: 
    #    fclk_ok = True
    #    if args.cal_fclk:
    #        fclk_ok, delay0, delay1 = cal_fclk(adc)
    #        fclk_delays_fh.write("%d,%d\n" % (delay0, delay1))
    #        if not fclk_ok:
    #            logger.error("FMC %d: FCLK calibration Failure!" % adc.fmc)
    #            ok = False
    #    if args.load_fclk:
    #        delay = list(map(int, fclk_delays_fh.readline().split(',')))
    #        for board_id in range(2):
    #            adc.load_delay_fclk(delay[board_id], board_id*4)
    #            logger.info("FMC %d: Loaded board 0 FCLK Delay %d" % (adc.fmc, delay[board_id]))

    #if args.cal_fclk or args.load_fclk:
    #    for board in range(2):
    #        adc.reset_iserdes(board)
    #    reset(s) # Flush FIFOs and begin reading after next sync
    #    sync(s) # Need to sync after moving fclk to re-lock deserializers
    
    for adc in fmcs: 
        data_ok = True
        #TEST_VAL = 0b0101010101
        TEST_VAL = 0b0000010101
        if args.cal_data:
            reset(s) # Flush FIFOs and begin reading after next sync
            sync(s) # Need to sync after moving fclk to re-lock deserializers
            errs = get_data_delays(adc, test_val=TEST_VAL)
            best = get_best_delays(errs)
            logger.info("Data lane delays for FMC %d [chip x lane]" % adc.fmc)
            logger.info("%s" % best)
            print_sweep(errs, best_delays=best)
            for cn, chipdelay in enumerate(best):
                data_delays_fh.write(",".join(map(str, chipdelay)))
                data_delays_fh.write("\n")
            set_delays(adc, best)
            #do_bitslip(adc)
            errs = np.array(get_errs(adc, use_ramp=args.use_ramp, test_val=TEST_VAL))
            data_ok = errs.sum() == 0
            if not data_ok:
                logger.error("FMC %d: Data calibration Failure!" % adc.fmc)
                ok = False
        if args.load_data:
            delays = np.zeros([8,8], dtype=int)
            for cn in range(8):
                delays[cn] = list(map(int, data_delays_fh.readline().split(',')))
            set_delays(adc, delays)
            errs = np.array(get_errs(adc, use_ramp=args.use_ramp, test_val=TEST_VAL))
            data_ok = errs.sum() == 0
            if not data_ok:
                logger.error("FMC %d: Data calibration Failure after loading delays from file!" % adc.fmc)
                ok = False

        if args.err_cnt:
            errs = get_errs(adc, use_ramp=args.use_ramp, test_val=TEST_VAL)
            logger.info("Errors by lane:")
            logger.info("%s" % errs)
            if not np.array(errs).sum() == 0:
                logger.info("Link OK")
            else:
                logger.error("Link FAIL")
            
    #if args.cal_data or args.cal_fclk:
    if args.cal_data:
        reset(s)
        sync(s)
        if ok:
            logger.info("#######################")
            logger.info("# Calibration SUCCESS #")
            logger.info("#######################")
        else:
            logger.info("!!!!!!!!!!!!!!!!!!!!")
            logger.info("! Calibration FAIL !")
            logger.info("!!!!!!!!!!!!!!!!!!!!")

    x = get_snapshot(fmcs, signed=(not args.print_binary))
    print_snapshot(x, binary=args.print_binary)

    if args.reset_error_count:
       logger.info("Reseting error counters")
       s.write_int('err_cnt_rst', 1)
       s.write_int('err_cnt_rst', 0)

    if args.check_errors:
       t = time.ctime()
       while(True):
           logger.info("Checking for errors at time: %s:" % t)
           for adcn, adc in enumerate(fmcs):
               for i in range(32):
                   x = s.read_uint('%s_err_cnt%d_interleave_err_cnt' % (FMC_NAMES[adc.fmc], i))
                   if x != 0:
                       logger.warning("FMC %d CHIP %d, CHANNEL %d: Lane interleave error count %d" % (adc.fmc, i//4, i%4, x))
                   for j in range(2):
                       x = s.read_uint('%s_err_cnt%d_ramp_err_cnt%d' % (FMC_NAMES[adc.fmc], i, j))
                       if x != 0:
                           logger.warning("FMC %d CHIP %d, CHANNEL %d, LANE %d: Ramp corruption error count %d" %(adc.fmc, i//4, i%4, j, x))
           time.sleep(10)

    if args.n_dumps == 0:
       exit()

    if args.channel is None:
        # Snap all channels
        chans = []
        for adc in fmcs:
            chans += range(32*adc.fmc, 32*(adc.fmc+1))
    else:
        # Perform a long snapshot of a single channel
        assert args.channel < 64, "--channel argument must be < 64"
        chans = [args.channel]
        for adc in fmcs:
            adc.fpga.write_int("%s_chan_sel" % FMC_NAMES[adc.fmc], args.channel % 32)
        
    t = time.time()
    if args.outfile is not None:
        filename = args.outfile
    else:
        if args.channel is None:
            filename = "ADS5296_dump_%d_%d_%d.csv" % (chans[0], chans[-1], t)
        else:
            filename = "ADS5296_dump_%d_%d.csv" % (args.channel, t)
    logger.info("Output file is %s" % filename)
    if not args.force:
        if os.path.exists(filename):
            logger.error("File already exists. Use the -f flag to overwrite, or choose a different --outfile name")
            exit()
    with open(filename, 'w') as fh:
        fh.write("%s\n" % time.ctime(t))
        fh.write("%s\n" % (','.join(map(str, chans))))
        fh.write("%s\n" % args.header)
    for i in range(args.n_dumps):
        logger.debug("Capturing %d of %d" % (i+1, args.n_dumps))
        if args.channel is None:
            x = get_snapshot_interleaved(fmcs, signed=True)
            shape = x.shape
            x = x.reshape(shape[0]*shape[1], shape[2])
        else:
            target_fmc = args.channel // 32
            # Find the right ADC
            target_adc = None
            for adc in fmcs:
                if adc.fmc == target_fmc:
                    target_adc = adc
            if target_adc is None:
                logger.error("Cannot capture channel %d with selected FMCs. You should include FMC B for channels >= 32, and FMC A for channels < 32")
                exit()
            else:
                x = get_deep_snapshot(target_adc)
                #print(x, np.sum(x), x.shape)
        with open(filename, 'a') as fh:
            np.savetxt(fh, x, fmt="%d", delimiter=",")
