#this script repeatedly sends a trigger to one board and, which will be passed to another board.  Then, I count the number of triggers each board received and confirm that they match the number of triggers sent.

import casperfpga
import time
sendboard='snap2-rev2-9'
receiveboard='snap2-rev2-11'
program=True
number_of_tests=1000

#connect to boards and, if desired, reload the firmware
print("Connecting to board A")
sendbrd=casperfpga.CasperFpga(sendboard)
print("Connecting to board B")
recbrd=casperfpga.CasperFpga(receiveboard)
if program==True:
	print("Programming boards")
	sendbrd.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg")
	recbrd.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg")
#reset trigger counters
#reset the trigger counters
sendbrd.write_int("trig_debug_reset",1)
time.sleep(0.01)
recbrd.write_int("trig_debug_reset",1)
time.sleep(0.01)
sendbrd.write_int("trig_debug_reset",0)
time.sleep(0.01)
recbrd.write_int("trig_debug_reset",0)

#send trigger many times
print("Sending triggers to board A")
for i in range(number_of_tests):
	#reset both boards to listen
	sendbrd.write_int("reset_to_listen",0)
	time.sleep(0.01)
	recbrd.write_int("reset_to_listen",0)
	time.sleep(0.01)

	sendbrd.write_int("reset_to_listen",1)
	time.sleep(0.01)
	recbrd.write_int("reset_to_listen",1)
	time.sleep(0.01)

	#send trigger to the send board
	sendbrd.write_int("send_trigger",0)
	time.sleep(0.01)
	sendbrd.write_int("send_trigger",1)
	time.sleep(0.01)
#check results
sendbrdcount = sendbrd.read_int("trig_debug_trig_rec_count")
recbrdcount = recbrd.read_int("trig_debug_trig_rec_count")

print("Number of triggers sent from software to board A:  ", number_of_tests)
print("Number of triggers received by board A:  ", sendbrdcount)

print("Number of triggers received by board B:  ", recbrdcount)

#finall, make sure both boards are reset to listen and have trigger counters reset
sendbrd.write_int("reset_to_listen",0)
time.sleep(0.01)
recbrd.write_int("reset_to_listen",0)
time.sleep(0.01)
sendbrd.write_int("reset_to_listen",1)
time.sleep(0.01)
recbrd.write_int("reset_to_listen",1)
time.sleep(0.01)	
sendbrd.write_int("trig_debug_reset",1)
time.sleep(0.01)
recbrd.write_int("trig_debug_reset",1)
time.sleep(0.01)
sendbrd.write_int("trig_debug_reset",0)
time.sleep(0.01)
recbrd.write_int("trig_debug_reset",0)
