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
x = a.readRAM()
for i in range(4):
    for j in range(8):
        print "%d:%d:" % (i,j), x[i][0:12,j]
