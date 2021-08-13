#this script reads the trigger counters and prints the output for three boards in the lab

import casperfpga
import time

#connect to boards and, if desired, reload the firmware
brd9=casperfpga.CasperFpga('snap2-rev2-9')
brd11=casperfpga.CasperFpga('snap2-rev2-11')
brd12=casperfpga.CasperFpga('snap2-rev2-12')

brd9count=brd9.read_int("trig_debug_trig_rec_count")
brd11count=brd11.read_int("trig_debug_trig_rec_count")
brd12count=brd12.read_int("trig_debug_trig_rec_count")

print("Number of Received triggers:")
print("Board 9: ", brd9count)
print("Board 11: ", brd11count)
print("Board 12: ", brd12count)

