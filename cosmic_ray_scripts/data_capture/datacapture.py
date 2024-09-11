#!/usr/bin/env python

import time
import socket
import numpy as np
import argparse

##################################Parse Arguments and get addresses ##########################

parser=argparse.ArgumentParser(description='Save data from cosmic ray packetizer to disk')
parser.add_argument('thiscomputer', type=str, help='Which computer is this script running on? Used to select IP address.')
parser.add_argument('prefixstr',type=str,help="Prefix for file name of all the output files.")
parser.add_argument('datadir', type=str, help= "Directory in which to make data files.")
parser.add_argument('packets_per_file',type=int,help="Maximum number of packets to put in one file before starting a new file.")
parser.add_argument('timeout',type=int,help='Socket timeout time in seconds. If this time elapses before the maximum number of packets in a file is reached, save the current file and start a new file.')
parser.add_argument('packetlimit',type=int,help='Maximum number of packets to receive before stopping the datacapture.')
parser.add_argument('delaystart',type=int,help='Time to wait before starting packet capture')

args=parser.parse_args()
computer = args.thiscomputer
prefixstr = args.prefixstr
datadir = args.datadir
if datadir[-1]!='/': #make sure the directory name string ends with a /
    datadir=datadir+'/'
packets_per_file=args.packets_per_file
timeout= args.timeout
packetlimit=args.packetlimit
wait=args.delaystart

#wait if required
time.sleep(wait)

print("Beginning data capture with data written to",datadir, " with ",packets_per_file, 'packets per file, a timeout time of ', timeout, ' seconds, and an upper limit of ',packetlimit, 'packets before stopping the program.')

if computer =='minor':
    RX_IP = "192.168.41.12"
elif computer == 'lwacr':
    #RX_IP = '10.41.0.106'
    RX_IP = '10.41.0.58'

elif computer =='gpu09':
    RX_IP = '10.41.0.25'
else:
    print('Argument not recognized. Options lwacr, gpu09, and minor right now.')   
    exit()


RX_PORT = 11111
#RX_PORT = 50000
RX_SIZE = 9000
EXPECTED_PACKETS_PER_BURST = 64


###################################Catch Packets###########################################
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.settimeout(timeout) # seconds

s.bind((RX_IP, RX_PORT))

old_pkt_count = 0
pkt_count = 0
pkt_count_current_file = 0
currentfile=open(datadir+prefixstr+str(time.time())+'.dat','ab') #open a file to put packet data in
try:
    while(True):
        try:
            d = s.recv(RX_SIZE)
            pkt_count += 1
            pkt_count_current_file+=1
            currentfile.write(d)
            if pkt_count_current_file==packets_per_file:
                #if the maximum packets in a file is reached, close the file and start a new one
                print("File packet limit reached, saving file. Received ",pkt_count, "packets total so far.")
                currentfile.close() 
                currentfile=open(datadir+prefixstr+str(time.time())+'.dat','ab')
                pkt_count_current_file=0
            if pkt_count==packetlimit:
                #If the maximum limit number of packets has been reached, close the file and exit the program
                print("Maximum packet limit reached, saving file and exiting program. Received ",pkt_count, "packets total so far.")
                currentfile.close()
                exit()
            
        except socket.timeout:
        #If the timeout time is reached and any packets have been written, close the file and open a new one
            if pkt_count_current_file!=0:
                print("Timeout reached, saving file. Received ",pkt_count, " packets total so far and ",pkt_count_current_file, "packets in this file.")
                currentfile.close()
                currentfile=open(datadir+prefixstr+str(time.time())+'.dat','ab')
                pkt_count_current_file=0
except KeyboardInterrupt:
    currentfile.close()
    print("Exiting. %d packets received" % pkt_count)
