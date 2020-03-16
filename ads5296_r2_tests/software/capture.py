import corr
import logging
import caltech_adc
import time
import struct
import argparse
import numpy as np
from matplotlib import pyplot as plt

BOFFILE = "ads5296_r2_test_mux_2020_Feb_26_0914.bof"
DEFAULT_ROACH = "r2d020669"

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def calibrate(roach, boffile):
    print("Programming FPGA with %s" % boffile)
    roach.progdev(boffile)
    
    a = caltech_adc.CaltechAdc(roach, logger=logger)
    
    a.init(samplingRate=200, numChannel=4)
    a.reset() # Reset FPGA MMCMs
    
    # Reporgram FPGA now that ADC clocks should be setup
    print("Re-programming FPGA with %s now ADCs have been initialized" % boffile)
    roach.progdev(boffile)
    
    a.logger.info('Check if MMCM locked')
    if not a.getWord('ADC16_LOCKED'):
       a.logger.error('MMCM not locked.')
    else:
       a.logger.info('ok')
    
    a.calibrate()

def set_mode(roach, mode):
    a = caltech_adc.CaltechAdc(roach, logger=logger)
    if mode == "ramp":
        a.selectADC([0,2])
        a.adc.test_ads('en_ramp')
        a.selectADC([1,3])
        a.adc.test('en_ramp')
        a.selectADC()
    elif mode == 'adc':
        a.selectADC([0,2])
        a.adc.test_ads('off')
        a.selectADC([1,3])
        a.adc.test('off')
        a.selectADC()
    else:
        print("ADC mode %s not understood!" % mode)
    time.sleep(0.2)

def sync(roach):
    roach.write_int('sync',0); roach.write_int('sync', 1); roach.write_int('sync', 0)
    time.sleep(0.2)

def capture(roach, chans=[0]):
    N_BUFS = 4  # Number of capture buffers per channel
    N_BYTES = 2**17 # Number of bytes per capture buffer
    n_chans = len(chans)
    for chan in range(n_chans):
        roach.write_int("chan_sel%d" % chan, chans[chan])
    a = caltech_adc.CaltechAdc(roach, logger=logger)
    # Arm snapshots
    for chan in range(n_chans): # Arm both ADC channels
        for buf in range(N_BUFS): # Arm all 4 capture buffers per stream
            ss_ctrl_name = "snapshot%d_buf%d_ctrl" % (chan, buf)
            ss_stat_name = "snapshot%d_buf%d_status" % (chan, buf)
            # Don't trigger. Issue a global trigger to all buffers later
            roach.write_int(ss_ctrl_name, 0)
            roach.write_int(ss_ctrl_name, 1)
            roach.write_int(ss_ctrl_name, 0)
    # Issue trigger
    a.snapshot()
    MAX_WAIT = 10
    waits = 0
    while roach.read_uint(ss_stat_name) != N_BYTES:
        time.sleep(0.01)
        waits += 1
        if waits > MAX_WAIT:
            print("ERROR:Waiting for a snapshot took too long!")
            exit()
    data = []
    for chan in range(n_chans):
        data += [[]]
        for buf in range(N_BUFS):
            ss_buf_name = "snapshot%d_buf%d_bram" % (chan, buf)
            data[chan] += struct.unpack(">%dh" % (N_BYTES/2), roach.read(ss_buf_name, N_BYTES))
    return np.array(data)
    
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write ADC sample data to files",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-r", dest="roachhost", type=str, default=DEFAULT_ROACH,
                        help="ROACH board to which connection should be made")
    parser.add_argument("-b", dest="boffile", type=str, default=BOFFILE,
                        help="Boffile to program, if using the -p flag")
    parser.add_argument("-p", dest="program", action="store_true",
                        help="Program the ROACH board with the specified boffile")
    parser.add_argument("-A", dest="chan_a", type=int, default=8,
                        help="First ADC channel to capture (allowed values: 0 through 15)")
    parser.add_argument("-B", dest="chan_b", type=int, default=None,
                        help="Second ADC channel to capture (allowed values: 0 through 15, or None)")
    parser.add_argument("-N", dest="n_dumps", type=int, default=1,
                        help="Number of captures to dump to disk")
    parser.add_argument("--mode", dest="mode", type=str, default=None,
                        help="'ramp', or 'adc'. Explicitly leave the ADC in ramp or normal mode")
    parser.add_argument("--sync", dest="sync", action="store_true",
                        help="Toggle the sync pin on the ADS5296 chips")
    parser.add_argument("--plot", dest="plot", action="store_true",
                        help="Plot data, rather than writing to disk")
    args = parser.parse_args()

    roach = corr.katcp_wrapper.FpgaClient(args.roachhost)
    time.sleep(0.1)
    if args.program:
        calibrate(roach, args.boffile)

    if args.mode is not None:
        print("Setting ADCs to mode: %s" % args.mode)
        if args.mode not in ["ramp", "adc"]:
            print("Only mode values 'ramp' and 'adc' and allowed!")
            exit()
        else:
            set_mode(roach, args.mode)

    if args.sync:
        print("Triggering external ADC sync pin(s)")
        sync(roach)

    chans = [args.chan_a]
    if args.chan_b is not None:
        chans += [args.chan_b]

    if args.plot:
        data = capture(roach, chans)
        n_chans, n_points = data.shape
        for chan in range(n_chans):
            plt.subplot(n_chans, 2, chan*2 + 1)
            plt.plot(data[chan][0:1024])
            plt.xlabel("ADC sample")
            plt.ylabel("ADC value")
            plt.title("ADC %d" % chans[chan])
            plt.subplot(n_chans, 2, chan*2 + 2)
            D = 10*np.log10(np.abs(np.fft.rfft(data[chan]))**2)
            freq_axis = np.linspace(0, 0.5, D.shape[0])
            plt.plot(freq_axis, D)
            plt.xlabel("Frequency [fraction of sampling rate]")
            plt.ylabel("Power [dB] (arb. reference)")
            plt.title("ADC %d" % chans[chan])
        plt.show()
        exit()
    t = time.ctime()
    filename = "ADS5296_dump_%s_%s.csv" % (chans, t)
    with open(filename, 'w') as fh:
        fh.write("%s\n" % t)
        fh.write("%s\n" % (','.join(map(str, chans))))
    for i in range(args.n_dumps):
        print "Capturing %d of %d" % (i+1, args.n_dumps)
        data = capture(roach, chans)
        with open(filename, 'a') as fh:
            np.savetxt(fh, data, fmt="%d", delimiter=",")
