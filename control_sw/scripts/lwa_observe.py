#! /usr/bin/env python

import logging
import argparse

CONFIG_FILE = "/home/ubuntu/proj/lwa-shell/caltech-lwa/control_sw/config/lwa_corr_config.yaml"
SNAP_IDS = ','.join(['%d' % i for i in range(1,12)])
GPU_IDS = ','.join(['%d' % i for i in range(1,9)])

def multithread_call(fengines, method, args, kwargs):
    TIMEOUT = 300
    from queue import Queue
    from threading import Thread

    q = Queue()

    def queue_method(q, fengine, method, args, kwargs):
        """
        q: Queue instance
        fengine: Snap2Fengine instance
        method: string name of method to call
        args: arguments to method
        kwargs: kwargs to method
        """
        q.put([fengine.hostname, getattr(fengine, method)(*args, **kwargs)])

    threads = {}
    for fengine in fengines:
        hostname = fengine.hostname
        if isinstance(method, dict):
            fmethod = method[hostname]
        else:
            fmethod = method
        if isinstance(args, dict):
            fargs = args[hostname]
        else:
            fargs = args
        if isinstance(kwargs, dict):
            fkwargs = kwargs[hostname]
        else:
            fkwargs = kwargs
        threads[hostname] = Thread(target=queue_method, args=(q, fengine, fmethod, fargs, fkwargs))
        threads[hostname].daemon = True
        threads[hostname].start()

    for thost, thread in threads.items():
        thread.join(TIMEOUT)

    successes = set([q.get()[0] for i in range(q.qsize())])
    failed = [fengine.hostname for fengine in fengines if fengine.hostname not in successes]
    if len(failed) > 0:
        print("Failed to call method %s for SNAPs %s" % (method, ','.join(failed)))
        raise RuntimeError


def configure_snaps(snapids, config_file):
    from lwa_f import snap2_fengine

    snapnames = ['snap%.2d' % i for i in snapids]
    print("Connecting to boards: %s" % (','.join(snapnames)))
    
    ffs = {}
    for snap in snapnames:
        ffs[snap] = snap2_fengine.Snap2Fengine(snap)

    for fhost, f in ffs.items():
        print("%s is programmed? %s" % (f.hostname, f.fpga.is_programmed()))
    
    print("Using config file: %s" % config_file)

    # Always do snap01 first, because this is the timing source
    if 'snap01' in ffs:
        fhost = 'snap01'
        f = ffs[fhost]
        print("Configuring board %s" % fhost)
        do_program = True
        f.cold_start_from_config(config_file, program=do_program)


    init_fengines = []
    init_fengine_kwargs = {}
    for fhost, f in ffs.items():
        # Already done snap01
        if fhost == 'snap01':
            continue
        do_program = True
        init_fengines += [f]
        init_fengine_kwargs[fhost] = {'program': do_program}

    print("Configuring boards %s" % (','.join([f.hostname for f in init_fengines])))
    multithread_call(init_fengines, 'cold_start_from_config', [config_file], init_fengine_kwargs)

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
