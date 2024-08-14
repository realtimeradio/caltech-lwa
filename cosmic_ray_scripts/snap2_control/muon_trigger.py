import argparse
import numpy as np
import casperfpga
import time
from lwa_f import snap2_fengine
from lwa_f import blocks
from cr_functions import *

#parse arguments
parser=argparse.ArgumentParser(description='Run cosmic ray trigger on muon detector only')
parser.add_argument('threshold',type=int,help="Power threshold for muon detector.")
parser.add_argument('duration', type=str, help= "Number of seconds to run detector.")

args=parser.parse_args()

trigger_power_thresh=args.threshold
duration = args.duration

#connect to snap boards
brdnames=['snap01','snap02','snap03','snap04','snap05','snap06','snap07','snap08','snap09','snap10','snap11']
snapbrds = [snap2_fengine.Snap2FengineEtcd(brdname).fpga for brdname in brdnames]  

#turn off the trigger for all the snap boards
[setvalue(snapbrd,"enable_coinc_trig","cr_registers.xlsx",0) for snapbrd in snapbrds]

# which snap board and input correspond to the muon detector
snapbrd=snapbrds[3]  
ant_index=31

#set up coincidencer
veto_power_thresh=0
trigger_window=10 #a small positive number
veto_window=0 #not using
antenna_number_thresh=0  #trigger on only one antenna
veto_number_thresh=64 #turn off
veto_roles_array=np.zeros(64)
core_roles_array=np.zeros(64)
core_roles_array[ant_index]=1  #set only the muon detector to participate
bufferwait=2000

#configure trigger
tries=15
for attempt in range(tries):
    try:
        setup_coincidencer(snapbrd,trigger_power_thresh,
                veto_power_thresh,
                trigger_window,
                veto_window,
                antenna_number_thresh,
                veto_number_thresh,
                core_roles_array,
                veto_roles_array)
        setvalue(snapbrd,"delay_trigger","cr_registers.xlsx",bufferwait)
    except:
        if attempt<tries-1:
            continue
        else:
            raise
    break

#run the trigger for the desired length of time and then turn it off
setvalue(snapbrd,"enable_coinc_trig","cr_registers.xlsx",1)
time.sleep(duration)
setvalue(snapbrd,"enable_coinc_trig","cr_registers.xlsx",0)
