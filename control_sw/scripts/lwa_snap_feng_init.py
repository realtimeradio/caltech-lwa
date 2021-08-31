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

    f.cold_start_from_config(
            args.outputconfig,
            program = args.program,
            initialize = args.initialize,
            test_vectors = args.tvg,
            sync = args.sync,
            sw_sync = args.mansync,
            enable_eth = args.eth,
        )

if __name__ == "__main__":
    main()
