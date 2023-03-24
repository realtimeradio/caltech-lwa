#! /usr/bin/env python

import logging
import argparse

SNAP_IDS = ','.join(['%d' % i for i in range(1,12)])

def multithread_call(fengines, method, args, kwargs):
    TIMEOUT = 500
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


def program_snaps(snapids, fpgfile, force):
    from lwa_f import snap2_fengine

    snapnames = ['snap%.2d' % i for i in snapids]
    print("Connecting to boards: %s" % (','.join(snapnames)))
    
    ffs = {}
    for snap in snapnames:
        ffs[snap] = snap2_fengine.Snap2Fengine(snap)

    snaps_to_program = []
    fengine_kwargs = {}
    for fhost, f in ffs.items():
      snaps_to_program += [f]
      fengine_kwargs[fhost] = {'force':force}

    for fhost, f in ffs.items():
        print("%s is programmed? %s" % (f.hostname, f.fpga.is_programmed()))
    
    print("Programming all with : %s" % fpgfile)

    multithread_call(snaps_to_program, 'program', [fpgfile], fengine_kwargs)

def main():
    parser = argparse.ArgumentParser(description='Program all LWA352 SNAP2 boards with a given .fpg file',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-f', dest='fpgfile', type=str, default=None,
                        help ='SNAP firmware .fpg file')
    parser.add_argument('-i', dest='snapids', type=str, default=SNAP_IDS,
                        help ='Comma-separated list of SNAP ID numbers to initialize')
    parser.add_argument('--force', action='store_true',
                        help ='Force programming no matter what the SNAP claims is currently in flash')
    args = parser.parse_args()

    if args.fpgfile is None:
        print("Supply an fpg file with -f flag")
        exit()

    program_snaps(map(int, args.snapids.split(',')), args.fpgfile, args.force)

if __name__ == "__main__":
    main()
