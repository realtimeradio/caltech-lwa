import time
import logging
from casperfpga.i2c import I2C_DEVICE

class PCA9544A(object):

    devAddrBase = 0b1110000 #: Top 4 address bits are hard coded

    def __init__(self, itf, addr=0b101, **kwargs):
        self.itf = itf
        self.addr = self.devAddrBase + addr
        self.logger = kwargs.get('logger',logging.getLogger(__name__))

    def set_output(self, output):
        return self.itf.write(self.addr, cmd=output)

    def get_output(self):
        return self.itf.read(self.addr, length=1)


class INA226(I2C_DEVICE):
    """ Ultra-Precise I2C Output Current, Voltage, and Power Monitor With Alert """
    
    DICT = dict()
    
    DICT[0x00] = {'configuration': 0xffff << 0,
                  'RST':           0b1    << 15,
                  'AVG':           0b111  << 9,
                  'VBUSCT':        0b111  << 6,
                  'VSHCT':         0b111  << 3,
                  'MODE':          0b111  << 0}
    
    DICT[0x01] = {'shuntvoltage' : 0xffff << 0,}
    DICT[0x02] = {'busvoltage' : 0xffff << 0}
    DICT[0x03] = {'power' : 0xffff << 0,}
    DICT[0x04] = {'current' : 0xffff << 0,}
    DICT[0x05] = {'calibration' : 0xffff << 0,}
    DICT[0x06] = {'mask': 0xffff << 0,
                  'CVRF': 0b1 << 3,
                  'OVF':  0b1 << 2}
    
    def __init__(self, itf, addr=0x45, **kwargs):
        super(INA226, self).__init__(itf, addr, **kwargs)
        self._tsampling = 0.009  # Maximum conversion time + ~1 ms
        
    def init(self, avg=0b000, vbusct=0b100, vshct=0b100, mode=0b011):
        """ Initialise INA226
        
            Avg, availiable options:
               AVG2    AVG1   AVG0   Number of averages
               0       0      0      1
               0       0      1      4
               0       1      0      16
               0       1      1      64
               1       0      0      128
               1       0      1      256
               1       1      0      512
               1       1      1      1024
         
            Vbusct, availiable options:
               CT2     CT1    CT1    VBus conversion time
               0       0      0      140 us
               0       0      1      204 us
               0       1      0      332 us
               0       1      1      588 us
               1       0      0      1.1 ms
               1       0      1      2.116 ms
               1       1      0      4.156 ms
               1       1      1      8.244 ms
               
            Vshct, availiable options:
               CT2     CT1    CT1    VSh conversion time
               0       0      0      140 us
               0       0      1      204 us
               0       1      0      332 us
               0       1      1      588 us
               1       0      0      1.1 ms
               1       0      1      2.116 ms
               1       1      0      4.156 ms
               1       1      1      8.244 ms
               
            Mode, availiable options:
               MODE3   MODE2  MODE1  MODE
               0       0      0      Power-Down (or Shutdown)
               0       0      1      Shunt Voltage, Triggered
               0       1      0      Bus Voltage, Triggered
               0       1      1      Shunt and Bus, Triggered
               1       0      0      Power-Down (or Shutdown)
               1       0      1      Shunt Voltage, Continuous
               1       1      0      Bus Voltage, Continuous
               1       1      1      Shunt and Bus, Continuous
               
        """
        
        if avg not in range(8):
            raise ValueError("Invalid parameter")
        if vbusct not in range(8):
            raise ValueError("Invalid parameter")
        if vshct not in range(8):
            raise ValueError("Invalid parameter")
        if mode not in range(8):
            raise ValueError("Invalid parameter")
        
        val = 0x4127
        rid, mask = self._getMask(self.DICT, 'AVG')
        val = self._set(val, mode, mask)
        rid, mask = self._getMask(self.DICT, 'VBUSCT')
        val = self._set(val, mode, mask)
        rid, mask = self._getMask(self.DICT, 'VSHCT')
        val = self._set(val, mode, mask)
        rid, mask = self._getMask(self.DICT, 'MODE')
        val = self._set(val, mode, mask)
        
        self.write(rid, val)
        
        ct = max(vbusct, vshct)
        self._tsampling = (2**(ct-4) + 0.5) / 1000.
            
    def _set(self, d1, d2, mask=None):
        # Update some bits of d1 with d2, while keep other bits unchanged
        if mask:
            d1 = d1 & ~mask
            d2 = d2 * (mask & -mask)
        return d1 | d2
        
    def _get(self, data, mask):
        data = data & mask
        return data // (mask & -mask)
        
    def _getMask(self, dicts, name):
        for rid in dicts:
            if name in dicts[rid]:
                return rid, dicts[rid][name]
        return None,None
        
    def write(self, reg=None, data=None):
        self.itf.write(self.addr, reg, [data>>8, data&0xff])
        
    def read(self, reg=None, length=2):
        msb, lsb = self.itf.read(self.addr, reg, length)
        return (msb << 8) | lsb
        
    def readCurrent(self, r):
        """ Read current by reading voltage
            over shunt resistor and applying
            Ohm's law.

            r : resistance of shunt resistor

            returns: Current in Amps
        """
        v = self.readVolt('shunt')
        return v / r
        
    def readVolt(self, name):
        """ Read Voltage

        Please switch to corresponding modes using init() before measuring voltage.
        Possible options are:
            'shunt'
            'bus'

            E.g.
            readVolt('shunt')
        """
        name = name.lower()
        if name not in ['shunt','bus']:
            raise ValueError("Invalid parameter")

        # trigger
        conf = self.getWord('configuration')
        self.setWord('configuration', conf)

        # check availability
        for i in range(self._retry+1):
            if not self.getStatus('CVRF'):
                break
            elif i == self._retry:
                raise IOError('Failed to read voltage, conversion not ready!')
            else:
                time.sleep(self._tsampling)

        # read and interpret
        if name == 'shunt':
            val = self.getWord('shuntvoltage')
            val = -1 * (~val + 1) if val & 0x8000 else val
            return val * 2.5e-6

        else: # name == 'bus':
            val = self.getWord('busvoltage')
            return val * 1.25e-3
            
    def getStatus(self, name='CVRF'):
        if name not in ['CVRF', 'OVF']:
            raise ValueError("Invalid parameter")
            
        return self.getWord(name)
        
    def getRegister(self, rid=None):
        if rid == None:
            return dict([(regId,self.getRegister(regId)) for regId in self.DICT])
        elif rid in self.DICT:
            rval = self.read(rid)
            return {name: self._get(rval,mask) for name, mask in self.DICT[rid].items()}
        else:
            raise ValueError("Invalid parameter")
            
    def getWord(self, name):
        rid, mask = self._getMask(self.DICT, name)
        return self._get(self.read(rid), mask)
        
    def setWord(self, name, value):
        rid, mask = self._getMask(self.DICT, name)
        if mask == 0xffff:
            data = self._set(0x0,value,mask)
            self.write(reg=rid,data=data)
        else:
            data = self.read(rid)
            data = self._set(data,value,mask)
            self.write(reg=rid, data=data)
    
