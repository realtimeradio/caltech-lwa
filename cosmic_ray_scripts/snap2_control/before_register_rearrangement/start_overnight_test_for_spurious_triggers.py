#this script loads firmware to check for board-to-board trigger communication and leaves it running. The purpose is to read the trigger counter later with another script and check for spurious triggers

import casperfpga
import time

#connect to boards and, if desired, reload the firmware
brd9=casperfpga.CasperFpga('snap2-rev2-9')
brd11=casperfpga.CasperFpga('snap2-rev2-11')
brd12=casperfpga.CasperFpga('snap2-rev2-12')

print("Programming boards")
for brd in [brd9,brd11,brd12]:
	brd.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg")

for brd in [brd9,brd11,brd12]:
	#reset trigger counters
	#reset the trigger counters

	brd.write_int("trig_debug_reset",1)
	time.sleep(0.01)
	brd.write_int("trig_debug_reset",0)
	time.sleep(0.01)

	#reset boards to listen
	brd.write_int("reset_to_listen",0)
	time.sleep(0.01)
	brd.write_int("reset_to_listen",1)
	time.sleep(0.01)



