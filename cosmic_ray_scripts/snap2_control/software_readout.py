import time
import casperfpga
from lwa_f import snap2_fengine
import argparse
import pandas as pd
from cr_functions import *

parser=argparse.ArgumentParser(description='Trigger a snapshot readout from software to a specified destination address, and report summary information.')
parser.add_argument('brd', type=str, help='SNAP2 to hostname.')
parser.add_argument('pktwait', type=int, help='Clock cycles to wait between packets. 0 means do not set this register (only choose 0 for old versions of firmware without the variable delay option)')

parser.add_argument('dest', type=str, help='Destination. "minor" or "lwacr"')
parser.add_argument('data', type=str, help='Data source e.g. "counter", "constant", "adc"')
parser.add_argument('nsnapshots', type=int, help='Number of triggers to send.')
parser.add_argument('triggerwait', type=float, help='Number of seconds between triggers.')
args=parser.parse_args()

fpgfile=args.fpgfil
packetwait=args.pktwait
brdname=args.brd
destinationcomputer=args.dest
datasource=args.data
program=(args.programbrd=='True')
nsnapshots=args.nsnapshots
triggerwait=args.triggerwait


brd = casperfpga.CasperFpga(brdname, transport=casperfpga.TapcpTransport) #TODO find a way to not have to define brd twice

if configethernet:
    #configure ethernet
    setup_ethernet(brdname,brd,fpgfile,destinationcomputer,packetwait)
    
    #configure data source
    setup_data_source(brd,datasource)
    
    #enable ethernet
    setvalue(brd,'eth_enable','cr_registers.xlsx',1)
    
    #send however many software triggers
for i in range(nsnapshots):
    software_trigger(brd,1)
    time.sleep(triggerwait)
