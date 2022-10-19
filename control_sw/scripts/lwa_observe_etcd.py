#! /usr/bin/env python

import logging
import argparse

CONFIG_FILE = "/home/ubuntu/proj/lwa-shell/caltech-lwa/control_sw/config/lwa_corr_config.yaml"
SNAP_IDS = ','.join(['%d' % i for i in range(1,12)])
GPU_IDS = ','.join(['%d' % i for i in range(1,9)])

def configure_snaps(snapids, config_file):
    from lwa_f import snap2_feng_etcd_client

    ec = snap2_feng_etcd_client.Snap2FengineEtcdControl()

    ec.send_command(0, 'feng', 'program', timeout=60*7, n_response_expected=11)
    ec.send_command(0, 'feng', 'initialize', kwargs={'read_only':False}, timeout=60*5, n_response_expected=11)

    for i in sorted(snapids):
        print("Initializing board %d" % i)
        ec.send_command(i, 'feng', 'cold_start_from_config', kwargs={'config_file':CONFIG_FILE, 'program':False, 'initialize':True}, timeout=20)

def configure_gpu_servers(serverids):
    from lwa352_pipeline_control import Lwa352CorrelatorControl
    gpu_servers = ['lxdlwagpu%.2d' % i for i in serverids]
    print("Connecting to GPU servers: %s" % (','.join(gpu_servers)))
    corr = Lwa352CorrelatorControl(gpu_servers, npipeline_per_host=4)
    print("Stopping any existing pipelines")
    corr.stop_pipelines()
    print("Starting new pipelines")
    corr.start_pipelines()
    corr.pipelines_are_up(verbose=True)

def main():
    parser = argparse.ArgumentParser(description='Configure the LWA352 observing system from scratch',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-s', dest='initsnaps', action='store_true',
                        help ='Use this flag to initialize SNAP boards')
    parser.add_argument('-g', dest='initgpus', action='store_true',
                        help ='Use this flag to initialize GPU servers')
    parser.add_argument('-c', dest='configfile', type=str, default=CONFIG_FILE,
                        help ='SNAP configuration YAML file')
    parser.add_argument('-i', dest='snapids', type=str, default=SNAP_IDS,
                        help ='Comma-separated list of SNAP ID numbers to initialize')
    parser.add_argument('-j', dest='gpuids', type=str, default=GPU_IDS,
                        help ='Comma-separated list of GPU server ID numbers to initialize')
    args = parser.parse_args()

    if args.initsnaps:
        configure_snaps(map(int, args.snapids.split(',')), args.configfile)

    if args.initgpus:
        configure_gpu_servers(map(int, args.gpuids.split(',')))

if __name__ == "__main__":
    main()
