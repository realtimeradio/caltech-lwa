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
                  'VBUS':          0b111  << 6,
                  'VSH':           0b111  << 3,
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
        self.setWord('configuration',conf)

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
    
