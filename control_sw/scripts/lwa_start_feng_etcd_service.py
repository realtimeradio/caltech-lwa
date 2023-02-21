#! /usr/bin/env python

import time
import argparse
import logging
import logging.handlers
from lwa_f import snap2_feng_etcd_client

def main():
    parser = argparse.ArgumentParser(description='Start an ETCD F-Engine control service',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-e', dest='etcdhost', type=str, default='etcdv3service.sas.pvt',
                        help ='Host serving etcd')
    parser.add_argument('-p', dest='port', type=int, default=2379,
                        help ='Port on which etcd is served')
    parser.add_argument('-t', dest='polltime', type=int, default=60,
                        help ='Time, in seconds, between FPGA status polls. '
                              'If None, don\'t start poll loop')
    parser.add_argument('--snaphost', dest='snaphost', type=str, default='snap01',
                        help ='Hostname of SNAP2 board being controlled')
    args = parser.parse_args()

    logger = logging.getLogger("%s:%s" % (__file__, args.snaphost))
    logger.setLevel(logging.INFO)
    
    formatter = logging.Formatter('%(asctime)s - %(name)20s - %(levelname)s - %(message)s')
    handler = logging.handlers.SysLogHandler(address='/dev/log')
    handler.setFormatter(formatter)
    
    logger.addHandler(handler)
    
    if not args.snaphost.startswith('snap'):
        logger.error("Don't know how to determine SNAP ID unless hostname is 'snap<integer>'")
        exit()
    
    try:
        fid = int(args.snaphost[4:])
        logger.info("SNAP %s has ID %d" % (args.snaphost, fid))
    except:
        logger.error("Couldn't get SNAP ID from hostname ending %s" % args.snaphost[4:])
    
    logger.info("Starting ETCD client service")
    try:
        ec = snap2_feng_etcd_client.Snap2FengineEtcdService(
                args.snaphost,
                fid,
                etcdhost=args.etcdhost,
                etcdport=args.port,
                logger=logger,
            )
    except RuntimeError:
        logger.exception("Failed to instantiate etcd control service for host %s" % args.snaphost)
        raise
    
    logger.info("Starting command watch")
    ec.start_command_watch()
    if args.polltime is not None:
        logger.info("Starting status poll loop with poll interval %f seconds" % args.polltime)
        ec.start_poll_stats_loop(args.polltime)

    logger.info("Going into infinite loop")
    while(True):
        try:
            time.sleep(60)
        except KeyboardInterrupt:
            break

if __name__ == "__main__":
    main()
