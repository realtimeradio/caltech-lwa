#This script automates the tests descrbed in evernote firmwrae notebook 4/1/2021 note.   The goal is to send a trigger to a board from software and send the packets over the network to a computer (here the computer is minor).  Run tcpdump on the receiving computer to complete the tests.

import casperfpga
import time
import argparse

######## Configure Test Parameters ####################
parser=argparse.ArgumentParser(description='Trigger a snapshot readout from software to a specified destination address, and report summary information.')
parser.add_argument('fpgfil', type=str, help='Firmware .fpg file to load.')
parser.add_argument('brd', type=str, help='SNAP2 to hostname.')
parser.add_argument('pktwait', type=int, help='Clock cycles to wait between packets. 0 means do not set this register (only choose 0 for old versions of firmware without the variable delay option)')

parser.add_argument('dest', type=str, help='Destination. "minor" or "lwacr"')
parser.add_argument('data', type=str, help='Data source e.g. "counter", "constant"')
parser.add_argument('programbrd', type=bool, help='If True, the FPGA will be reprogrammed.')
args=parser.parse_args()

fpgfile=args.fpgfil
packetwait=args.pktwait
brdname=args.brd
destination=args.dest
datasource=args.data
program=args.programbrd

print('Wait ' + str(packetwait) + 'clock cycles between packets')
######################## Define Addresses #############################
if brdname=='snap2-rev2-9':
	ip = '192.168.41.13'
	mac = 0x020202030303
if brdname=='snap2-rev2-11':
	ip='192.168.41.14'
	mac=0x020202040404
if brdname=='snap2-rev2-12':
	ip='192.168.41.15'
	mac=0x020202050505
if brdname=='snap01':
        ip='10.41.0.201'
        mac=0x020202010101
if brdname=='snap03':
        ip='10.41.0.203'
        mac=0x020202030303

#Load the firmware and configure the 40 Gbe core to send packets to minor enp129s0f1
brd = casperfpga.CasperFpga(brdname, transport=casperfpga.TapcpTransport)
brd.listdev()
if program==True:
        print('Programming board')
        brd.upload_to_ram_and_program(fpgfile)
        time.sleep(10)
brd.get_system_information(fpgfile)
if destination == 'lwacr':
    brd.write_int('cosmic_ray_cr_dest_ip',(10<<24)+(41<<16)+(0<<8)+106)
    brd.write_int('cosmic_ray_cr_dest_port',11111)
    brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)
    brd.gbes.cosmic_ray_cr_forty_gbe.configure_core(mac, ip, 11111)
    brd.gbes.cosmic_ray_cr_forty_gbe.set_single_arp_entry('10.41.0.106',  0x043f72dfc2f8)
    brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)

elif destination == 'minor':
    brd.write_int('cosmic_ray_cr_dest_ip',3232246028)
    brd.write_int('cosmic_ray_cr_dest_port',11111)
    brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)
    brd.gbes.cosmic_ray_cr_forty_gbe.configure_core(mac, ip, 11111)
    brd.gbes.cosmic_ray_cr_forty_gbe.set_single_arp_entry('192.168.41.12', 0x98039b3d8b7b)
    brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)
else:
    print(destination + " is not a recognized destination.")
# set test data source
if datasource=='constant':
	#brd.write_int('cosmic_ray_select_input_signal',1)
	brd.write_int('cosmic_ray_select_input_signal1',1)
elif datasource=='counter':
	#brd.write_int('cosmic_ray_select_input_signal',0)
	brd.write_int('cosmic_ray_select_input_signal1',0)
else:
	print("datasource must be 'constant' or 'counter'. Defaulting to 'counter'")
#set wait time
if packetwait:
	brd.write_int('cosmic_ray_wait_between_packets', packetwait)

##########################Reset and then Send Trigger#####################

#Ensure the board is listening: write the register reset_to_listen to 0 and then to 1. Confirm that it is reset.
brd.write_int('cosmic_ray_reset_to_listen',0)
brd.write_int('cosmic_ray_reset_to_listen',1)
val = brd.read_int('cosmic_ray_readout_state_value')
assert val==0, "board didn't reset to listen"

#Reset the readout timer by putting readout_timer_reset1 to 0 and then to 1, and make sure the timer is staying zero and not counting.
brd.write_int('cosmic_ray_readout_timer_reset1',0)
brd.write_int('cosmic_ray_readout_timer_reset1',1)
val = brd.read_int('cosmic_ray_readout_state_timer1')
assert val == 0, "readout state timer started before trigger"

#Read the readout state register: Read readout_state_value. It should be 0.
val = brd.read_int('cosmic_ray_readout_state_value')
assert val == 0, "board in readout state before trigger sent"

#Read tx_count_eof_and_valid and overflow counters before sending the trigger. This counts how many packets the board thinks are sent and whether the packetizer buffer ever overflowed or almost overflowed..
previous_packets = brd.read_int('cosmic_ray_tx_count_eof_and_valid')

previous_afull = brd.read_int('cosmic_ray_forty_g_tx_afull')
previous_overflows = brd.read_int('cosmic_ray_forty_g_tx_of')

#enable the ethernet packetizer
brd.write_int("cosmic_ray_eth_enable",1)

#Send a trigger from software: write register send_trigger to 0 then to 1. 
brd.write_int('cosmic_ray_send_trigger',0)
brd.write_int('cosmic_ray_send_trigger',1)

#wait a second
time.sleep(1)

##############################Read registers after the readout ###############
#After short wait, read tx_count_eof_and_valid, and confirm that it has incremented by 64.
packets = brd.read_int('cosmic_ray_tx_count_eof_and_valid') 
print ("Packetizer formed " + str(packets - previous_packets) + " packets")

#Read readout_state_value. It should be 0.
val = brd.read_int('cosmic_ray_readout_state_value')
if val == 0:
	print("Board successfully returned to listening state after readout")
if val !=0:
	print("Board did not return to listening state after readout. State value = " + str(val))

#Read register readout_state_timer.
val = brd.read_int('cosmic_ray_readout_state_timer1')
print ("Readout took " + str(val) + " clock cycles")

#Read overflow counter to confirm that the 40Gbe block did not overflow.
of = brd.read_int('cosmic_ray_forty_g_tx_of')
overflows = of - previous_overflows
if overflows == 0:
	print("Packetizer never overflowed")
else:
	print("Packetizer overflowed" + str(val) + " times")
afull = brd.read_int('cosmic_ray_forty_g_tx_afull')
new_afull = afull - previous_afull
print("Ethernet block almost-full counter incremented by " + str(new_afull))
