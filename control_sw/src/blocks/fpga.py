from .block import Block
from lwa_f.error_levels import *
from lwa_f import __version__

import casperfpga.sysmon

class Fpga(Block):
    def __init__(self, host, name, logger=None):
        # Top-level F-engine sees all registers
        super(Fpga, self).__init__(host, name, logger)

        # Try and get the canonical name of the host
        # to use as a serial number
        try:
            self.serial = socket.gethostbyaddr(self.host.hostname)[0]
        except:
            self._exception("Couldn't get host by address %s" % self.hostname)
            self.serial = None

        self.sysmon = casperfpga.sysmon.Sysmon(self.host)

    def is_programmed(self):
        """
        Lazy check to see if a board is programmed.
        Check for the "version_version" register. If it exists, the board is deemed programmed.
        Returns:
            True if programmed, False otherwise
        """
        return 'version_version' in self.listdev()

    def get_status(self):
        """
        Get FPGA stats.
        returns: Dictionary of stats
        """
        stats = {}
        flags = {}
        stats['programmed'] = self.is_programmed()
        meta = self.host.transport.get_metadata()
        stats['flash_firmware'] = meta['filename']
        stats['flash_firmware_md5'] = meta['md5sum']
        stats['timestamp'] = datetime.datetime.now().isoformat()
        stats['serial'] = self.serial
        stats['host'] = self.host
        stats['sw_version'] = __version__
        try:
            stats.update(self.sysmon.get_all_sensors())
            stats['sys_mon'] = 'reporting'
            flags['sys_mon'] = FENG_OK
        except:
            stats['sys_mon'] = 'not reporting'
            flags['sys_mon'] = FENG_ERROR
        if not stats['programmed']:
            flags['programmed'] = FENG_WARNING
        if stats['sw_version'].endswith('dirty'):
            flags['sw_version'] = FENG_WARNING
        if stats['serial'] is None:
            flags['serial'] = FENG_WARNING
        return stats, flags
