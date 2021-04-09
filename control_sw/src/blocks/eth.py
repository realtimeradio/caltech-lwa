from .block import Block
from lwa_f.error_levels import *

class Eth(Block):
    _CORE_NAME = 'forty_gbe'
    def __init__(self, host, name, logger=None):
        super(Eth, self).__init__(host, name, logger)

    def set_arp_table(self, macs):
        """
        Set the ARP table with a list of MAC addresses.
        The list, `macs`, is passed such that the zeroth
        element is the MAC address of the device with
        IP XXX.XXX.XXX.0, and element N is the MAC
        address of the device with IP XXX.XXX.XXX.N
        """
        macs = list(macs)
        macs_pack = struct.pack('>%dQ' % (len(macs)), *macs)
        self.write(self._CORE_NAME, macs_pack, offset=0x3000)

    def add_arp_entry(self, ip, mac):
        """
        Set a single arp entry.
        """
        mac_pack = struct.pack('>Q', mac)
        ip_offset = ip % 256
        self.write(self._CORE_NAME, mac_pack, offset=0x3000 + ip_offset*8)

    def get_status(self):
        #stat = self.read_uint('sw_txs_ss_status')
        stats = {}
        flags = {}
        #rv['rx_overrun'  ] =  (stat >> 0) & 1   
        #rv['rx_bad_frame'] =  (stat >> 1) & 1
        #rv['tx_of'       ] =  (stat >> 2) & 1   # Transmission FIFO overflow
        #rv['tx_afull'    ] =  (stat >> 3) & 1   # Transmission FIFO almost full
        #rv['tx_led'      ] =  (stat >> 4) & 1   # Transmission LED
        #rv['rx_led'      ] =  (stat >> 5) & 1   # Receive LED
        #rv['up'          ] =  (stat >> 6) & 1   # LED up
        #rv['eof_cnt'     ] =  (stat >> 7) & (2**25-1)
        stats['tx_of'        ] =  self.read_uint(self._CORE_NAME + '_txofctr')
        stats['tx_full'      ] =  self.read_uint(self._CORE_NAME + '_txfullctr')
        stats['tx_err'       ] =  self.read_uint(self._CORE_NAME + '_txerrctr')
        stats['tx_vld'       ] =  self.read_uint(self._CORE_NAME + '_txvldctr')
        stats['tx_ctr'       ] =  self.read_uint(self._CORE_NAME + '_txctr')
        if stats['tx_of'] > 0:
            flags['tx_of'] = FENG_ERROR
        return stats, flags
        
    def status_reset(self):
        self.change_reg_bits('ctrl', 0, 18)
        self.change_reg_bits('ctrl', 1, 18)
        self.change_reg_bits('ctrl', 0, 18)

    def reset(self):
        # stop traffic before reset
        self.disable_tx()
        # toggle reset
        self.change_reg_bits('ctrl', 0, 0)
        self.change_reg_bits('ctrl', 1, 0)
        self.change_reg_bits('ctrl', 0, 0)

    def enable_tx(self):
        self.change_reg_bits('ctrl', 1, 1)

    def disable_tx(self):
        self.change_reg_bits('ctrl', 0, 1)

    def initialize(self, read_only=False):
        if read_only:
            return
        #Set ip address of the SNAP
        ipaddr = socket.inet_aton(socket.gethostbyname(self.host.host))
        self.blindwrite(self._CORE_NAME, ipaddr, offset=0x10)

    def set_source_port(self, port):
        # see config_10gbe_core in katcp_wrapper
        self.blindwrite(self._CORE_NAME, struct.pack('>BBH', 0, 1, port), offset=0x20)
