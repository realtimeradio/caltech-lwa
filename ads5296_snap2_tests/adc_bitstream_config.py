#!/usr/bin/env python

import numpy as np
import struct
import time
import argparse
import sys
import os

import casperfpga
import logging

import progressbar

logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)
stdout_handler = logging.StreamHandler(sys.stdout)
stdout_handler.setLevel(logging.INFO)
logger.addHandler(stdout_handler)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Configure an ADS5296 board and grab data",
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--upload", action="store_true",
                        help="Upload new bitstreams to flash, starting at address 0")
    parser.add_argument("--bootaddr", type=str, default=None,
                        help="Address from which booting should begin. "
                             "Enter as a hex string with no preceding '0x' "
                             "If none is given, the FPGA will not be rebooted")
    parser.add_argument("--uploadaddr", type=str, default="0x0",
                        help="Address from which uploading or programming should begin. "
                             "Enter as a hex string with with optional preceding '0x'")
    parser.add_argument("--host", type=str, default="snap2-rev2-10",
                        help="Snap hostname / IP address")
    parser.add_argument("--binaries", nargs='*',
                        help=".fpg files to load to flash")
    args = parser.parse_args()

    logger.info("Connecting to %s" % args.host)
    fpga = casperfpga.CasperFpga(args.host, transport=casperfpga.TapcpTransport)
    if not fpga.is_connected():
        logger.error("Board not connected!")
        exit()

    if args.upload:
        if len(args.binaries) == 0:
            logger.error("If using --upload, you must specify binaries to write to flash with --binaries")
            exit()
        addr = int(args.uploadaddr, 16)
        for fname in args.binaries:
            logger.info("Uploading %s to address 0x%x" % (fname, addr))
            if not fname.endswith(".fpg"):
                logger.error("Only loading .fpg files is supported")
            logger.info("Extracting bitstream")
            header, payload, md5 = fpga.transport._extract_bitstream(fname)
            logger.info("Uploading to flash") 
            addr = fpga.transport.write_to_flash(payload, addr)
            logger.info("Next available start address is 0x%x" % addr)
        exit()


    if args.bootaddr is not None:
        addr = int(args.bootaddr, 16)
        logger.info("Programming from address 0x%x. You will temporarily lose connectivity" % addr)
        fpga.transport.progdev(addr) 
