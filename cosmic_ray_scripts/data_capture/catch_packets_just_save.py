#!/usr/bin/env python

import time
import socket
import numpy as np
def process_packet(data, pkt_count):
    f=open("packet"+str(pkt_count), 'wb')
    f.write(data)
    f.close
    return


RX_IP = "192.168.41.12"
RX_PORT = 11111
RX_SIZE = 9000
EXPECTED_PACKETS_PER_BURST = 64

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.settimeout(1) # seconds(?)

s.bind((RX_IP, RX_PORT))

old_pkt_count = 0
pkt_count = 0
n_bursts = 0 # A burst is a run of packets separated by < 1 second
try:
    while(True):
        try:
            d = s.recv(RX_SIZE)
            process_packet(d,pkt_count)
            pkt_count += 1
        except socket.timeout:
            # If the receive times out and the number of packets
            # has changed then assume this is the end of the burst
            # and report the packet number
            if old_pkt_count != pkt_count:
                n_bursts += 1
                missing = (n_bursts * EXPECTED_PACKETS_PER_BURST) - pkt_count
                print("Received %d packets (%d bursts of 64 with %d missing)" % (pkt_count, n_bursts, missing))
            old_pkt_count = pkt_count
            
except KeyboardInterrupt:
    print("Exiting. %d packets received" % pkt_count)
