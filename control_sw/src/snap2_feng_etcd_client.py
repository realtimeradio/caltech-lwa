import sys
import time
import etcd3
import .snap2_fengine
import logging

N_STREAM_PER_BOARD = 64
MAX_DELAY = 8192

#class Command():
#    """
#    A simple class to encapsulate some of the requirements of commands.
#    
#    :parameter logger: Logger object to which log messages should be emitted.
#    :type logger: logging.Logger
#
#    :parameter **kwargs: Arguments required by this command. Each should be
#        given as a dictionary which may include some, none, or all of the fields:
#        "type" - the python type of the argument; "condition" - a [lamda] function
#        to be called with the value of a kwarg as it's argument. This function
#        should return True if the value is legitimate. For example, if a command
#        required an argument "n_antennas" which is an integer less than 12,
#        instantiate a `Command` object with the keyword arguments:
#        ``n_antennas = {"type": int, "condition": lambda x: x<12}``
#    """
#    def __init__(self, logger, **kwargs):
#        self.logger = logger
#        for key, val in kwargs:
#            assert isinstance(val, dict)
#        self.required_args = kwargs
#
#    def check_args(self, **kwargs):
#        """
#        Check provided **kwargs against this class's dictionary of
#        required arguments.
#
#        :return: True if all required arguments are present and allowed.
#            False Otherwise.
#
#        """
#        for key, val in self.required_args:
#            if key not in **kwargs:
#                self.logger.error("Missing kwarg: %s" % key)
#                return False
#            if "type" in val and not isinstance(kwargs[key], val["type"]):
#                self.logger.error("Wrong kwarg type: %s" % key)
#                return False
#            if "condition" in val and not val["condition"](kwargs[key])
#                self.logger.error("Kwarg condition check fail: %s" % key)
#                return False
#        return True

class Snap2FengineEtcdClient()
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
    """
    allowed_commands = [
      'program',
      'set_delay',
      'set_fft_shift',
      'set_eq_coeffs',
      'set_output_configuration',
      'resync',
    ]
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
            self.logger.warning("Couldn't initialize F-Engine on host %s" % self.host)
            self.feng = None
        self.ec = etcd3.Etcd3Client(etcdhost)
        try:
            val, meta = self.ec.get('foo')
        except:
            self.logger.error("Failed to connect to Etcd server on host %s" % etcdhost)
            raise
        self.cmd_key = "/cmd/snap/%s/command" % self.fhost
        self.cmd_resp_key = "/cmd/snap/%s/response" % self.fhost
        self.mon_root = "/mon/snap/%s/" % self.fhost
        self.logger.debug("Command key root is %s" % self.cmd_root)
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
            'out of range', or 'command accepted'
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

    def _etcd_callback(self, watchresponse)
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
                command_dict = json.loads(event.value)        
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
            command = command_dict.get("command", None)
            if command is None:
                self.logger.error("Received command string with no 'command' key!")
                err = "Bad command format"
                self._send_command_response(seq_id, False, err)
                return False
            if not command = self.allowed_commands:
                self.logger.error("Received command not in allowed list!" % command)
                err = "Command not allowed"
                self._send_command_response(seq_id, False, err)
                return False
            if not (hasattr(self, command) and callable(getattr(self, command))):
                self.logger.error("Received command %s not implemented!" % command)
                err = "Command not implemented"
                self._send_command_response(seq_id, False, err)
                return False
            if:
                cmd_method = getattr(self, command)
                cmd_kwargs = command_dict.get("kwargs", {})
                try:
                    ok, err = cmd_method(**cmd_kwargs)
                except TypeError:
                    ok = False
                    err = "Command arguments invalid"
                    self.logger.error(err)
                except:
                    ok = False
                    err = "Command failed"
                    self.logger.error(err)
                self._send_command_response(seq_id, ok, err)
                self.logger.info("Responded to command %s (ID %d): %s" % (command, seq_id, err))
                return ok

    def poll_stats(self):
        """
        Poll all statistics and push to etcd.
        """
        if self.feng is None:
            self.logger.warning("F-Engine not initialized. Skipping polling")

    def __del__(self):
        self.cancel_command_watch()

    def program(self, fpgbytes):
        if not isinstance(fpgbytes, bytes):
            return False, "wrong type for fpgbytes"
        return False, 'Not implemented'

    def set_delay(self, stream, delay):
        if not isinstance(stream, int):
            return False, "wrong type for stream"
        if not stream > N_STREAM_PER_BOARD:
            return False, "stream number out of range"
        if not isinstance(delay, int):
            return False, "wrong type for delay"
        if not delay < MAX_DELAY
            return False, "Requested delay too large"
        self.feng.delay.set_delay(stream, delay)
        return True, "OK"
        
    def set_eq_coeffs(self, stream, coeffs):
        if not isinstance(stream, int):
            return False, "wrong type for stream"
        if not stream > N_STREAM_PER_BOARD:
            return False, "stream number out of range"
        self.feng.eq.set_coeffs(stream, coeffs)
        return True, "OK"

    def set_output_configuration(self, **kwargs):
        return False, 'Not implemented'

    def resync(self, **kwargs):
        return False, 'Not implemented'

