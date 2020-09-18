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
    adc = ads5296.ADS5296(s)

    fmcs = []
    if args.fmcA:
        print("Using FMC 0 (A; right hand side)")
        fmcs += [0]
    if args.fmcB:
        print("Using FMC 1 (B; left hand side)")
        fmcs += [1]

    if args.reset:
        for f in fmcs:
            print("Reseting ADCs on FMC %d" % f)
            adc.assert_reset(f)
            adc.deassert_reset(f)

    if args.sync:
        for f in fmcs:
            print("Syncing ADCs on FMC %d" % f)
            adc.assert_sync(f)
            adc.deassert_sync(f)

    while(True):
        for f in fmcs:
            for cs in range(args.csstart, args.csstop + 1):
                print("Writing 0x%x to address 0x%x with chip-select %d on FMC %d" % (args.data, args.addr, cs, f))
                adc.send_spi(args.addr, args.data, cs, f, show_diagram=args.diagram)
                adc.enable_readout(cs, f)
                readback = adc.send_spi(args.addr, 0, cs, f)
                adc.disable_readout(cs, f)
                print("Read back 0x%x" % readback)
        if not args.loop:
            break
    
