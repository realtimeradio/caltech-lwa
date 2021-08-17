import time
import casperfpga
import numpy as np

#Reset the trigger counter
def reset_trigger_counter_all():
	brd9.write_int("trig_debug_reset",1)
	brd11.write_int("trig_debug_reset",1)
	brd12.write_int("trig_debug_reset",1)
	time.sleep(0.01)
	brd9.write_int("trig_debug_reset",0)
	brd11.write_int("trig_debug_reset",0)
	brd12.write_int("trig_debug_reset",0)
	return

#reset the trigger timer
def reset_trigger_timer_all():
	brd9.write_int("trig_debug_timer_reset",1)
	brd11.write_int("trig_debug_timer_reset",1)
	brd12.write_int("trig_debug_timer_reset",1)
	time.sleep(0.01)
	brd9.write_int("trig_debug_timer_reset",0)
	brd11.write_int("trig_debug_timer_reset",0)
	brd12.write_int("trig_debug_timer_reset",0)
	return

#set all boards to listen
def reset_to_listen_all():
        brd9.write_int("reset_to_listen",0)
        brd11.write_int("reset_to_listen",0)
        brd12.write_int("reset_to_listen",0)
        time.sleep(0.01)
        brd9.write_int("reset_to_listen",1)
        brd11.write_int("reset_to_listen",1)
        brd12.write_int("reset_to_listen",1)
        return	
#read the readout state value on all the boards
def read_state_value_all():
	state9=brd9.read_int("readout_state_value")
	state11=brd11.read_int("readout_state_value")
	state12=brd12.read_int("readout_state_value")
	return(state9,state11,state12)

#send a trigger to one board
def trigger(board):
	#board is a casperfpga object
	board.write_int("send_trigger",0)
	time.sleep(0.01)
	board.write_int("send_trigger",1)
	return

#read the trigger counter on all the boards
def read_trigger_counter_all():
	count9=brd9.read_int("trig_debug_trig_rec_count")	
	count11=brd11.read_int("trig_debug_trig_rec_count")	
	count12=brd12.read_int("trig_debug_trig_rec_count")	
	return count9,count11,count12



def time_trigger_communication(board):
	#board is the board to send the trigger to
	reset_trigger_counter_all()
	reset_trigger_timer_all()
	reset_to_listen_all()
	initialstate9,initialstate11,initialstate12=read_state_value_all()
	trigger(board)
	time.sleep(0.5)
	timer_value=board.read_int("trig_debug_timer")
	count9,count11,count12=read_trigger_counter_all()
	finalstate9,finalstate11,finalstate12=read_state_value_all()
	return np.asarray([initialstate9,initialstate11,initialstate12,timer_value,count9,count11,count12,finalstate9,finalstate11,finalstate12])	



#connect to boards
print("Connecting to boards")
brd9=casperfpga.CasperFpga("snap2-rev2-9")
print("Connected to board 9")
brd11=casperfpga.CasperFpga("snap2-rev2-11")
print("Connected to board 11")
brd12=casperfpga.CasperFpga("snap2-rev2-12")
print("Connected to board 12")
# program boards - uncomment the following lines if needed. Comment out to save time if alread programmed. 
print("Programming boards")
#brd9.upload_to_ram_and_program("gpio_pins3_2021-01-14_1608.fpg") #sends trigger as a 1-clock-cycle pulse
#brd11.upload_to_ram_and_program("gpio_pins3_2021-01-14_1608.fpg")
#brd12.upload_to_ram_and_program("gpio_pins3_2021-01-14_1608.fpg")

#brd9.upload_to_ram_and_program("gpio_pins3_2021-02-04_1223.fpg") #sends trigger as a 16-clock-cycle pulse
#brd11.upload_to_ram_and_program("gpio_pins3_2021-02-04_1223.fpg") #sends trigger as a 16-clock-cycle pulse
#brd12.upload_to_ram_and_program("gpio_pins3_2021-02-04_1223.fpg") #sends trigger as a 16-clock-cycle pulse

#brd9.upload_to_ram_and_program("gpio_pins3_2021-02-04_1838.fpg") #16-clock-cycle pulse, and timer only uses 1st and 2nd trigger --> Something is wrong with this version and the timer doesn't get the stop trigger
#brd11.upload_to_ram_and_program("gpio_pins3_2021-02-04_1838.fpg")
#brd12.upload_to_ram_and_program("gpio_pins3_2021-02-04_1838.fpg")

#brd9.upload_to_ram_and_program("gpio_pins3_2021-02-04_2141.fpg") # 16-clock-cycle pulse, and timer only uses 1st and 2nd trigger
#brd11.upload_to_ram_and_program("gpio_pins3_2021-02-04_2141.fpg") # 16-clock-cycle pulse, and timer only uses 1st and 2nd trigger
#brd12.upload_to_ram_and_program("gpio_pins3_2021-02-04_2141.fpg") # 16-clock-cycle pulse, and timer only uses 1st and 2nd trigger


#brd9.upload_to_ram_and_program("gpio_pins3_2021-02-05_1206.fpg") #22-clock-cycle pulse, only use 1st and 2nd trigger
#brd11.upload_to_ram_and_program("gpio_pins3_2021-02-05_1206.fpg") #22-clock-cycle pulse, only use 1st and 2nd trigger
#brd12.upload_to_ram_and_program("gpio_pins3_2021-02-05_1206.fpg") #22-clock-cycle pulse, only use 1st and 2nd trigger



brd9.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg") #1000 clock cycle pulse
brd11.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg") #1000 clock cycle pulse
brd12.upload_to_ram_and_program("gpio_pins3_2021-02-07_2206.fpg") #1000 clock cycle pulse

#do test n times for each board and save results
n=500
brd9results=np.zeros((n,10),dtype="int32")
print("Starting on board9")
print("doing test " + str(n) + " times")
for i in range(n):
	brd9results[i]=time_trigger_communication(brd9)
	if i==100:
		print("100th test")
	if i==200:
		print("200th test")
	if i==300:
		print("300th test")
	if i==400:
		print("400th test")
brd11results=np.zeros((n,10),dtype="int32")
print("Starting on board11")
print("doing test " + str(n) + " times")
for i in range(n):
	brd11results[i]=time_trigger_communication(brd11)
	if i==100:
		print("100th test")
	if i==200:
                print("200th test")
	if i==300:
                print("300th test")
	if i==400:
                print("400th test")
brd12results=np.zeros((n,10),dtype="int32")
print("Starting on board12")
print("doing test " + str(n) + " times")
for i in range(n):
	brd12results[i]=time_trigger_communication(brd12)
	if i==100:
                print("100th test")
	if i==200:
                print("200th test")
	if i==300:
                print("300th test")
	if i==400:
                print("400th test")
print("Saving results")
print("Columns are: initialstate9,initialstate11,initialstate12,timer_value,count9,count11,count12,finalstate9,finalstate11,finalstate12 ")
np.savetxt("brd9results7-13-2021.txt",brd9results)
np.savetxt("brd11results7-13-2021.txt",brd11results)
np.savetxt("brd12results7-13-2021.txt",brd12results)

