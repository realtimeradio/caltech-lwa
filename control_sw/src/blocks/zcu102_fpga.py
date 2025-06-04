import socket
import time
import datetime
import subprocess

from lwa_f.blocks.fpga import Fpga as _Fpga
from lwa_f.error_levels import *
from lwa_f import __version__
from lwa_f import __fwversion__

import casperfpga.sysmon

class Fpga(_Fpga):
    """
    Instantiate a control interface for top-level FPGA control.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    """
    
    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - programmed (bool) : ``True`` if FPGA appears to be running DSP
              firmware. ``False`` otherwise, and flagged as a warning.

            - flash_firmware (str) : The name of the firmware file currently
              loaded in flash memory.

            - flash_firmware_md5 (str) : The MD5 checksum of the firmware file
              currently loaded in flash memory.

            - timestamp (str) : The current time, as an ISO format string.

            - fpga_clk_mhz (float) : The estimated FPGA clock rate in MHz. This
                is the same as the estimated ADC sampling rate.
              Flagged with an error if not between 190 and 200 MHz

            - host (str) : The host name of this board.

            - sw_version (str) : The version string of the control software
              package. Flagged as warning if the version indicates a build
              against a dirty git repository.

            - fw_supported (bool) : True if the running firmware is supported
              by this software. False (and flagged as an error) otherwise.

            - fw_version (str): The version string of the currently running
              firmware. Available only if the board is programmed.

            - fw_build_time (int): The build time of the firmware,
              as an ISO format string. Available only if the board 
              is programmed.

            - sys_mon (str) : ``'reporting'`` if the current firmware has a
              functioning system monitor module. Otherwise ``'not reporting'``,
              flagged as an error.

            - temp (float) : FPGA junction temperature, in degrees C. (Only
              reported is system monitor is available). Flagged as a warning
              if outside the recommended operating conditions. Flagged as an
              error if outside the absolute maximum ratings. See DS892.

            - vccaux (float) : Voltage of the VCCAUX FPGA power rail. (Only
              reported is system monitor is available). Flagged as a warning
              if outside the recommended operating conditions. Flagged as an
              error if outside the absolute maximum ratings. See DS892.

            - vccbram (float) : Voltage of the VCCBRAM FPGA power rail. (Only
              reported is system monitor is available). Flagged as a warning
              if outside the recommended operating conditions. Flagged as an
              error if outside the absolute maximum ratings. See DS892.

            - vccint (float) : Voltage of the VCCINT FPGA power rail. (Only
              reported is system monitor is available). Flagged as a warning
              if outside the recommended operating conditions. Flagged as an
              error if outside the absolute maximum ratings. See DS892.


        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.
        """
        stats = {}
        flags = {}
        stats['programmed'] = self.is_programmed()
        katcp_meta = self.sysmon.fpga.system_info
        meta = {'filename': katcp_meta['system'],
                'md5sum': katcp_meta['md5_bitstream']
               }
        stats['flash_firmware'] = meta['filename']
        stats['flash_firmware_md5'] = meta['md5sum']
        stats['timestamp'] = datetime.datetime.now().isoformat()
        stats['host'] = self.host.host
        stats['sw_version'] = __version__
        fpga_clk_mhz = self.get_fpga_clock()
        stats['fpga_clk_mhz'] = fpga_clk_mhz
        if fpga_clk_mhz > 200. or fpga_clk_mhz < 190.:
            flags['fpga_clk_mhz'] = FENG_ERROR
        if stats['programmed']:
            stats['fw_version'] = self.get_firmware_version()
            stats['fw_build_time'] = datetime.datetime.fromtimestamp(self.get_build_time()).isoformat()
            stats['fw_supported'] = self.check_firmware_support()
            if not stats['fw_supported']:
                flags['fw_supported'] = FENG_ERROR
        try:
            soutput = subprocess.check_output(['sshpass', '-p', 'casper', 'ssh',
                                                   f"casper@{self.host.host}",
                                                   'cat /sys/bus/iio/devices/iio\:device0/in_temp2_pl_temp_* && cat /sys/bus/iio/devices/iio\:device0/in_voltage[234]_*'], text=True)
            to, tr, ts, cr, cs, br, bs, ur, us = soutput.split('\n', 8)
            stats['temp'] = (int(tr, 10) + int(to, 10)) * float(ts) / 1000.
            stats['vccint'] = int(cr, 10) * float(cs) / 1000.
            stats['vccbram'] = int(br, 10) * float(bs) / 1000.
            stats['vccaux'] = int(ur, 10) * float(us) / 1000.
        except Exception as e:
            self._warning("Error while trying sysmon access though PS side: %s", str(e))
            stats['sys_mon'] = 'not reporting'
            flags['sys_mon'] = FENG_WARNING
        if not stats['programmed']:
            flags['programmed'] = FENG_ERROR
        if stats['sw_version'].endswith('dirty'):
            flags['sw_version'] = FENG_WARNING
        if 'vccaux' in stats:
            if stats['vccaux'] < 1.746 or stats['vccaux'] > 1.854:
                flags['vccaux'] = FENG_WARNING
            if stats['vccaux'] < -0.5 or stats['vccaux'] > 2.0:
                flags['vccaux'] = FENG_ERROR
        if 'vccbram' in stats:
            if stats['vccbram'] < 0.825 or stats['vccbram'] > 0.875:
                flags['vccbram'] = FENG_WARNING
            if stats['vccbram'] < -0.5 or stats['vccbram'] > 1.1:
                flags['vccbram'] = FENG_ERROR
        if 'vccint' in stats:
            if stats['vccint'] < 0.825 or stats['vccint'] > 0.875:
                flags['vccint'] = FENG_WARNING
            if stats['vccint'] < -0.5 or stats['vccint'] > 1.1:
                flags['vccint'] = FENG_ERROR
        if 'temp' in stats:
            if stats['temp'] < 0 or stats['temp'] > 85:
                flags['temp'] = FENG_WARNING
            if stats['temp'] > 125:
                flags['temp'] = FENG_ERROR
        return stats, flags
