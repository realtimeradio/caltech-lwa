import time
import struct
import argparse
import numpy as np
from matplotlib import pyplot as plt

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write ADC sample data to files",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-N", dest="n_dumps", type=int, default=1,
                        help="Number of captures to plot")
    parser.add_argument("filename", type=str,
                        help="File to plot")
    args = parser.parse_args()

    with open(args.filename, "r") as fh:
        t = fh.readline()
        chans = map(int, fh.readline().split(','))
        n_chans = len(chans)
        print("Time: %s" % t)
        print("ADC channels captured: %s" % chans)
        lines_to_read = n_chans * args.n_dumps
        lines = [fh.readline() for _ in range(lines_to_read)]
    data = np.loadtxt(lines, dtype=np.int32, delimiter=",", ndmin=2)

    for dump in range(args.n_dumps):
        for chan in range(n_chans):
            # Slice data for this dump / channel
            d = data[n_chans*dump + chan, :]
            plt.subplot(n_chans, 2, chan*2 + 1)
            plt.plot(d[0:1024])
            plt.xlabel("ADC sample")
            plt.ylabel("ADC value")
            plt.title("ADC %d" % chans[chan])
            plt.subplot(n_chans, 2, chan*2 + 2)
            D = 10*np.log10(np.abs(np.fft.rfft(d))**2)
            freq_axis = np.linspace(0, 0.5, D.shape[0])
            plt.plot(freq_axis, D)
            plt.xlabel("Frequency [fraction of sampling rate]")
            plt.ylabel("Power [dB] (arb. reference)")
            plt.title("ADC %d" % chans[chan])
    plt.show()
