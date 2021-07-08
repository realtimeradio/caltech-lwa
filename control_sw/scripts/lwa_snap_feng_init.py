#! /usr/bin/env python

import os
import argparse
import yaml
import logging
from lwa_f import snap2_fengine

N_ANTS_PER_BOARD = 32

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

    if args.program:
        f.program()
        if not args.initialize:
            f.logger.warning('Programming but *NOT* initializing. This is unlikely to be what you want')
    
    if args.initialize:
        f.initialize(read_only=False)
        f.logger.warning('Updating telescope time')
        f.sync.update_telescope_time()
    
    if args.tvg:
        f.logger.info('Enabling EQ TVGs...')
        f.eqtvg.write_freq_ramp()
        f.eqtvg.tvg_enable()
    else:
        f.logger.info('Disabling EQ TVGs...')
        f.eqtvg.tvg_disable()
    
    if args.noise:
        f.logger.info("Pointing all inputs to noise generator 0")
        #seed = 23
        #for i in range(f.noise.n_noise):
        #    f.noise.set_seed(seed)
        for stream in range(fengine.noise.noutputs): 
            f.assign_output(stream, 0) # point all data paths to noise generator 0
        f.input.use_noise()
    else:
        f.logger.info("Pointing all inputs to ADC data streams")
        f.input.use_adc()
    
    # Now assign frequency slots to different X-engines as 
    # per the config file. A total of 32 Xengs are assumed for 
    # assigning slots- 16 for the even bank, 16 for the odd.  
    # Channels not assigned to Xengs in the config file are 
    # ignored. Following are the assumed globals:
    if args.outputconfig is not None:
        f.logger.info("Trying to configure output with config file %s" % args.outputconfig)
        # Always disable TX before messing with config
        f.eth.disable_tx()
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
                # first configure core local parameters
                localconf = conf['fengines'].get(args.host, None)
                if localconf is None:
                    f.logger.error("No configuration for F-engine host %s" % args.host)
                ip = localconf['gbe']
                source_port = localconf['source_port']
                mac = 0x020203030400 + int(ip.split('.')[-1])
                f.eth.configure_source(mac, ip, source_port)
                # then configure arp table
                for ip, mac in conf['xengines']['arp'].items():
                    f.eth.add_arp_entry(ip, mac)
                # Finally, configure packetizer
                chans_per_packet = conf['fengines']['chans_per_packet']
                dest_port = localconf['dest_port']
                localants = range(localconf['ants'][0], localconf['ants'][1])
                chans_to_send = []
                ips = []
                ports = []
                antpol_ids = []
                this_x_packets = None
                for xeng, chans in conf['xengines']['chans'].items():
                    for ant in localants[::(f.n_pols_per_board // 2)]:
                        this_x_chans = list(range(chans[0], chans[1]))
                        if this_x_packets is None:
                            this_x_packets = len(this_x_chans) // chans_per_packet
                        else:
                            if this_x_packets != len(this_x_chans) // chans_per_packet:
                                self.logger.error("Can't have different total numbers of channels per X-engine")
                                ok = False
                        antpol_ids += [2*ant] * this_x_packets
                        ips += [xeng] * this_x_packets
                        ports += [dest_port] * this_x_packets
                        chans_to_send += list(range(chans[0], chans[1]))
                ok = True
            except:
                f.logger.exception("Failed to parse output configuration file %s" % args.outputconfig)
                ok = False
            if ok:
                f.configure_output(antpol_ids, chans_per_packet, chans_per_packet*this_x_packets, chans_to_send, ips, ports)
            else:
                f.logger.error("Not configuring Ethernet output because configuration builder failed")
    else:
        f.logger.info("Skipping Ethernet output config because no configuration file supplied")
    
    # Sync logic. Do global sync first, and then noise generators
    # wait for a PPS to pass then arm all the boards
    if args.sync:
        f.logger.info("Arming sync generators")
        f.eth.disable_tx()
        f.sync.arm_sync()
        f.sync.arm_noise()
        if args.mansync:
            f.logger.info("Issuing software sync")
            f.sync.sw_sync()
    
    if args.eth:
        f.logger.info("Enabling Ethernet output")
        f.eth.enable_tx()
    else:
        f.logger.info("Disabling Ethernet output")
        f.eth.disable_tx()

    f.logger.info("Initialization of %s complete" % args.host)

if __name__ == "__main__":
    main()
