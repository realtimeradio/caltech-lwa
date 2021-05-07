import os
import sys
import time
import json
import threading
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

    :param noetcd: If True, don't actually use the etcd interface --
        just communicate with the SNAPs directly.
    :param noetcd: bool

    """
    def __init__(self, etcdhost="etcdv3service.sas.pvt", logger=None, noetcd=False):
        if logger is None:
            self.logger = logging.getLogger("Snap2FengineEtcd")
            stderr_handler = logging.StreamHandler(sys.stderr)
            self.logger.addHandler(stderr_handler)
            self.set_log_level("info")
        else:
            self.logger = logger

        self.noetcd = noetcd
        if not noetcd:
            # Connect to ETCD and ping the connection
            self.ec = etcd3.Etcd3Client(etcdhost)
            try:
                val, meta = self.ec.get('foo')
            except:
                self.logger.error("Failed to connect to Etcd server on host %s" % etcdhost)
                raise
        else:
            self.ec = None  
            self._fengs = {} #: List of active Fengine connections

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

    def _format_command(self, sequence_id, timestamp, block, cmd, kwargs={}):
        """
        Format a command to be sent via ETCD

        :param sequence_id: The ``id`` command field
        :type block: int

        :param timestamp: The ``timestamp`` command field
        :type timestamp: float

        :param block: The ``block`` command field
        :type block: str

        :param cmd: The ``cmd`` command field
        :type cmd: str

        :param kwargs: The ``kwargs`` command field
        :type kwargs: dict

        :return: JSON-encoded command string to be sent. Returns None if there
            is an enoding error.
        """
        command_dict = {
            "cmd": cmd,
            "val": {
                "block": block,
                "timestamp": timestamp,
                "kwargs": kwargs,
                },
            "id": sequence_id,
        }
        try:
            command_json = json.dumps(command_dict)
            return command_json
        except:
            self.logger.exception("Failed to JSON-encode command")
            return


    def send_command(self, fid, block, cmd, kwargs={}, timeout=10.0):
        """
        Send a command to a SNAP2

        :param fid: SNAP F-engine ID to which command should be sent.
        :type fid: int

        :param block: Block to which command applies.
        :type block: str

        :param cmd: Command to be sent
        :type cmd: str

        :param kwargs: Dictionary of key word arguments to be forwarded
            to the chosen command method
        :type kwargs: dict

        :param timeout: Time, in seconds, to wait for a response to the command.
        :type timeout: float

        :return: Dictionary of values, dependent on the command response.
        """
        if self.noetcd:
            return self._send_command_noetcd(fid, block, cmd, kwargs=kwargs)
        else:
            return self._send_command_etcd(fid, block, cmd, kwargs=kwargs, timeout=timeout)

    def _send_command_noetcd(self, fid, block, cmd, kwargs):
        """
        Send a command to a SNAP2

        :param fid: SNAP F-engine ID to which command should be sent.
        :type fid: int

        :param block: Block to which command applies.
        :type block: str

        :param cmd: Command to be sent
        :type cmd: str

        :param kwargs: Dictionary of key word arguments to be forwarded
            to the chosen command method
        :type kwargs: dict

        :return: Dictionary of values, dependent on the command response.
        """
        hostname = "snap%.2d" % fid
        if not hostname in self._fengs:
            self._fengs[hostname] = snap2_fengine.Snap2Fengine(hostname)
        feng = self._fengs[hostname]
        if block == "feng":
            block_obj = feng
        elif block not in feng.blocks:
            raise RuntimeError("Block %s doesn't exist" % block)
        else:
            block_obj = feng.blocks[block]
        if not (hasattr(block_obj, cmd) and callable(getattr(block_obj, cmd))):
            raise RuntimeError("Block %s doesn't have method %s" % (block, cmd))
        cmd_method = getattr(block_obj, cmd)
        try:
            return cmd_method(**kwargs)
        except TypeError:
            raise TypeError("Wrong command arguments")
        

    def _send_command_etcd(self, fid, block, cmd, kwargs={}, timeout=10.0):
        """
        Send a command to a SNAP2

        :param fid: SNAP F-engine ID to which command should be sent.
        :type fid: int

        :param block: Block to which command applies.
        :type block: str

        :param cmd: Command to be sent
        :type cmd: str

        :param kwargs: Dictionary of key word arguments to be forwarded
            to the chosen command method
        :type kwargs: dict

        :param timeout: Time, in seconds, to wait for a response to the command.
        :type timeout: float

        :return: Dictionary of values, dependent on the command response.
        """
        cmd_key = ETCD_CMD_ROOT + "%d" % fid
        resp_key = ETCD_RESP_ROOT + "%d" % fid
        timestamp = time.time()
        sequence_id = str(int(timestamp * 1e6))
        command_json = self._format_command(
                           sequence_id,
                           timestamp,
                           block,
                           cmd,
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
                resp_id = response_dict.get("id", None)
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
                status = self._response['val']['status']
                if status != 'normal':
                    self.logger.info("Command status returned: '%s'" % status)
                return self._response['val']['response']
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

    :param fid: SNAP ID, used to associate a service with an
        etcd key "/cmd/snap/<ID>".
    :type fid: int

    :param etcdhost: Hostname (or IP, in dotted quad notation)
        of target etcd server.
    :type etcdhost: string

    :param etcdport: Port on which etcd is served
    :type etcdport: int

    :param logger: Python `logging.Logger` instance to which
        this class's log messages should be emitted. If None,
        log to stderr
    :type logger: logging.Logger

    """

    def __init__(self, fhost, fid, etcdhost="etcdv3service.sas.pvt", etcdport=2379, logger=None):
        self.fhost = fhost
        self.fid = fid
        #: Set trigger to stop polling
        self._poll_stop_trigger = threading.Event()
        #: Flag indicating polling is ongoing
        self._is_polling = threading.Event()
        #: Set trigger to pause polling (while executing a command)
        self._poll_pause_trigger = threading.Event()
        #: Flag indicating polling has paused
        self._poll_is_paused = threading.Event()
        #: List of etcd watch IDs, used to kill watch processes
        self._etcd_watch_ids = []
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
            raise RuntimeError("Couldn't initialize F-Engine on host %s" % self.fhost)
        # If the SNAP isn't connected even though the instantiation worked, give up. TODO: be smarter
        try:
            is_connected = self.feng.is_connected()
        except:
            raise RuntimeError("Couldn't query SNAP connection status on host %s" % self.fhost)

        if not is_connected:
            raise RuntimeError("Couldn't connect to F-Engine on host %s" % self.fhost)

        self.ec = etcd3.Etcd3Client(host=etcdhost, port=etcdport)
        try:
            val, meta = self.ec.get('foo')
        except:
            self.logger.exception("Failed to connect to Etcd server on host %s" % etcdhost)
            raise
        self.cmd_key = ETCD_CMD_ROOT + "%d" % self.fid
        self.cmd_resp_key = ETCD_RESP_ROOT + "%d" % self.fid
        self.mon_key = ETCD_MON_ROOT + "%d" % self.fid
        self.logger.debug("Command key is %s" % self.cmd_key)
        self.logger.debug("Command response key is %s" % self.cmd_resp_key)
        self.logger.debug("Monitor key root is %s" % self.mon_key)

    def is_polling(self):
        """
        :return: True if the baground status polling thread is currently running.
            False otherwise.
        :rtype: bool
        """
        return self._is_polling.is_set()

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
        Listen for commands on this F-Engine's command key, as well as the
        "all SNAPs" key.
        Stop listening with `stop_command_watch()`

        Internally, this method sets the `_etcd_watch_ids` attribute to
        allow a watch to later be cancelled.
        """
        self.logger.info("Beginning command watch on key %s" % self.cmd_key)
        self._etcd_watch_ids += [self.ec.add_watch_prefix_callback(
                                  self.cmd_key,
                                  self._etcd_callback,
                                 )]
        # Also watch on the "all SNAPs" key
        self._etcd_watch_ids += [self.ec.add_watch_prefix_callback(
                                  ETCD_CMD_ROOT + "/0",
                                  self._etcd_callback,
                                )]

    def stop_command_watch(self):
        """
        Stop listening for commands on this F-Engine's command key, as well
        as the "all SNAPs" key.

        Internally, this method sets the `_etcd_watch_ids` attribute to `[]`.
        """
        if self._etcd_watch_ids == []:
            self.logger.info("Trying to stop a non-existent command watch")
        else:
            self.logger.info("Stopping command watch")
            for watch_id in self._etcd_watch_ids:
                self.ec.cancel_watch(watch_id)
            self._etcd_watch_ids = []

    def _send_command_response(self, seq_id, processed_ok, response):
        """
        Respond to a received command with sequence ID `seq_id` on the
        command response etcd channel.

        :param seq_id: Sequence ID of the command to which we are responding.
        :type seq_id: string

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
            'id': seq_id,
            'val': {
                'status': status,
                'response': response,
                'timestamp': time.time(),
            }
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
                # an error with seq_id "Unknown"
                self._send_command_response("Unknown", False, err)
                return False
            self.logger.debug("Decoded command: %s" % command_dict)

            for field in ["id", "cmd", "val"]:
                if not field in command_dict:
                    err = "No '%s' field in message" % field
                    self.logger.error(err)
                    self._send_command_response("Unknown", False, err)
                    return False

            seq_id = command_dict.get("id", "Unknown")
            if not isinstance(seq_id, str):
                err = "Sequence ID not string"
                self.logger.error(err)
                self._send_command_response("Unknown", False, err)
                return False

            try:
                block = command_dict["val"].get("block", None)
            except:
                block = None
            if block is None:
                self.logger.error("Received val string with no 'block' key!")
                err = "Bad command format"
                self._send_command_response(seq_id, False, err)
                return False

            command = command_dict.get("cmd", None)
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
            cmd_kwargs = command_dict["val"].get("kwargs", {})
            ok = True
            try:
                if self.is_polling():
                    self._poll_pause_trigger.set()
                    self._poll_is_paused.wait(timeout=10)
                resp = cmd_method(**cmd_kwargs)
                self._poll_pause_trigger.clear()
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
                self.logger.error("Responded to command '%s' (ID %s): %s" % (command, seq_id, err))
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
            self.logger.info("Responded to command '%s' (ID %s): OK? %s" % (command, seq_id, ok))
            self.logger.debug("Responded to command '%s' (ID %s): %s" % (command, seq_id, resp))
            return ok

    def poll_stats(self):
        """
        Poll all statistics and push to etcd.

        """
        if self.feng is None:
            self.logger.warning("F-Engine not initialized. Skipping polling")
            time.sleep(10)
        try:
            stats, flags = self.feng.get_status_all()
            etcd_dict = {
                    "stats": stats,
                    "flags": flags,
                    "timestamp": time.time()
                    }
        except:
            self.logger.exception("Error polling stats")
            return
        try:
            etcd_dict_json = json.dumps(etcd_dict)
        except:
            self.logger.exception("Error JSON-encoding poll data")
            return
        try:
            self.ec.put(self.mon_key, etcd_dict_json)
        except:
            self.logger.exception("Error pushing poll data to etcd")
            return

    def start_poll_stats_loop(self, pollsecs=10):
        """
        Start a loop, calling ``poll_stats`` every ``pollsecs`` seconds.
        Internally, this method launches a background thread to poll
        for stats, and sets the ``_is_polling`` Event attribute.
        Stop polling with ``stop_poll_stats_loop()``.
        Check for current polling state with ``is_polling()``.

        :param pollsecs: Number of seconds between poll loops.
        :type pollsecs: float

        """
        def poll_loop():
            self.logger.info("Starting stats poll loop")
            while(True):
                self._is_polling.set()
                if self._poll_stop_trigger.is_set():
                    self.logger.info("Stopping stats poll loop")
                    self._is_polling.clear()
                    break
                if not self._poll_pause_trigger.is_set():
                    self.logger.info("Polling stats at %s" % time.ctime())
                    self.poll_stats()
                if self._poll_pause_trigger.is_set():
                    self._poll_is_paused.set()
                time.sleep(pollsecs)
                self._poll_is_paused.clear()

        self._poll_stop_trigger.clear()
        poll_thread = threading.Thread(name='poll_loop', target=poll_loop)
        poll_thread.start()

    def stop_poll_stats_loop(self):
        """
        Stop the background polling loop. Will block until the polling
        loop has closed gracefully.
        """
        self.logger.info("Triggering stats polling loop stop")
        self._poll_stop_trigger.set()
        while self.is_polling():
            time.sleep(0.5)


    def __del__(self):
        self.stop_poll_stats_loop()
        self.stop_command_watch()

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

