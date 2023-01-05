#!/usr/bin/env python
import pandas as pd
import time
import numpy as np
import struct
from lwa_f import snap2_fengine
from lwa_f import blocks
import matplotlib.pyplot as plt
from lwa_antpos import mapping

def single_board_snapshot_summary_plots(fname,boardnumber):
    #plot spectra
    fbins=np.linspace(0,197/2,int(1+4096/2))
    chanmap=np.loadtxt('channelmap.txt')
    snapshot=np.load(fname)


    fig1 = plt.figure(figsize=(20,15))
    for i in range(64):
        ax=fig1.add_subplot(8,8,1+i)
        fpgachan=chanmap[1,i]
        antname=mapping.snap2_to_antpol(boardnumber,fpgachan)
        ax.text(.5,.1,antname,horizontalalignment='center',transform=ax.transAxes)

        spec=np.fft.rfft(snapshot[:,i+4])
        plt.plot(fbins,np.log(np.square(np.abs(spec))))
        plt.ylim(0,25)
        if i > 55:
            plt.xlabel('frequency [MHz]')
        if i%8==0:
            plt.ylabel('power')

    fbins=np.linspace(0,197/2,int(1+4096/2))
    #isnormal=np.zeros(64)  

    #plot histogram
    fig2 = plt.figure(figsize=(20,15))
    for i in range(64):
        ax=fig2.add_subplot(8,8,1+i)
        #ax.text(.5,.5,int(chanmap[1,i]),horizontalalignment='center',transform=ax.transAxes)
        fpgachan=chanmap[1,i]
        antname=mapping.snap2_to_antpol(boardnumber,fpgachan)
        ax.text(.5,.5,antname,horizontalalignment='center',transform=ax.transAxes)


        plt.hist(snapshot[:,i+4])
        #isnormal[i] = st.normaltest(snapshot[:,i+4])[1]
        if i > 55:
            plt.xlabel('voltage [ADC units]')
        if i%8==0:
            plt.ylabel('Counts')
        #plt.xlim(-200,200)

    #plot timeseries
    fig3 = plt.figure(figsize=(20,15))
    for i in range(64):
        ax=fig3.add_subplot(8,8,1+i)
        #plt.title(i)
        plt.plot(snapshot[:,i+4])
        fpgachan=chanmap[1,i]
        antname=mapping.snap2_to_antpol(boardnumber,fpgachan)
        ax.text(.5,.5,antname,horizontalalignment='center',transform=ax.transAxes)
        if i > 55:
            plt.xlabel('time sample')
        if i%8==0:
            plt.ylabel('voltage [ADC units]')
    return
