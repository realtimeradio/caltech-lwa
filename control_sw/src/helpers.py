import logging
import logging.handlers
import sys
import time
import redis
import json
import socket
import struct

'''
A Redis-based log handler from:
http://charlesleifer.com/blog/using-redis-pub-sub-and-irc-for-error-logging-with-python/
'''

logger = logging.getLogger(__name__)
NOTIFY = logging.INFO + 1
logging.addLevelName(NOTIFY, "NOTIFY")

IS_INITIALIZED_ATTR = "_hera_has_default_handlers"

class RedisHandler(logging.Handler):
    def __init__(self, channel, conn, *args, **kwargs):
        logging.Handler.__init__(self, *args, **kwargs)
        self.channel = channel
        self.redis_conn = conn

    def emit(self, record):
        attributes = [
            'name', 'msg', 'levelname', 'levelno', 'pathname', 'filename',
            'module', 'lineno', 'funcName', 'created', 'msecs', 'relativeCreated',
            'thread', 'threadName', 'process', 'processName',
        ]
        record_dict = dict((attr, getattr(record, attr)) for attr in attributes)
        record_dict['formatted'] = self.format(record)
        try:
            self.redis_conn.publish(self.channel, json.dumps(record_dict))
        except UnicodeDecodeError:
            self.redis_conn.publish(self.channel, 'UnicodeDecodeError on emit!')
        except redis.RedisError:
            pass

class HeraMCHandler(logging.Handler):
    def __init__(self, subsystem, *args, **kwargs):
        from hera_mc import mc
        from astropy.time import Time
        self.Time = Time
        logging.Handler.__init__(self, *args, **kwargs)
        self.subsystem = subsystem
        db = mc.connect_to_mc_db(None)
        self.session = db.sessionmaker()

    def emit(self, record):
        # Re-code level because HeraMC logs 1 as most severe, and python logging calls critical:50, debug:10
        severity = max(1, 100 / record.levelno)
        message = self.format(record)
        logtime = self.Time(time.time(), format="unix")
        self.session.add_subsystem_error(logtime, self.subsystem, severity, message)
            
def log_notify(log, message=None):
    msg = message or "%s starting on %s" % (log.name, socket.gethostname())
    log.log(NOTIFY, msg)
            
    
def add_default_log_handlers(logger, redishostname='redishost', fglevel=logging.INFO, bglevel=NOTIFY, include_mc=False, mc_level=logging.WARNING):
    if getattr(logger, IS_INITIALIZED_ATTR, False):
        return logger
    setattr(logger, IS_INITIALIZED_ATTR, True)

    logger.setLevel(logging.DEBUG)
    logger.propagate = False

    formatter = logging.Formatter('%(asctime)s - %(name)20s - %(levelname)s - %(message)s')

    stream_handler = logging.StreamHandler(stream=sys.stdout)
    stream_handler.setLevel(fglevel)
    stream_handler.setFormatter(formatter)
    logger.addHandler(stream_handler)

    syslog_handler = logging.handlers.SysLogHandler(address='/dev/log')
    syslog_handler.setLevel(bglevel)
    syslog_handler.setFormatter(formatter)
    logger.addHandler(syslog_handler)

    if include_mc:
        try:
            mc_handler = HeraMCHandler("correlator")
            mc_handler.setLevel(mc_level)
            mc_handler.setFormatter(formatter)
            logger.addHandler(mc_handler)
        except:
            logger.warn("Failed to add HERA MC log handler")
            logger.exception(sys.exc_info()[0])

    redis_host = redis.StrictRedis(redishostname, socket_timeout=1)
    try:
        redis_host.ping()
    except redis.ConnectionError:
        logger.warn("Couldn't connect to redis server at %s"%redishostname)
        return logger

    redis_handler = RedisHandler('log-channel', redis_host)
    redis_handler.setLevel(bglevel)
    redis_handler.setFormatter(formatter)
    logger.addHandler(redis_handler)
    return logger

def snap_part_to_host_input(part):
    """
    Given a part string, eg. 'e2>SNP008', return the hostname of the snap board
    and the antenna number 0-2.
    eg, returns "heraNode1Snap2", 0
    """
    adc, name = part.split('>')
    # convert the string adc (eg "e2") into a channel number 0-2
    adc_num = int(adc[1:]) // 2 # divide by 2 because ADC is in demux 2
    # convert the name into something which should be a hostname.
    # name has the form SNPA0000123. Hostnames have the form herasnapA123
    # Edit 16 Sep 2019 -- This isn't true anymore. CM names and hostnames are now the same
    hostname = name#"herasnap%s" % (name[3] + name[4:].lstrip('0'))
    try:
        true_name, aliases, addresses = socket.gethostbyaddr(hostname)
    except:
        logger.error('Failed to gethostbyname for host %s' % hostname)
    # assume that the one we want is the last thing in the hosts file line
    return aliases[-1], adc_num
    

def cminfo_compute():
    """
    Use hera_mc's get_cminfo_correlator method to build a dictionary
    of pam/fem/ant/snap mappings.
    Requires hera_mc.
    """
    from hera_mc import cm_sysutils 
    h = cm_sysutils.Handling()
    cminfo = h.get_cminfo_correlator()
    snap_to_ant = {}
    ant_to_snap = {}
    for antn, ant in enumerate(cminfo['antenna_numbers']):
        name = cminfo['antenna_names'][antn]
        for pol in cminfo['correlator_inputs'][antn]:
            if pol.startswith('e'):
                e_pol = pol
            if pol.startswith('n'):
                n_pol = pol
        ant_to_snap[ant] = {}
        if e_pol != 'None':
            snapi_e, channel_e = snap_part_to_host_input(cminfo['correlator_inputs'][antn][0])
            ant_to_snap[ant]['e'] = {'host': snapi_e, 'channel': channel_e}
            if snapi_e not in snap_to_ant.keys():
                snap_to_ant[snapi_e] = [None] * 6
            snap_to_ant[snapi_e][channel_e] = name + 'E'
        if n_pol != 'None':
            snapi_n, channel_n = snap_part_to_host_input(cminfo['correlator_inputs'][antn][1])
            ant_to_snap[ant]['n'] = {'host': snapi_n, 'channel': channel_n}
            if snapi_n not in snap_to_ant.keys():
                snap_to_ant[snapi_n] = [None] * 6
            snap_to_ant[snapi_n][channel_n] = name + 'N'
    return snap_to_ant, ant_to_snap

def hera_antpol_to_ant_pol(antpol):
    antpol = antpol.lower().lstrip('h')
    pol = antpol[-1]
    ant = int(antpol[:-1])
    return ant, pol

def write_maps_to_redis(redishost='redishost'):
    if isinstance(redishost, str):
        redishost = redis.Redis(redishost)
    snap_to_ant, ant_to_snap = cminfo_compute()
    redhash = {'snap_to_ant':json.dumps(snap_to_ant), 'ant_to_snap':json.dumps(ant_to_snap)}
    redhash['update_time'] = time.time()
    redhash['update_time_str'] = time.ctime(redhash['update_time'])
    redishost.hmset('corr:map', redhash)

def read_maps_from_redis(redishost='redishost'):
    if isinstance(redishost, str):
        redishost = redis.Redis(redishost)
    if not redishost.exists('corr:map'):
        return None
    x = redishost.hgetall('corr:map')
    x['update_time'] = float(x['update_time'])
    x['ant_to_snap'] = json.loads(x['ant_to_snap'])
    x['snap_to_ant'] = json.loads(x['snap_to_ant'])
    return x
