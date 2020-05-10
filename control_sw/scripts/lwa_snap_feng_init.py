#! /usr/bin/env python

import argparse
from lwa_f import LwaF, helpers, __version__
import numpy as np
import struct
import collections
import casperfpga
import redis
import time
import yaml
import logging

def main():
    parser = argparse.ArgumentParser(description='Interact with a programmed SNAP board for testing and '\
                                     'networking. FLAGS OVERRIDE CONFIG FILE!',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--config_file', type=str, default=None,
                        help = 'YAML configuration file with hosts and channels list')
    parser.add_argument('-r', dest='redishost', type=str, default='redishost',
                        help ='Host servicing redis requests')
    parser.add_argument('-s', dest='sync', action='store_true', default=False,
                        help ='Use this flag to sync the F-engine(s) and Noise generators from PPS')
    parser.add_argument('-m', dest='mansync', action='store_true', default=False,
                        help ='Use this flag to manually sync the F-engines with an asynchronous software trigger')
    parser.add_argument('-i', dest='initialize', action='store_true', default=None,
                        help ='Use this flag to initialize all F-engine(s)')
    parser.add_argument('-t', dest='tvg', action='store_true', default=False,
                        help ='Use this flag to switch to EQ TVG outputs')
    parser.add_argument('-n', dest='noise', action='store_true', default=False,
                        help ='Use this flag to switch to Noise inputs')
    parser.add_argument('-e', dest='eth', action='store_true', default=False,
                        help ='Use this flag to switch on the Ethernet outputs')
    parser.add_argument('-p','--program', action='store_true', default=False,
                        help='Program FPGAs with the fpgfile specified in the config file if not programmed already')
    parser.add_argument('-P','--forceprogram', action='store_true', default=False,
                        help='Program FPGAs with the fpgfile specified in the config file irrespective of whether they are programmed already')
    parser.add_argument('--nomultithread', action='store_true', default=False,
                        help='Don\'t multithread initialization')
    args = parser.parse_args()

    logger = helpers.add_default_log_handlers(logging.getLogger(__file__))
    helpers.log_notify(logger) # send a NOTIFY level message that this script has started
    
    corr = LwaF(redishost=args.redishost, config=args.config_file)

    if len(corr.fengs) == 0:
        logger.error("No F-Engines are connected. Is the power off?")
        exit()
    
    if not corr.config_is_valid:
        logger.error('Currently loaded config is invalid')
        exit()
    
    # Write the parameters this script used to redis
    init_time = time.time()
    corr.r.hmset('init_configuration', {
        'lwa_f_version' : __version__,
        'init_args' : args,
        'init_time' : init_time,
        'init_time_str' : time.ctime(init_time),
        'config' : corr.config_str,
        'config_time' : corr.config_time,
        'config_time_str' : corr.config_time_str,
        'config_name' : corr.config_name,
        'md5'    : corr.config_hash,
        }
    )
    
    # Before we start manipulating boards, prevent monitoing scripts from
    # sending TFTP traffic. Expire the key after 5 minutes to lazily account for
    # issues with this script crashing.
    corr.disable_monitoring(expiry=600, wait=True)
    
    if args.program or args.forceprogram:
        corr.program(unprogrammed_only=(not args.forceprogram)) # This should multithread the programming process.
        if args.fast_initialize is None:
            logger.warning('Programming but *NOT* initializing. This is unlikely to be what you want')
    
    if args.fast_initialize is not None:
        corr.disable_output()
        corr.initialize(multithread=(not args.nomultithread), uninitialized_only=args.fast_initialize)
    
    if args.tvg:
        logger.info('Enabling EQ TVGs...')
        corr.do_for_all_f("write_freq_ramp", block="eq_tvg")
        corr.do_for_all_f("tvg_enable", block="eq_tvg")
    
    if args.noise:
        logger.info('Setting noise TVGs...')
        seed = 23
        for stream in range(fengine.noise.nstreams): 
            corr.do_for_all_f("set_seed", block="noise", args=[stream, seed])
        corr.do_for_all_f("use_noise", block="input")
    
    # Now assign frequency slots to different X-engines as 
    # per the config file. A total of 32 Xengs are assumed for 
    # assigning slots- 16 for the even bank, 16 for the odd.  
    # Channels not assigned to Xengs in the config file are 
    # ignored. Following are the assumed globals:
    if not corr.configure_freq_slots():
        logger.error('Configuring frequency slots failed!')
        exit()
    
    # Sync logic. Do global sync first, and then noise generators
    # wait for a PPS to pass then arm all the boards
    if args.sync:
        corr.disable_output()
        corr.do_for_all_f("change_period", block="sync", args=[0])
        corr.resync(manual=args.mansync)
        corr.sync_noise(manual=args.mansync)
    
    if args.eth:
        corr.enable_output()
    else:
        corr.disable_output()
    
    
    # Re-enable the monitoring process
    corr.enable_monitoring()
    
    print 'Initialization complete'

if __name__ == "__main__":
    main()
