#!/usr/bin/env python

import time
import struct
import argparse
import numpy as np
from matplotlib import pyplot as plt

def flip_interleave(d):
    #d_temp = np.zeros_like(d)[1:-1]
    #d_temp[0::2] = d[1:-1][1::2]
    #d_temp[1::2] = d[1:-1][0::2]
    d_temp = np.zeros_like(d)
    for i in range(d.shape[0]//2):
        d_temp[2*i] = d[2*i + 1]
        d_temp[2*i+1] = d[2*i]
    return d_temp

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write ADC sample data to files",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-N", dest="n_dumps", type=int, default=1,
                        help="Number of captures to plot")
    parser.add_argument("--flipsamples", dest="flipsamples", action="store_true",
                        help="Flip samples to account for firmware bugs")
    parser.add_argument("--share", dest="share", action="store_true",
                        help="Share a single plot for all channels")
    parser.add_argument("filename", type=str,
                        help="File to plot")
    args = parser.parse_args()

    with open(args.filename, "r") as fh:
        t = fh.readline()
        chans = list(map(int, fh.readline().split(',')))
        n_chans = len(chans)
        print("Time: %s" % t)
        print("ADC channels captured: %s" % chans)
        user_header = fh.readline()
        print("User Header string: %s" % user_header)
        lines_to_read = n_chans * args.n_dumps
        lines = [fh.readline() for _ in range(lines_to_read)]
    data = np.loadtxt(lines, dtype=np.int32, delimiter=",", ndmin=2)


    if not args.share:
        pltx = (n_chans + 3) // 4
        plty = (n_chans + pltx - 1) // pltx
    else:
        pltx = 1
        plty = 1
    
    plt_tot = pltx * plty
    plt.figure()
    for dump in range(args.n_dumps):
        for chan in range(n_chans):
            # Slice data for this dump / channel
            d = data[n_chans*dump + chan, :]
            if args.flipsamples:
                print("Flipping sample interleaving")
                d = flip_interleave(d)
            #plt.subplot(n_chans, 2, chan*2 + 1)
            plt.subplot(plty, pltx, (chan % plt_tot) + 1)
            #plt.subplot(1, 2, 1)
            plt.plot(d[0:100], label=chan)
            #plt.xlabel("ADC sample")
            #plt.ylabel("ADC value")
            #plt.title("chan %d" % i)
            plt.legend()

    plt.figure()
    for dump in range(args.n_dumps):
        for chan in range(n_chans):
            # Slice data for this dump / channel
            d = data[n_chans*dump + chan, :]
            if args.flipsamples:
                print("Flipping sample interleaving")
                d = flip_interleave(d)
            #plt.subplot(n_chans, 2, chan*2 + 2)
            plt.subplot(plty, pltx, (chan % plt_tot) + 1)
            #plt.subplot(1, 2, 2)
            D = np.abs(np.fft.rfft(d))**2
            freq_axis = np.linspace(0, 0.5, D.shape[0])
            plt.semilogy(freq_axis, D, label=chan)
            #plt.xlabel("Frequency [fraction of sampling rate]")
            #plt.ylabel("Power [dB] (arb. reference)")
            plt.legend()
            #plt.title("CHIP %d" % i)

    #NCHIPS = 8
    #chans_per_chip = n_chans // NCHIPS
    #for dump in range(args.n_dumps):
    #    for chan in range(n_chans):
    #        # Slice data for this dump / channel
    #        d = data[n_chans*dump + chan, :]
    #        #plt.subplot(n_chans, 2, chan*2 + 1)
    #        plt.subplot(NCHIPS, 2, ((chan//chans_per_chip)*2 + 1))
    #        #plt.subplot(1, 2, 1)
    #        plt.plot(d[0:1024], label=chan)
    #        #plt.subplot(n_chans, 2, chan*2 + 2)
    #        plt.subplot(NCHIPS, 2, ((chan//chans_per_chip)*2 + 2))
    #        #plt.subplot(1, 2, 2)
    #        D = 10*np.log10(np.abs(np.fft.rfft(d))**2)
    #        freq_axis = np.linspace(0, 0.5, D.shape[0])
    #        plt.plot(freq_axis, D, label=chan)
    #for i in range(NCHIPS):
    #    plt.subplot(NCHIPS, 2, 2*i + 1)
    #    plt.xlabel("ADC sample")
    #    plt.ylabel("ADC value")
    #    plt.title("CHIP %d" % i)
    #    plt.legend()
    #    plt.subplot(NCHIPS, 2, 2*i + 2)
    #    plt.xlabel("Frequency [fraction of sampling rate]")
    #    plt.ylabel("Power [dB] (arb. reference)")
    #    plt.title("CHIP %d" % i)
    #    plt.legend()
    plt.show()
