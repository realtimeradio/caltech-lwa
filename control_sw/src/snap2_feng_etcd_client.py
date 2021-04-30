import os
import sys
import time
import json
import numpy as np
import etcd3
from . import snap2_fengine
import logging

# ETCD Keys
ETCD_CMD_ROOT = "/cmd/snap/"
ETCD_MON_ROOT = "/mon/snap/"
ETCD_RESP_ROOT = "/resp/snap/"

class Snap2FengineEtcdControl():
    """
    An ETCD interface to a SNAP2 F-engine

    :param etcdhost: Hostname (or IP, in dotted quad notation)
        of target etcd server.
    :type etcdhost: string

    :param logger: Python `logging.Logger` instance to which
        this class's log messages should be emitted. If None,
        log to stderr
    :type logger: logging.Logger

    """
    def __init__(self, etcdhost="localhost", logger=None):
        if logger is None:
            self.logger = logging.getLogger("Snap2FengineEtcd")
            stderr_handler = logging.StreamHandler(sys.stderr)
            self.logger.addHandler(stderr_handler)
            self.set_log_level("info")
        else:
            self.logger = logger

        # Connect to ETCD and ping the connection
        self.ec = etcd3.Etcd3Client(etcdhost)
        try:
            val, meta = self.ec.get('foo')
        except:
            self.logger.error("Failed to connect to Etcd server on host %s" % etcdhost)
            raise

    def set_log_level(self, level):
        """
        Set the logging level.

        :param level: Logging level. Should be "debug", "info", or "warning"
        :type level: string
        """
        if level not in ["debug", "info", "warning"]:
            self.logger.error("Can't set log level to %s. Should be "
                "'debug', 'info', or 'warning'")
            return
        if level == "debug":
            self.logger.setLevel(logging.DEBUG)
        elif level == "info":
            self.logger.setLevel(logging.INFO)
        elif level == "warning":
            self.logger.setLevel(logging.WARNING)

    def _format_command(self, sequence_id, timestamp, block, command, kwargs={}):
        """
        Format a command to be sent via ETCD

        :param sequence_id: The ``sequence_id`` command field
        :type block: int

        :param timestamp: The ``timestamp`` command field
        :type timestamp: float

        :param block: The ``block`` command field
        :type block: str

        :param command: The ``command`` command field
        :type command: str

        :param kwargs: The ``kwargs`` command field
        :type kwargs: dict

        :return: JSON-encoded command string to be sent. Returns None if there
            is an enoding error.
        """
        command_dict = {
            "command": command,
            "block": block,
            "sequence_id": sequence_id,
            "timestamp": timestamp,
            "kwargs": kwargs,
        }
        try:
            command_json = json.dumps(command_dict)
            return command_json
        except:
            self.logger.exception("Failed to JSON-encode command")
            return


    def send_command(self, host, block, command, kwargs={}, timeout=10.0):
        """
        Send a command to a SNAP2

        :param host: Bost to which command should be sent.
        :type host: str

        :param block: Block to which command applies.
        :type block: str

        :param command: Command to be sent
        :type command: str

        :param kwargs: Dictionary of key word arguments to be forwarded
            to the chosen command method
        :type kwargs: dict

        :param timeout: Time, in seconds, to wait for a response to the command.
        :type timeout: float

        :return: Dictionary of values, dependent on the command response.
        """
        cmd_key = ETCD_CMD_ROOT + "%s/command" % host
        resp_key = ETCD_RESP_ROOT + "%s/response" % host
        timestamp = time.time()
        sequence_id = int(timestamp * 1e6)
        command_json = self._format_command(
                           sequence_id,
                           timestamp,
                           block,
                           command,
                           kwargs = kwargs,
                       )
        if command_json is None:
            return False

        self._response_received = False
        self._response = None

        def response_callback(watchresponse):
            for event in watchresponse.events:
                self.logger.debug("Got command response")
                try:
                    response_dict = json.loads(event.value.decode())
                except:
                    self.logger.exception("Response JSON decode error")
                    continue
                self.logger.debug("Response: %s" % response_dict)
                resp_id = response_dict.get("sequence_id", None)
                if resp_id == sequence_id:
                    self._response = response_dict
                    self._response_received = True
                else:
                    self.logger.debug("Seq ID %d didn't match expected (%d)" % (resp_id, sequence_id))

        # Begin watching response channel and then send message
        watch_id = self.ec.add_watch_callback(resp_key, response_callback)
        # send command
        self.ec.put(cmd_key, command_json)
        starttime = time.time()
        while(True):
            if self._response_received:
                self.ec.cancel_watch(watch_id)
                #try:
                #    self._response['response'] = json.loads(self._response['response'])
                #except:
                #    self.logger.exception("Method response JSON decode error")
                return self._response['response']
            if time.time() > starttime + timeout:
                self.ec.cancel_watch(watch_id)
                return None
            time.sleep(0.01)

class Snap2FengineEtcdClient():
    """
    An ETCD client to interface a single SNAP2 F-Engine
    to an etcd store.

    :param fhost: Hostname (or IP, in dotted quad notation)
        of target F-Engine
    :type host: string

    :param etcdhost: Hostname (or IP, in dotted quad notation)
        of target etcd server.
    :type etcdhost: string

    :param logger: Python `logging.Logger` instance to which
        this class's log messages should be emitted. If None,
        log to stderr
    :type logger: logging.Logger

    :param fpg_tmp_dir: Directory where fpg files should be temporarily
        written prior to upload.
    :type fpg_tmp_dir: str
    """

    def __init__(self, fhost, etcdhost="localhost", logger=None):
        self.fhost = fhost
        if logger is None:
            self.logger = logging.getLogger("Snap2FengineEtcdClient:%s" % self.fhost)
            stderr_handler = logging.StreamHandler(sys.stderr)
            self.logger.addHandler(stderr_handler)
            self.set_log_level("info")
        else:
            self.logger = logger
        try:
            self.feng = snap2_fengine.Snap2Fengine(fhost)
        except:
            self.logger.exception("Couldn't initialize F-Engine on host %s" % self.fhost)
            self.feng = None
        self.ec = etcd3.Etcd3Client(etcdhost)
        try:
            val, meta = self.ec.get('foo')
        except:
            self.logger.exception("Failed to connect to Etcd server on host %s" % etcdhost)
            raise
        self.cmd_key = ETCD_CMD_ROOT + "%s/command" % self.fhost
        self.cmd_resp_key = ETCD_RESP_ROOT + "%s/response" % self.fhost
        self.mon_root = ETCD_MON_ROOT + "%s/" % self.fhost
        self.logger.debug("Command key is %s" % self.cmd_key)
        self.logger.debug("Command response key is %s" % self.cmd_resp_key)
        self.logger.debug("Monitor key root is %s" % self.mon_root)
        self._etcd_watch_id = None

    def _make_mkey(self, key):
        """
        Expand a keyname with the self.mon_root prefix.

        :param key: Key name
        :type key: string

        :return: Input key, prefixed with self.mon_root
        """
        return self.mon_root + key
    
    def set_log_level(self, level):
        """
        Set the logging level.

        :param level: Logging level. Should be "debug", "info", or "warning"
        :type level: string
        """
        if level not in ["debug", "info", "warning"]:
            self.logger.error("Can't set log level to %s. Should be "
                "'debug', 'info', or 'warning'")
            return
        if level == "debug":
            self.logger.setLevel(logging.DEBUG)
        elif level == "info":
            self.logger.setLevel(logging.INFO)
        elif level == "warning":
            self.logger.setLevel(logging.WARNING)

    def _check_poll_allowed(self):
        """
        Check for the existence of the Etcd key which prohibits polling.

        :return: True is polling is allowed, False otherwise.
        """
        return

    def start_command_watch(self):
        """
        Listen for commands on this F-Engines command key.
        Stop listening with `cancel_command_watch()`

        Internally, this method sets the `_etcd_watch_id` attribute to
        allow a watch to later be cancelled.
        """
        self.logger.info("Beginning command watch on key %s" % self.cmd_key)
        self._etcd_watch_id = self.ec.add_watch_prefix_callback(
                                  self.cmd_key,
                                  self._etcd_callback,
                              )

    def cancel_command_watch(self):
        """
        Stop listening for commands on this F-Engine's command key.

        Internally, this method sets the `_etcd_watch_id` attribute to `None`.
        """
        if self._etcd_watch_id is None:
            self.logger.info("Trying to stop a non-existent command watch")
        else:
            self.logger.info("Stopping command watch")
            self.ec.cancel_watch(self._etcd_watch_id)
            self._etcd_watch_id = None

    def _send_command_response(self, seq_id, processed_ok, response):
        """
        Respond to a received command with sequence ID `seq_id` on the
        command response etcd channel.

        :param seq_id: Sequence ID of the command to which we are responding.
        :type seq_id: int

        :param processed_ok: Flag indicating the response is an error if False.
        :type status: bool

        :param response: String response with which to respond. E.g.
            'out of range', or 'command accepted'. If the command returns data,
            this might be a json string of this data.
        :type response: string
        """
        if processed_ok:
            status = 'normal'
        else:
            status = 'error'
        resp = {
            'sequence_id': seq_id,
            'status': status,
            'response': response,
            'timestamp': time.time(),
        }
        resp_json = json.dumps(resp)
        try:
            self.ec.put(self.cmd_resp_key, resp_json)
        except:
            self.logger.error("Error trying to send ETCD command response")
            raise

    def _etcd_callback(self, watchresponse):
        """
        A callback executed whenever this block's command key is modified.
        
        This callback JSON decodes the key contents, and passes the
        resulting dictionary to ``_process_commands``.

        :param watchresponse: A WatchResponse object used by the etcd
            `add_watch_prefix_callback` as the calling argument.
        :type watchresponse: WatchResponse

        :return: True if command was processed successfully, False otherwise.
        """
        for event in watchresponse.events:
            self.logger.debug("Got command: %s" % event.value)
            try:
                command_dict = json.loads(event.value.decode())
            except json.JSONDecodeError:
                err = "JSON decode error"
                self.logger.error(err)
                # If decode fails, we don't even have a command ID, so send
                # an error with seq_id -1
                self._send_command_response(-1, False, err)
                return False
            self.logger.debug("Decoded command: %s" % command_dict)
            seq_id = command_dict.get("sequence_id", -1)
            if not isinstance(seq_id, int):
                err = "Sequence ID not integer"
                self.logger.error(err)
                self._send_command_response(-1, False, err)
                return False
            if seq_id < 0:
                self.warning("Sequence ID %d is suspicious" % seq_id)

            block = command_dict.get("block", None)
            if block is None:
                self.logger.error("Received block string with no 'block' key!")
                err = "Bad command format"
                self._send_command_response(seq_id, False, err)
                return False

            command = command_dict.get("command", None)
            if command is None:
                self.logger.error("Received command string with no 'command' key!")
                err = "Bad command format"
                self._send_command_response(seq_id, False, err)
                return False

            # Deal with a couple of special cases
            if block == "feng":
                if command in ["program", "get_fpga_stats", "configure_output"]:
                    block_obj = self.feng
                else:
                    self.logger.error("Received command invalid!")
                    err = "Command invalid"
                    self._send_command_response(seq_id, False, err)
                    return False
                cmd_method = getattr(block_obj, command)
            else:
                # Only allow commands to reference blocks which are in the Fengine.blocks dict
                if not block in self.feng.blocks:
                    self.logger.error("Received block %s not allowed!" % block)
                    err = "Wrong block"
                    self._send_command_response(seq_id, False, err)
                    return False
                else:
                    block_obj = self.feng.blocks[block]
                # Check command is valid
                if command.startswith("_"):
                    self.logger.error("Received command starting with underscore!")
                    err = "Command not allowed"
                    self._send_command_response(seq_id, False, err)
                    return False
                if not (hasattr(block_obj, command) and callable(getattr(block_obj, command))):
                    self.logger.error("Received command invalid!")
                    err = "Command invalid"
                    self._send_command_response(seq_id, False, err)
                    return False
                else:
                    cmd_method = getattr(block_obj, command)
            # Process command
            cmd_kwargs = command_dict.get("kwargs", {})
            ok = True
            try:
                resp = cmd_method(**cmd_kwargs)
            except TypeError:
                ok = False
                err = "Command arguments invalid"
                self.logger.exception(err)
            except:
                ok = False
                err = "Command failed"
                self.logger.exception(err)
            if not ok:
                self._send_command_response(seq_id, ok, err)
                self.logger.error("Responded to command '%s' (ID %d): %s" % (command, seq_id, err))
                return False
            try:
                if isinstance(resp, np.ndarray):
                    resp = resp.tolist()
                # Check we will be able to encode the response
                test_encode = json.dumps(resp)
            except:
                self.logger.exception("Failed to encode JSON")
                resp = "JSON_ERROR"
            self._send_command_response(seq_id, ok, resp)
            self.logger.info("Responded to command '%s' (ID %d): OK? %s" % (command, seq_id, ok))
            self.logger.debug("Responded to command '%s' (ID %d): %s" % (command, seq_id, resp))
            return ok

    #def poll_stats(self):
    #    """
    #    Poll all statistics and push to etcd.
    #    """
    #    if self.feng is None:
    #        self.logger.warning("F-Engine not initialized. Skipping polling")

    def __del__(self):
        self.cancel_command_watch()

    #def program(self, fpgfile, force=False):
    #    """
    #    Program an .fpg file to a SNAP2 FPGA. If the name of the file
    #    matches what is already in flash, this command will simply
    #    reboot the FPGA. If the name of the file doesn't match, the
    #    new bitstream will be uploaded. This will take <=5 minutes.

    #    :param fpgfile: The .fpg file to be loaded.
    #    :type fpgfile: str

    #    :param force: If True, write the firmware to flash even if the SNAP claims
    #        it is already loaded.
    #    :type force: boolean

    #    """

    #    if not isinstance(fpgfile, str):
    #        return False, "wrong type for fpgfile"
    #    if not isinstance(force, bool):
    #        return False, "wrong type for force"

    #    if not os.path.exists(fpgfile):
    #        return False, "Path %s doesn't exist" % fpgfile

    #    self.logger.info("Loading firmware %s to %s" % (fpgfile, self.fhost))
    #    # If no FENG is yet connected, try to connect to a raw CasperFpga
    #    # and then program it
    #    if self.feng is None:
    #        self.logger.debug("Using raw CasperFpga because no FEngine exists")
    #        try:
    #            fpga = snap2_fengine.casperfpga.CasperFpga(
    #                       self.fhost,
    #                       transport = snap2_fengine.casperfpga.TapcpTransport,
    #                   )
    #        except:
    #            self.logger.exception("Exception when connecting to board")
    #            return False, "Error during connection"
    #    else:
    #        fpga = self.feng.fpga

    #    try:
    #        fpga.transport.upload_to_ram_and_program(fpgfile, force=force)
    #    except:
    #        self.logger.exception("Exception when loading new firmware")
    #        return False, "Error during load"
    #    try:
    #        self.feng = snap2_fengine.Snap2Fengine(self.fhost)
    #    except:
    #        self.logger.exception("Exception when instantiating F-Engine after firmware load")
    #        return False, "Error after load"
    #    return True, "image loaded"

