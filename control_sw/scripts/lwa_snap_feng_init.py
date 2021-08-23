#! /usr/bin/env python

import os
import argparse
import yaml
import logging
from lwa_f import snap2_fengine


def main():
    parser = argparse.ArgumentParser(description='Interact with a programmed SNAP board for testing and '\
                                     'networking. FLAGS OVERRIDE CONFIG FILE!',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-s', dest='sync', action='store_true',
                        help ='Use this flag to sync the F-engine and Noise generators from PPS')
    parser.add_argument('-m', dest='mansync', action='store_true',
                        help ='Use this flag to manually sync the F-engine with an asynchronous software trigger')
    parser.add_argument('-i', dest='initialize', action='store_true',
                        help ='Use this flag to initialize an F-engine')
    parser.add_argument('-o', dest='outputconfig', type=str, default=None,
                        help ='YAML output configuration used to set up data outputs')
    parser.add_argument('-t', dest='tvg', action='store_true',
                        help ='Use this flag to switch to EQ TVG outputs')
    parser.add_argument('-n', dest='noise', action='store_true',
                        help ='Use this flag to switch to Noise inputs')
    parser.add_argument('-e', dest='eth', action='store_true',
                        help ='Use this flag to switch on the Ethernet outputs')
    parser.add_argument('-p','--program', action='store_true',
                        help='Program FPGAs with the pre-loaded fpg file')
    parser.add_argument('host', type=str,
                        help='SNAP2 hostname (or IP address) to initialize')
    args = parser.parse_args()

    f = snap2_fengine.Snap2Fengine(args.host)

    if args.outputconfig is not None:
        f.logger.info("Trying to configure output with config file %s" % args.outputconfig)
        if not os.path.exists(args.outputconfig):
            f.logger.error("Output configuration file %s doesn't exist. Skipping configuration" % args.outputconfig)
        else:
            try:
                with open(args.outputconfig, 'r') as fh:
                    conf = yaml.load(fh, Loader=yaml.CSafeLoader)
                if 'fengines' not in conf:
                    f.logger.error("No 'fengines' key in output configuration!")
                if 'xengines' not in conf:
                    f.logger.error("No 'xengines' key in output configuration!")
                chans_per_packet = conf['fengines']['chans_per_packet']
                localconf = conf['fengines'].get(args.host, None)
                if localconf is None:
                    f.logger.error("No configuration for F-engine host %s" % args.host)
                first_stand_index = localconf['ants'][0]
                nstand = localconf['ants'][1] - first_stand_index
                macs = conf['xengines']['arp']
                source_ip = localconf['gbe']
                source_port = localconf['source_port']

                dests = []
                for xeng, chans in conf['xengines']['chans'].items():
                    dest_ip = xeng.split('-')[0]
                    dest_port = int(xeng.split('-')[1])
                    start_chan = chans[0]
                    nchan = chans[1] - start_chan
                    dests += [{'ip':dest_ip, 'port':dest_port, 'start_chan':start_chan, 'nchan':nchan}]
            except:
                f.logger.exception("Failed to parse output configuration file %s" % args.outputconfig)
                raise

    f.cold_start(
            program = args.program,
            initialize = args.initialize,
            test_vectors = args.tvg,
            sync = args.sync,
            sw_sync = args.mansync,
            enable_eth = args.eth,
            chans_per_packet = chans_per_packet,
            first_stand_index = first_stand_index,
            nstand = nstand,
            macs = macs,
            source_ip = source_ip,
            source_port = source_port,
            dests = dests,
            )


if __name__ == "__main__":
    main()
