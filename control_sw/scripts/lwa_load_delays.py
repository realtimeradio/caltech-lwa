#! /usr/bin/env python

import os
import logging
import argparse
import numpy as np
from lwa_antpos import mapping
from lwa_f import snap2_feng_etcd_client


NSTAND = 366 # Not number of antennas -- just a list as large as LWA stand IDs
DELAY_OFFSET = 10 # minimum delay

def main():
    parser = argparse.ArgumentParser(description='Configure the LWA352 observing system from scratch',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument(dest='delayfile', type=str,
                        help ='Path to cable delay csv file')
    parser.add_argument('--adcclk', type=int, default=196000000,
                        help ='ADC clock rate in Hz')
    parser.add_argument('--etcdhost', type=str, default='etcdv3service.sas.pvt',
                        help ='Hostname of server providing ETCD store')
    args = parser.parse_args()

    assert os.path.exists(args.delayfile)

    delays_ns = np.zeros([NSTAND, 2]) # stand x pol
    with open(args.delayfile, 'r') as fh:
        for line in fh.readlines():
            if line.startswith('#'):
                continue
            else:
                v = line.split()
                delays_ns[int(v[0])] = [float(v[1]), float(v[1])]

    max_delay_ns = delays_ns.max()
    delays_clocks = np.round(delays_ns*1e-9 * args.adcclk).astype(int)
    max_delay_clocks = delays_clocks.max()

    relative_delays_clocks = max_delay_clocks - delays_clocks
    max_relative_delay_clocks = delays_clocks.max()

    delays_to_apply_clocks = relative_delays_clocks + DELAY_OFFSET

    print('Maximum delay: %f ns' % max_delay_ns)
    print('Maximum delay: %d ADC clocks' % max_delay_clocks)
    print('Maximum relative delay: %d ADC clocks' % max_relative_delay_clocks)
    print('Maximum delay to be applied: %d ADC clocks' % delays_to_apply_clocks.max())
    print('Minimum delay to be applied: %d ADC clocks' % delays_to_apply_clocks.min())

    print('Connecting to ETCD host %s' % args.etcdhost)
    ec = snap2_feng_etcd_client.Snap2FengineEtcdControl(args.etcdhost)

    for ant_id in range(NSTAND):
        snap_id_a, input_id_a = mapping.antpol_to_fpga('LWA-%.3d'%(ant_id), 'A')
        snap_id_b, input_id_b = mapping.antpol_to_fpga('LWA-%.3d'%(ant_id), 'B')
        print("Setting stand %d delay (snap%d:%d, snap%d:%d) to %s" % (ant_id+1, snap_id_a, input_id_a, snap_id_b, input_id_b, delays_to_apply_clocks[ant_id]))
        if snap_id_a != -1 and input_id_a != -1:
            ec.send_command(snap_id_a, 'delay', 'set_delay', kwargs={'stream':input_id_a, 'delay':int(delays_to_apply_clocks[ant_id, 0])})
        else:
            print('Skipping pol A because it has no valid snap/input pair')
        if snap_id_b != -1 and input_id_b != -1:
            ec.send_command(snap_id_b, 'delay', 'set_delay', kwargs={'stream':input_id_b, 'delay':int(delays_to_apply_clocks[ant_id, 1])})
        else:
            print('Skipping pol B because it has no valid snap/input pair')


if __name__ == "__main__":
    main()
