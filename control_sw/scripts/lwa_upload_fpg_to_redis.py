#!/usr/env python

"""
Upload an FPGA bitstreams to redis
"""

import redis
import argparse
import time
import hashlib
import socket
import os

parser = argparse.ArgumentParser(description='Upload an FPGA bitstream to redis',
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('fpg',type=str,
                    help = '.fpg file to upload')
parser.add_argument('-r', dest='redishost', type=str, default='redishost',
                    help ='Host servicing redis requests')

args = parser.parse_args()

if not args.fpg.endswith('.fpg'):
    print("You may only upload FPG files with a '.fpg' extension")
    exit()

if not os.path.exists(args.fpg):
    print("FPG file %s not found!" % args.fpg)
    exit()

r = redis.Redis(args.redishost)

with open(args.fpg, 'r') as fh:
    d = {}
    d["upload_time"] = time.time()
    d["fpg"]         = fh.read()
    d["md5"]         = hashlib.md5(d["fpg"]).hexdigest()
    d["path"]        = os.path.abspath(args.fpg)
    d["hostname"]    = socket.gethostname()
    name = os.path.basename(args.fpg)
    r.hmset('fpg:%s' % name, d)
