#This is a script to program and initialize multiple snap2 boards
from lwa_f import snap2_fengine


fpgfile="/home/ubuntu/kp/caltech-lwa/snap2_f_200msps_64i_4096c/outputs/snap2_f_200msps_64i_4096c_2023-03-23_1851.fpg"

brdnames=['snap01','snap02','snap03','snap04','snap06','snap07','snap08','snap09','snap10','snap11']

#load firmware and initialize etc

brds=[snap2_fengine.Snap2Fengine(brdname) for brdname in brdnames]
[brd.program(fpgfile) for brd in brds]
print("Done programming.")
print("Start initializing")
[brd.initialize(read_only=False) for brd in brds]
[brd.sync.arm_sync() for brd in brds]
[brd.sync.sw_sync() for brd in brds]

