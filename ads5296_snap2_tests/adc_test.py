#!/usr/bin/env python

import numpy as np
import struct
import time
import argparse
import sys
import os

import casperfpga

TAP_STEP_SIZE = 4

try:
    from casperfpga import ads5296
except:
    print("Couldn't import ADS5296 control library from casperfpga")
    print("Are you using the correct python environment?")

def get_snapshot(a, signed=False):
    out = np.zeros([8,8,4096//8])
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)          
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b1)
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)
    for i in range(8):     
        x = a.fpga.read('snapshot%d_snapshot_bram' % i, 8192)
        d = struct.unpack('>4096H', x)
        v = [xx >> 6 for xx in d]
        for j in range(8):
            out[i, j] = v[j::8]
    if signed:
        out[out>511] -= 1024
    return np.array(out, dtype=np.int32)

def get_deep_snapshot(a):
    a.fpga.write_int("single_chan_ss_ctrl", 0b0)
    a.fpga.write_int("single_chan_ss_ctrl", 0b1)
    a.fpga.write_int("single_chan_ss_ctrl", 0b0)
    x = a.fpga.read("single_chan_ss_bram", 2*2**16)
    d = struct.unpack(">%dh" % (2**16), x)
    return np.array([d], dtype=np.int32) >> 6 # 10 bit samples are in MSBs of 16-bit words

def get_snapshot_interleaved(a, signed=False):
    out = np.zeros([32,4096//4])
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)          
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b1)
    a.fpga.write_int('snapshot0_snapshot_ctrl', 0b0)
    for i in range(8):     
        x = a.fpga.read('snapshot%d_snapshot_bram' % i, 8192)
        d = struct.unpack('>4096H', x)
        v = [xx >> 6 for xx in d]
        for j in range(4):
            out[4*i + j] = v[j::4]
    if signed:
        out[out>511] -= 1024
    return np.array(out, dtype=np.int32)

def get_data_delays(a, step_size=TAP_STEP_SIZE):
    TEST_VAL = 0b0000010101
    for i in range(8):
        a.enable_test_pattern('constant', i, val0=TEST_VAL)
    NTAPS=512
    NSTEPS = NTAPS // step_size
    d = np.zeros([NSTEPS, 8, 8, 512]) # taps x chips x lanes x samples
    errs = np.zeros([NSTEPS, 8, 8]) # taps x chips x lanes
    for cs in range(8):
        a.enable_rst_data(range(8), cs)
        a.disable_rst_data(range(8), cs)
        a.enable_vtc_data(range(8), cs)
        a.disable_vtc_data(range(8), cs)
    print("Scanning data delays")
    for dn, delay in enumerate(range(0, NTAPS, step_size)):
        print("Scanning delay %d" % delay, file=sys.stderr)
        for cs in range(8):
            a.load_delay_data(delay, range(8), cs)
        d[dn] = get_snapshot(a)
    for t in range(NSTEPS):
        for c in range(8):
            for l in range(8):
                errs[t,c,l] = np.count_nonzero(d[t,c,l,:] != TEST_VAL)
    return errs

def get_errs(a, use_ramp=False):
    TEST_VAL = 0b0000010101
    for i in range(8):
        if use_ramp:
            a.enable_test_pattern('ramp', i)
        else:
            a.enable_test_pattern('constant', i, val0=TEST_VAL)
    errs = np.zeros([8, 8]) # taps x chips x lanes
    d = get_snapshot(a)
    for c in range(8):
        for l in range(8):
            if use_ramp:
                ds = d[c,l]
                for i in range(1,ds.shape[0]):
                    if ds[i] != ((ds[i-1] + 1) % 1024):
                        errs[c,l] += 1
            else:
                errs[c,l] = np.count_nonzero(d[c,l,:] != TEST_VAL)
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
            print("Chip %d, Lane %d: Best delay: %d" % (c, l, best[c,l]), file=sys.stderr)
    return best

def set_delays(a, delays, step_size=TAP_STEP_SIZE):
    nchips, nlanes = delays.shape
    for cs in range(8):
        a.enable_rst_data(range(8), cs)
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
            print("Chip %d, Lane %d:" % (c, l), end="    ", file=sys.stderr)
            for s in range(nsteps):
                if best_delays is not None:
                    if s == best_delays[c,l] // TAP_STEP_SIZE:
                        print("|", end="", file=sys.stderr)
                    else:
                        print(char[int(errs[s, c, l] != 0)], end="", file=sys.stderr)
                else: 
                    print(char[int(errs[s, c, l] != 0)], end="", file=sys.stderr)
            print(file=sys.stderr)
        print(file=sys.stderr)

def print_snapshot(x, binary=False):
    for i in range(8):             
        for j in range(6):
            for k in range(8):
                if binary:
                    print(np.binary_repr(x[i, k, j], width=10), end='  ', file=sys.stderr)
                else:
                    print("%3d" % x[i, k, j], end='  ', file=sys.stderr)
            print(file=sys.stderr)
        print(file=sys.stderr)

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

def cal_fclk(a):
    delay0, slack0 = a.calibrate_fclk(0)
    delay1, slack1 = a.calibrate_fclk(1)
    print("Board 0 FCLK Delay %d (slack %d)" % (delay0, slack0))
    print("Board 1 FCLK Delay %d (slack %d)" % (delay1, slack1))
    if slack0 == 0 or slack1 == 0:
        return False
    else:
        return True


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Configure an ADS5296 board and grab data",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--fmcA", action="store_true",
                        help="Use FMC A; aka FMC 0; aka 'right hand'")
    parser.add_argument("--fmcB", action="store_true",
                        help="Use FMC B; aka FMC 1; aka 'left hand'")
    parser.add_argument("--host", type=str, default="snap2-rev2-10",
                        help="Snap hostname / IP address")
    parser.add_argument("--clocksource", type=int, default=0,
                        help="Board form which FPGA clock should be derived. 0='top', 1='bottom'")
    parser.add_argument("--init", action="store_true",
                        help="Reset and initialize ADCs")
    parser.add_argument("--sync", action="store_true",
                        help="Strobe ADC sync line")
    parser.add_argument("--use_ramp", action="store_true",
                        help="Turn on ramp test mode")
    parser.add_argument("--cal_fclk", action="store_true",
                        help="Sweep FCLK delays and use to set ADC data")
    parser.add_argument("--cal_data", action="store_true",
                        help="Sweep data line delays and use to set ADC data")
    parser.add_argument("--err_cnt", action="store_true",
                        help="Get error counts")
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


    print("Connecting to %s" % args.host)
    s = casperfpga.CasperFpga(args.host, transport=casperfpga.TapcpTransport)

    fmcs = []
    if args.fmcA:
        print("Using FMC 0 (A; right hand side)")
        fmcs += [ads5296.ADS5296fw(s, 0)]
    if args.fmcB:
        print("Using FMC 1 (B; left hand side)")
        fmcs += [ads5296.ADS5296fw(s, 1)]

    if len(fmcs) == 0:
        print("Use --fmcA or --fmcB to select one or both FMC ports")
        exit()
    
    # set clock source switch
    assert args.clocksource in [0,1], "--clocksource must be 0 or 1"
    devs = s.listdev()
    if 'ads5296_clksel1' in devs:
        print("Setting ads5296_clksel1 to %d" % args.clocksource)
        s.write_int('ads5296_clksel1', args.clocksource)

    if 'ads5296_clksel0' in devs:
        print("Setting ads5296_clksel0 to %d" % args.clocksource)
        s.write_int('ads5296_clksel0', args.clocksource)

    for adc in fmcs:
        if args.init:
            init(adc)

        if args.use_ramp:
            use_ramp(adc)
        else:
            use_data(adc)
            
    if args.sync:
        sync(s)

    for adc in fmcs:
        for i in range(2):
            clocks = adc.read_clk_rates(i)
            print("FMC %d board %d, lclk, fclk[0..3]:" % (adc.fmc, i), clocks)

    clockrate = s.estimate_fpga_clock()
    print("FPGA clock: %f" % clockrate)
    if (clockrate == 0):
        exit()

   
    ok = True 
    for adc in fmcs: 
        fclk_ok = True
        if args.cal_fclk:
            fclk_ok = cal_fclk(adc)
            if not fclk_ok:
                print("FMC %d: FCLK calibration Failure!" % adc.fmc)
                ok = False
        sync(s) # Need to sync after moving fclk to re-lock deserializers
    
        data_ok = True
        if args.cal_data:
            errs = get_data_delays(adc)
            best = get_best_delays(errs)
            print("Data lane delays")
            print(best)
            print_sweep(errs, best_delays=best)
            set_delays(adc, best)
            errs = np.array(get_errs(adc, use_ramp=args.use_ramp))
            data_ok = errs.sum() == 0
            if not data_ok:
                print("FMC %d: Data calibration Failure!" % adc.fmc)
                ok = False


        if args.err_cnt:
            errs = get_errs(adc, use_ramp=args.use_ramp)
            print("Errors by lane:")
            print(errs)
            if not np.array(errs).sum() == 0:
                print("Link OK")
            else:
                print("Link FAIL")
            
    if args.cal_data or args.cal_fclk:
        if ok:
            print("#######################")
            print("# Calibration SUCCESS #")
            print("#######################")
        else:
            print("!!!!!!!!!!!!!!!!!!!!")
            print("! Calibration FAIL !")
            print("!!!!!!!!!!!!!!!!!!!!")

    x = get_snapshot(adc, signed=(not args.print_binary))
    print_snapshot(x, binary=args.print_binary)
    if args.n_dumps == 0:
       exit()

    if args.channel is None:
        # Snap all channels
        chans = range(32)
    else:
        # Perform a long snapshot of a single channel
        assert args.channel < 32, "--channel argument must be < 32"
        chans = [args.channel]
        adc.fpga.write_int("chan_sel", args.channel)
        
    t = time.time()
    if args.outfile is not None:
        filename = args.outfile
    else:
        if args.channel is None:
            filename = "ADS5296_dump_0_31_%d.csv" % (t)
        else:
            filename = "ADS5296_dump_%d_%d.csv" % (args.channel, t)
    print("Output file is %s" % filename)
    if not args.force:
        if os.path.exists(filename):
            print("File already exists. Use the -f flag to overwrite, or choose a different --outfile name")
            exit()
    with open(filename, 'w') as fh:
        fh.write("%s\n" % time.ctime(t))
        fh.write("%s\n" % (','.join(map(str, chans))))
        fh.write("%s\n" % args.header)
    for i in range(args.n_dumps):
        print("Capturing %d of %d" % (i+1, args.n_dumps), file=sys.stderr)
        if args.channel is None:
            x = get_snapshot_interleaved(adc, signed=True)
        else:
            x = get_deep_snapshot(adc)
            #print(x, np.sum(x), x.shape)
        with open(filename, 'a') as fh:
            np.savetxt(fh, x, fmt="%d", delimiter=",")
