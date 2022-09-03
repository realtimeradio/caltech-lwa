#!/usr/bin/env python
import pandas as pd
import time
import numpy as np
import struct
from lwa_f import snap2_fengine
from lwa_f import blocks

def extractvalue(mainregister,nbits,MSBoffset,bw):
    #extract the value of the specified consecutive bits of mainregister
    #MSBoffset is the offset from the most significant bit of mainregister
    #bw is the bitwidth of the number to extract
    #nbits is the number of bits of mainregister
    #returns the extracted value
    LSBoffset=nbits-(MSBoffset+bw)
    extractmask = ((1<<bw) - 1) <<LSBoffset
    val=(mainregister&extractmask)>> LSBoffset
    return val

def updatevalue(mainregister,nbits,MSBoffset,bw,newval):
    #update the value of the specified consecutive bits of mainregister
    #MSBoffset is the offset from the most significant bit of mainregister
    #bw is the bitwidth of the number to extract
    #nbits is the number of bits of mainregister
    #newval is the new value to write to that subset of bits
    #returns updated value of mainregister
    LSBoffset=nbits-(MSBoffset+bw)
    extractmask = ((1<<bw) - 1) <<LSBoffset
    excludemask = ((1<<nbits)-1) - extractmask
    mainregister=(mainregister&excludemask) + (newval<<LSBoffset)
    return mainregister

def lookup_register(name,fname):
    #fname is the file with a table of register information
    #name is the name you want to look up
    registers = pd.read_excel(fname,engine='openpyxl')
    return registers[registers['interface']==name]

def getvalue(brd,name,fname):
    #brd is a casperfpga CasperFpga object
    #fname is the file name of the register description table
    #name is the name of the quantity you want to read from the board
    info=lookup_register(name,fname)
    mainregistername=info['registername'].values[0]
    mainregistervalue=brd.read_int(mainregistername)
    value=extractvalue(mainregistervalue,info['mainregister_bitwidth'].values[0],info['offset_from_msb'].values[0],info['bitwidth'].values[0])
    time.sleep(0.01)
    return value

def setvalue(brd,name,fname,newvalue):
    #brd is a casperfpga CasperFpga object
    #fname is the file name of the register description table
    #name is the name of the setting you want to update on the board
    #newvalue is the new value you want to update that setting with
    info=lookup_register(name,fname)
    mainregistername=info['registername'].values[0]
    mainregistervalue=brd.read_int(mainregistername)
    #value=extractvalue(mainregistervalue,info['mainregister_bitwidth'].values[0],info['offset_from_msb'].values[0],info['bitwidth'].values[0])
    updatedvalue=updatevalue(mainregistervalue,info['mainregister_bitwidth'].values[0],info['offset_from_msb'].values[0],info['bitwidth'].values[0],newvalue)
    brd.write_int(mainregistername,updatedvalue)
    time.sleep(0.01)
    return

def reset_to_listen(brd):
    setvalue(brd,'reset_to_listen','cr_registers.xlsx',0)
    setvalue(brd,'reset_to_listen','cr_registers.xlsx',1)
    return

def setup_ethernet(brdname,brd,fpgfile,destinationcomputer,packetwait):
    #this function configures the 40Gb block and sets the destination IP and Port and the number of clock cycles between packets
    #It does not enable the valid and end of frame signals, so no data will be sent until running enable_ethernet(brd)
    #brdname is the network name of a SNAP2
    #brd is a casperfpga object that connects to that SNAP2
    #fpgfile is the path to the fpgfile that is already programmed on the board
    #destinationcomputer is the name, either "minor" or "lwacr", of the computer to which to send the data
    #packetwait is the number of clock cycles to wait between packets
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
    if brdname=='snap02':
        ip='10.41.0.202'
        mac=0x020202020202
    if brdname=='snap03':
        ip='10.41.0.203'
        mac=0x020202030303
    if brdname=='snap04':
        ip='10.41.0.204'
        mac=0x020202040404
    if brdname=='snap05':
        ip='10.41.0.205'
        mac=0x020202050505
    if brdname=='snap06':
        ip='10.41.0.206'
        mac=0x020202060606
    if brdname=='snap07':
        ip='10.41.0.207'
        mac=0x020202070707
    if brdname=='snap08':
        ip='10.41.0.208'
        mac=0x020202080808
    if brdname=='snap09':
        ip='10.41.0.209'
        mac=0x020202090909
    if brdname=='snap10':
        ip='10.41.0.210'
        mac=0x020202101010
    if brdname=='snap11':
        ip='10.41.0.211'
        mac=0x020202111111

    #configure the 40 Gbe core
    brd.get_system_information(fpgfile)
    if destinationcomputer == 'lwacr':
        setvalue(brd,'dest_ip','cr_registers.xlsx',(10<<24)+(41<<16)+(0<<8)+58)
        setvalue(brd,'cr_dest_port','cr_registers.xlsx',11111)
        brd.gbes.cosmic_ray_cr_forty_gbe.configure_core(mac, ip, 11111)
        brd.gbes.cosmic_ray_cr_forty_gbe.set_single_arp_entry('10.41.0.58',  0x043f72dfc2f8)
        brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)

    elif destinationcomputer == 'minor':
        setvalue(brd,'dest_ip','cr_registers.xlsx',3232246028)
        setvalue(brd,'cr_dest_port','cr_registers.xlsx',11111)
        brd.gbes.cosmic_ray_cr_forty_gbe.configure_core(mac, ip, 11111)
        brd.gbes.cosmic_ray_cr_forty_gbe.set_single_arp_entry('192.168.41.12', 0x98039b3d8b7b)
        brd.gbes.cosmic_ray_cr_forty_gbe.print_gbe_core_details(arp=True)
    else:
        print(destination + " is not a recognized destination.")
    
    #set wait time
    if packetwait:
        print("Setting wait between packets to "+str(packetwait))
        setvalue(brd,'wait_between_packets', 'cr_registers.xlsx', packetwait)

    #reset the board to listening
    reset_to_listen(brd)
    
    return
    
def setup_data_source(brd,datasource):
    #set the data input to the cosmic ray system
    #brd is a casperfgpa.CasperFpga object
    #source is the data to use, either "constant", "counter", or "adc"
    #if constant is chosen, each timeseries will be a constant value, with a different value in place of each antenna signa
    #if counter is chosen, all timeseries will be the same ramp in time
    #if adc is chosen, data output from the ADC block will be used. This can be a sky signal or a test vector depending on how the ADC block is initialized
    
    if datasource=='constant':
        setvalue(brd,'select_input_signal', 'cr_registers.xlsx', 1)
    elif datasource=='counter':
        setvalue(brd,'select_input_signal', 'cr_registers.xlsx', 0)

    elif datasource=='adc':
        setvalue(brd,'select_input_signal', 'cr_registers.xlsx', 3)
    else:
        print("datasource must be 'constant','counter', or 'adc'. Defaulting to 'counter'")
    print("Data source set to "+datasource)
    return

def software_trigger(brd,stats):
    #Send a trigger from software
    #brd is a casperfgpa.CasperFpga object
    #if stats has a Boolean value of true, some diagnostic information will be printed

    #Ensure the board is listening: write the register reset_to_listen to 0 and then to 1. Confirm that it is reset.
    reset_to_listen(brd)
    val=getvalue(brd,"readout_state_value","cr_registers.xlsx")
    assert val==0, "board didn't reset to listen"

    if stats:
        #Reset the readout timer by putting readout_timer_reset1 to 0 and then to 1, and make sure the timer is staying zero and not counting.
        setvalue(brd,'readout_timer_reset','cr_registers.xlsx',0)
        setvalue(brd,'readout_timer_reset','cr_registers.xlsx',1)
        val=getvalue(brd,'readout_state_timer','cr_registers.xlsx')
        assert val == 0, "readout state timer started before trigger"

        #Read tx_count_eof_and_valid and overflow counters before sending the trigger. This counts how many packets the board thinks are sent and whether the packetizer buffer ever overflowed or almost overflowed..
        previous_packets = getvalue(brd,'eof_and_valid','cr_registers.xlsx')
        previous_afull = getvalue(brd,'almostfull','cr_registers.xlsx')
        previous_overflows = getvalue(brd,'overflow','cr_registers.xlsx')
    
    #Read the readout state register: Read readout_state_value. It should be 0.
    val =getvalue(brd,'readout_state_value','cr_registers.xlsx')
    assert val == 0, "board in readout state before trigger sent"

    #Send a trigger from software: write register send_trigger to 0 then to 1.
    setvalue(brd,"send_trigger","cr_registers.xlsx",0)
    setvalue(brd,"send_trigger","cr_registers.xlsx",1)

    if stats:
        #wait a moment
        time.sleep(0.1)
        ##############################Read registers after the readout ###############
        #After short wait, read tx_count_eof_and_valid, and confirm that it has incremented by 64.
        packets = getvalue(brd,'eof_and_valid','cr_registers.xlsx')
        print ("Packetizer formed " + str(packets - previous_packets) + " packets")
    
        #Read readout_state_value. It should be 0.
        val = getvalue(brd,'readout_state_value','cr_registers.xlsx')
        if val == 0:
            print("Board successfully returned to listening state after readout")
        if val !=0:
            print("Board did not return to listening state after readout. State value = " + str(val))
    
        #Read register readout_state_timer.
        val = getvalue(brd,'readout_state_timer','cr_registers.xlsx')
        print ("Readout took " + str(val) + " clock cycles")
    
        #Read overflow counter to confirm that the 40Gbe block did not overflow.
        of = getvalue(brd,'overflow','cr_registers.xlsx')
        overflows = of - previous_overflows
        if overflows == 0:
            print("Packetizer never overflowed")
        else:
            print("Packetizer overflowed" + str(val) + " times")
        afull = getvalue(brd,'almostfull','cr_registers.xlsx')
        new_afull = afull - previous_afull
        print("Ethernet block almost-full counter incremented by " + str(new_afull))
        return

def read_threshold_rates(casperbrd):
    #Reads the shared BRAMs that hold the number of times the individual antennas exceed thresholds in the last 2^28 clock cycles
    #Returns an array of length 64 for the rate each antenna exceeds the core threshold and another for the rate exceeding veto threshold
    #casperbrd is a casperfpga CasperFpga object
    core = np.zeros(64)
    veto = np.zeros(64)
    core[:32]= struct.unpack('>32l',casperbrd.read("cosmic_ray_thresh_rate1",32*4,0))
    core[32:]= struct.unpack('>32l',casperbrd.read("cosmic_ray_thresh_rate2",32*4,0))
    veto[:32]= struct.unpack('>32l',casperbrd.read("cosmic_ray_veto_thresh_rate1",32*4,0))
    veto[32:]= struct.unpack('>32l',casperbrd.read("cosmic_ray_veto_thresh_rate2",32*4,0))
    return core, veto


def packantennaroles(roles_array):
    #turn an array of 64 ones and zeros into two 32 bit integers, one for the first half and one for the second
    output1=0
    output2=0
    for i in range(32):
        output1+=roles_array[i]<<i
        output2+=roles_array[i+32]<<i

    return output1, output2

def setup_coincidencer(casperbrd,trigger_power_thresh,
                      veto_power_thresh,
                      trigger_window,
                      veto_window,
                      antenna_number_thresh,
                      veto_number_thresh,
                      core_roles_array,
                      veto_roles_array):
    # set parameters
    setvalue(casperbrd,"trigger_power_thresh","cr_registers.xlsx",trigger_power_thresh)
    setvalue(casperbrd,"veto_power_thresh","cr_registers.xlsx",veto_power_thresh)
    setvalue(casperbrd,'trigger_window','cr_registers.xlsx',trigger_window) 
    setvalue(casperbrd,'veto_window','cr_registers.xlsx',veto_window) 
    setvalue(casperbrd,'antenna_number_thresh','cr_registers.xlsx',antenna_number_thresh) 
    setvalue(casperbrd,'veto_number_thresh','cr_registers.xlsx',veto_number_thresh) 
    #set the antenna roles
    core_roles1,core_roles2=packantennaroles(core_roles_array)
    veto_roles1,veto_roles2=packantennaroles(veto_roles_array)
    setvalue(casperbrd,'trigger_antennas1','cr_registers.xlsx',core_roles1)
    setvalue(casperbrd,'trigger_antennas2','cr_registers.xlsx',core_roles2)
    setvalue(casperbrd,'veto_antennas1','cr_registers.xlsx',veto_roles1)
    setvalue(casperbrd,'veto_antennas2','cr_registers.xlsx',veto_roles2)

    return

def set_delays(casperbrd,delays):
#see notebook subarray_threshold_scans for a function to extract the delays from a text file of delays and antenna names
    delayblock=blocks.delay.Delay(casperbrd, 'delay', n_streams=64, logger=None)
    delayblock.initialize()
    for i in range(64):
        z=delays[i]
        delayblock.set_delay(i,z)