import corr
import logging
import caltech_adc
import time

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)

r = corr.katcp_wrapper.FpgaClient('r2d020669')
time.sleep(0.1)

a = caltech_adc.CaltechAdc(r, logger=logger)


a.snapshot()
x = a.readRAM(signed=False, undo_bitflip=True)
#x = a.readRAM(signed=True, undo_bitflip=True)
for i in range(4):
    print ""
    for j in range(8):
        print "%d:%d:" % (i,j), 
        for k in range(12):
            print "%3d " % x[i][k,j],
        print ""
