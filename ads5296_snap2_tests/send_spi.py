#! /usr/bin/env python

import time
import argparse
import casperfpga

try:
    from casperfpga import ads5296
except:
    print("Couldn't import ADS5296 control library from casperfpga")
    print("Are you using the correct python environment?")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate SPI traffic from SNAP2 -> ADC",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--fmcA", action="store_true",
                        help="Use FMC A; aka FMC 0; aka 'right hand'")
    parser.add_argument("--fmcB", action="store_true",
                        help="Use FMC B; aka FMC 1; aka 'left hand'")
    parser.add_argument("--csstart", type=int, default=0,
                        help="Loop through chip selects starting here")
    parser.add_argument("--csstop", type=int, default=7,
                        help="Loop through chip selects stopping here")
    parser.add_argument("--host", type=str, default="snap2-rev2-10",
                        help="Snap hostname / IP address")
    parser.add_argument("--addr", type=int, default=0x2a,
                        help="Address to read/write")
    parser.add_argument("--data", type=int, default=0xaaaa,
                        help="Value to write")
    parser.add_argument("--reset", action="store_true",
                        help="Strobe ADC reset line")
    parser.add_argument("--sync", action="store_true",
                        help="Strobe ADC sync line")
    parser.add_argument("--diagram", action="store_true",
                        help="Print ASCII waveforms")
    parser.add_argument("--loop", action="store_true",
                        help="Loop through ADCs forever")
    args = parser.parse_args()


    print("Connecting to %s" % args.host)
    s = casperfpga.CasperFpga(args.host, transport=casperfpga.TapcpTransport)

    fmcs = []
    if args.fmcA:
        print("Using FMC 0 (A; right hand side)")
        fmcs += [ads5296.ADS5296fw(s, 0)]
    if args.fmcB:
        print("Using FMC 1 (B; left hand side)")
        fmcs += [ads5296.ADS5296fw(s, 1)]

    if len(fmcs) == 0:
        print("Use --fmcA or --fmcB to select one or both FMC ports")
        exit()

    while(True):
        for fn, f in enumerate(fmcs):
            if args.reset:
                print("Reseting ADCs on FMC %d" % fn)
                for cs in range(args.csstart, args.csstop + 1):
                    f.reset(cs)
            if args.sync:
                print("Syncing ADCs on FMC %d" % fn)
                f.assert_sync()
                f.deassert_sync()
            for cs in range(args.csstart, args.csstop + 1):
                print("Writing 0x%x to address 0x%x with chip-select %d on FMC %d" % (args.data, args.addr, cs, fn))
                f.write_spi(args.addr, args.data, cs)
                f.enable_readout(cs)
                readback = f.write_spi(args.addr, 0, cs)
                f.disable_readout(cs)
                print("Read back 0x%x" % readback)
        if not args.loop:
            break
    
