Control Interface
=================

Overview
--------

A Python class ``Snap2Fengine`` is provided to encapsulate control
of individual blocks in the firmware DSP pipeline.
The structure of the software interface aims to mirror the hierarchy of
the firmware modules, through the use of multiple ``Block`` class instances,
each of which encapsulates control of a single module in the firmware pipeline.

In testing, and interactive debugging, the ``Snap2Fengine`` class provides
an easy way to probe board status for a SNAP2 board on the local network.

In order to integrate with the larger LWA352 control framework,
control and monitoring of multiple F-Engines can also be carried out through
the passing of JSON-encoded messages through an ``etcd``\  [1]_
key-value store.
This mechanismi, shown in :numref:`control_top`,
utilizes the Python class ``Snap2FengineEtcdClient`` to
translate commands and responses between the ``etcd`` format and the
underlying ``Snap2Fengine`` method calls.


.. figure:: _static/figures/control_top_level-crop.pdf
    :align: center
    :scale: 50%
    :name: control_top

    The top-level control architecture. 


``Snap2Fengine`` Python Interface
---------------------------------

The ``Snap2Fengine`` class can be instantiated and used to control
a single SNAP2 board running LWA's F-Engine firmware. An example is below:


.. code-block:: python

  # Import the SNAP2 F-Engine library
  from lwa_f import snap2_fengine

  # Instantiate a Snap2Fengine instance to a board with
  # hostname 'snap2-rev2-11'
  f = snap2_fengine.Snap2Fengine('snap2-rev2-11')

  # Program a board (if it is not already programmed)
  # and initialize all the firmware blocks
  if not f.fpga.is_programmed():
    f.program() # Load whatever firmware is in flash
    # Wait 30 seconds for the board to reboot...
    # Initialize firmware blocks, including ADC link training
    f.initialize(read_only=False)

  # Blocks are available as items in the Snap2Fengine `blocks`
  # dictionary, or can be accessed directly as attributes
  # of the Snap2Fengine.

  # Print available block names
  print(sorted(f.blocks.keys()))
  # Returns:
  # ['adc', 'autocorr', 'corr', 'delay', 'eq', 'eq_tvg', 'eth',
  # 'fpga', 'input', 'noise', 'packetizer', 'pfb', 'reorder', 'sync']

  # Grab some ADC data from the ADC card(s) on FMC 1
  adc_data = f.adc.get_snapshot_interleaved(1, signed=True)
  print(adc_data.shape) # returns (32 [channels], 512 [time samples]

Details of the methods provided by individual blocks are given in the next
section.


Top-Level Control
+++++++++++++++++

The Top-level ``Snap2Fengine`` instance can be used to perform high-level
control of the firmware, such as programming and de-programming FPGA boards.
It can also be used to apply configurations which affect multiple firmware
subsystems, such as configuring channel selection and packet destination.

Finally, a ``Snap2Fengine`` instance can be used to initialize, or get status
from, all underlying firmware modules.

.. autoclass:: lwa_f.snap2_fengine.Snap2Fengine
  :no-show-inheritance:
  :members:

FPGA Control
++++++++++++

The ``FPGA`` control interface allows gathering of FPGA statistics such
as temperature and voltage levels. Its methods are functional regardless of
whether the FPGA is programmed with an LWA F-Engine firmware design.

.. autoclass:: lwa_f.blocks.fpga.Fpga
  :no-show-inheritance:
  :members:

Timing Control
++++++++++++++

The ``Sync`` control interface provides an interface to configure and monitor the
multi-SNAP2 timing distribution system.

.. autoclass:: lwa_f.blocks.sync.Sync
  :no-show-inheritance:
  :members:

ADC Control
+++++++++++

The ``Adc`` control interface allows link training (aka "calibration") of
the ADC->FPGA data link.

.. autoclass:: lwa_f.blocks.adc.Adc
  :no-show-inheritance:
  :members:

Input Control
+++++++++++++

.. autoclass:: lwa_f.blocks.input.Input
  :no-show-inheritance:
  :members:

Noise Generator Control
+++++++++++++++++++++++

.. autoclass:: lwa_f.blocks.noisegen.NoiseGen
  :no-show-inheritance:
  :members:


Delay Control
+++++++++++++

.. autoclass:: lwa_f.blocks.delay.Delay
  :no-show-inheritance:
  :members:


PFB Control
+++++++++++

.. autoclass:: lwa_f.blocks.pfb.Pfb
  :no-show-inheritance:
  :members:


Auto-correlation Control
++++++++++++++++++++++++

.. autoclass:: lwa_f.blocks.autocorr.AutoCorr
  :no-show-inheritance:
  :members:


Correlation Control
+++++++++++++++++++

.. autoclass:: lwa_f.blocks.corr.Corr
  :no-show-inheritance:
  :members:

Post-FFT Test Vector Control
++++++++++++++++++++++++++++

.. autoclass:: lwa_f.blocks.eqtvg.EqTvg
  :no-show-inheritance:
  :members:

Equalization Control
++++++++++++++++++++

.. autoclass:: lwa_f.blocks.eq.Eq
  :no-show-inheritance:
  :members:

Channel Selection Control
+++++++++++++++++++++++++

.. autoclass:: lwa_f.blocks.chanreorder.ChanReorder
  :no-show-inheritance:
  :members:

Packetization Control
+++++++++++++++++++++

.. autoclass:: lwa_f.blocks.packetizer.Packetizer
  :no-show-inheritance:
  :members:

Ethernet Output Control
+++++++++++++++++++++++

.. autoclass:: lwa_f.blocks.eth.Eth
  :no-show-inheritance:
  :members:




``etcd`` Interface
------------------

The ``etcd`` F-Engine interface provides a mechanism to control multiple
SNAP2 boards running F-Engine firmware via the passing of messages through
an ``etcd`` key-value store.

In order to use the ``etcd`` control interface, a daemon
``Snap2FengineEtcdClient`` instance is required to be running on
a server with network access to the SNAP2 hardware being controlled.

Key Organization
++++++++++++++++

For an F-Engine running on a SNAP2 ``hostname``, there are three relevant
``etcd`` key paths.

Command
^^^^^^^

The command key is:

``/cmd/snap/<id>``

``id`` is the one-indexed ID number of the SNAP board which should respond
to these commands. Commands issues to ``id=0`` are processed by all SNAP boards.

Writing messages to this key results in the execution of ``Snap2Fengine``
command methods.

Response
^^^^^^^^

Each command written to the command key will elicit a response published
to the key:

``/resp/snap/<id>``

The response message will indicate the success of failure of the command,
and may contain a command-dependent data payload. For example, a spectra, or
snapshot of ADC samples.

Monitor
^^^^^^^

In addition to the command/response interface described above, a set of basic status values
are continuously-polled and written to etcd. This allows basic monitoring scripts to simply
watch the etcd keystore to determine system health, rather than having to issue commands.

Each SNAP board reports monitor information to the key:

``/mon/snap/<id>``

The monitor key is indended to be continuously updated on a ~1 second time cadence,
and contains low data-volume status information. For example, FPGA temperature,
ADC RMS, number of transmitted Ethernet packets, and similar.


Command/Response Protocol
+++++++++++++++++++++++++

The Command/Response protocol is designed to be a simple interface to the
underlying ``Snap2Fengine`` control class.
It will naturally extend as the control class functionality is expanded.

A simple example of a control client is implemented in the
``Snap2FengineEtcdControl`` class, which is used for internal testing.

Command Format
^^^^^^^^^^^^^^

Commands sent to the command key are JSON-encoded dictionaries, and should
have the following fields:

.. list-table::
    :widths: 20 20 60
    :header-rows: 1

    * - Field
      - Type
      - Description

    * - id
      - string
      - A unique string associated with this   
        command, used to identify the command's
        response

    * - cmd
      - string
      - Command name

    * - val
      - dictionary
      - A dictionary containing keys:
          - time (string) The time these statistics were gathered, in ISO 3339 format.
          - block (string): The firmware block name to which this command applies.
          - kwargs (dictionary): Dictionary of arguments required by the ``block.command`` method.

Allowed values for **``block``** are any of the keys in the ``Snap2Fengine``
blocks attribute. I.e.:

.. code-block:: python

  from lwa_f import snap2_fengine
  f = snap2_fengine.Snap2Fengine('snap2-rev2-11')
  for block in sorted(f.blocks.keys()): print(block)
  adc
  autocorr
  corr
  delay
  eq
  eq_tvg
  eth
  input
  noise
  packetizer
  pfb
  reorder
  sync


Allowed values for **``cmd``** are any of the methods which can be called
against ``Snap2Fengine.blocks[block]``.
For example, for the ``delay`` block, allowed commands are:

  - ``get_max_delay``
  - ``set_delay``
  - ``get_delay``
  - ``initialize``
  - ``get_status``

All blocks are instances of the generic ``Block`` class, and thus it is also
possible to call parent class methods such as ``read_uint`` and ``write_uint``.
These directly manipulate FPGA registers, and should be used with caution.

The **``kwargs``** field should contain any arguments required by the command
method being called.
For example, the Fengine ``delay`` block's ``set_delay`` method requires
a ``stream`` argument (to select which of the 64 SNAP2 data streams is being
manipulated) and a ``delay`` argument (to set the delay for this stream).

As such, in order to set the delay of data stream ``5`` to ``100`` adc samples,
a command should be issued with:

  +--------------+-------------------------------------+
  | Field        | Value                               |
  +==============+=====================================+
  | ``cmd``      | ``"set_delay"``                     |
  +--------------+-------------------------------------+
  | ``val``      | ``{block: "delay", kwargs:          |
  |              | {"stream": 5, "delay": 100}``       |
  +--------------+-------------------------------------+

An example of a valid command JSON string, issued with the above parameters
at UNIX time 1618060712.60 and with ``id="1"`` is:

``'{"cmd": "set_delay", "val": {"block": "delay", "timestamp": 1618060712.6, "kwargs": {"stream": 5, "delay": 100}}, "id": "1"}'``

Consult the ``Snap2Fengine`` API details for a list of commands and their arguments.


Response Format
^^^^^^^^^^^^^^^

Every command sent elicits the writing of JSON-encoded dictionary to the
response key.
This dictionary has the following fields:

.. list-table::
    :widths: 20 20 60
    :header-rows: 1

    * - Field
      - Type
      - Description

    * - id
      - string
      - A string matching the ``id`` field of
        the command string to which this is a
        response

    * - val
      - dictionary
      - A dictionary containing keys:
          - timestamp (float) The UNIX time when this response was issued.
          - status (string): The string "normal" if the corresponding command was processed without error,
            or "error" if it was not.
          - response (dictionary): The response of the command method, as
            determined by the command API. If a method would usually return a numpy
            array, when using the ``etcd`` interface the response will be a list.
            In the event that the status field is ``"error"``, The response field will
            contain an error message string.

Not all ``Snap2Fengine`` methods return values, in whice case the response
field is ``null``.
The previous command example (setting a delay) results in the underlying API call
``Snap2Fengine.blocks['delay'].set_delay(5,100)`` which returns ``None``.
The response to the example command (assuming processing the command took
0.2 milliseconds) is thus:

  +-----------------+-----------------------------------------------------------------+
  | Field           | Value                                                           |
  +=================+=================================================================+
  | ``id``          | ``"1"``                                                         |
  +-----------------+-----------------------------------------------------------------+
  | ``val``         | ``{timestamp: 1618060712.8, status: "normal", response: null}`` |
  +-----------------+-----------------------------------------------------------------+

or, in JSON-encoded form:

``'{"id": "1", "val": {"timestamp": 1618060712.8, "status": "normal", "response": null}}'``

If the response ``status`` field is "error", common ``response`` error messages,
and their meanings are:

+-----------------------------+----------------------------------------------+
| "JSON decode error"         | Command string could not be JSON-decoded.    |
+=============================+==============================================+
| "Sequence ID not string"    | Sequence ID was not provided in the command  |
|                             | string or decoded to a non-string value.     |
+-----------------------------+----------------------------------------------+
| "Bad command format"        | Received command did not comply with         |
|                             | formatting specifications. E.g. was missing  |
|                             | a required field such as ``block`` or        |
|                             | ``cmd``.                                     |
+-----------------------------+----------------------------------------------+
| "Command invalid"           | Received command doesn't exist in the        |
|                             | ``Snap2Fengine`` API, or is prohibited for   |
|                             | ``etcd`` access.                             |
+-----------------------------+----------------------------------------------+
| "Wrong block"               | ``block`` field of the command decoded to a  |
|                             | block which doesn't exist.                   |
+-----------------------------+----------------------------------------------+
| "Command arguments invalid" | ``kwargs`` key contained missing, or         |
|                             | unexpected keys.                             |
+-----------------------------+----------------------------------------------+
| "Command failed"            | The underlying ``Snap2Fengine`` API call     |
|                             | raised an exception.                         |
+-----------------------------+----------------------------------------------+

In the event that a command fails, more information is available in the
``Snap2FengineEtcdClient`` daemon logs.

Monitoring Interface
~~~~~~~~~~~~~~~~~~~~

The monitor key contains a nested dictionary with the following keys:

.. list-table::
    :widths: 20 20 60
    :header-rows: 1

    * - Field
      - Type
      - Description

    * - timestamp
      - float
      - The UNIX timestamp at which the monitor key was last updated.

    * - stats
      - dictionary
      - A nested dictionary containing status values, keyed first by block name 
        (eg. ``delay``, ``eq`` or ``corr``) and then by status key.

    * - flags
      - dictionary
      - A nested dictionary containing status values, keyed first by block name 
        (eg. ``delay``, ``eq`` or ``corr``) and then by status key. This dictionary
        contains a subset of the keys present in the ``stats`` field.
        Where they exist, a value associated with a key indicates whether the
        corresponding value in the ``stats`` dictionary is out of normal range.
        Values in the flags dictionary are interpretted as in ``error_levels.py``; i.e.:

          - 0: Value is OK
          - 1: Value is different from operational normal
          - 2: Value is outside expected range
          - 3: Value represents an error condition

Entries in the ``stats`` dictionary are shown below

.. table::
    :widths: 20 20 20 40

    +-----------------+------------------------+--------+------------------------------------+
    | Dictionary Key  | Dictionary sub-key     | type   | Description                        |
    +=================+========================+========+====================================+
    | autocorr        | acc_len                | int    | Accumulation length, in spectra,   |
    |                 |                        |        | of the internal autocorrelation    |
    |                 |                        |        | module.                            |
    +-----------------+------------------------+--------+------------------------------------+
    | corr            | acc_len                | int    | Accumulation length, in spectra,   |
    |                 |                        |        | of the internal correlation        |
    |                 |                        |        | module.                            |
    +-----------------+------------------------+--------+------------------------------------+
    | delay           | delay``n``             | int    | Delay of each of the ``n`` data    |
    |                 |                        |        | streams.                           |
    +-----------------+------------------------+--------+------------------------------------+
    | delay           | maxdelay               | int    | The maximum delay supported by the |
    |                 |                        |        | firmware.                          |
    +-----------------+------------------------+--------+------------------------------------+
    | eq              | binary_point           | int    | The position of the EQ coefficient |
    |                 |                        |        | binary point                       |
    +-----------------+------------------------+--------+------------------------------------+
    | eq              | width                  | int    | The bit width of the EQ            |
    |                 |                        |        | coefficients                       |
    +-----------------+------------------------+--------+------------------------------------+
    | eq              | clip_count             | int    | The number of clips when           |
    |                 |                        |        | requantizing spectra to 4-bit.     |
    |                 |                        |        | This counter resets every [TODO:   |
    |                 |                        |        | when??]                            |
    +-----------------+------------------------+--------+------------------------------------+
    | eq              | coefficients``n``      | list   | The currently loaded coefficients, |
    |                 |                        | (int)  | in integer form (i.e.,             |
    |                 |                        |        | interpretted with all bits above   |
    |                 |                        |        | the binary point)                  |
    +-----------------+------------------------+--------+------------------------------------+
    | eq_tvg          | tvg_enabled            | bool   | True if the post- FFT test vector  |
    |                 |                        |        | generator is enabled. False        |
    |                 |                        |        | otherwise.                         |
    +-----------------+------------------------+--------+------------------------------------+
    | eth             | tx_ctr                 | int    | Running count of number of packets |
    |                 |                        |        | transmitted.                       |
    +-----------------+------------------------+--------+------------------------------------+
    | eth             | tx_err                 | int    | Running count of number of packet  |
    |                 |                        |        | errors detected.                   |
    +-----------------+------------------------+--------+------------------------------------+
    | eth             | tx_full                | int    | Running count of number of         |
    |                 |                        |        | transmission buffer overflow       |
    |                 |                        |        | events.                            |
    +-----------------+------------------------+--------+------------------------------------+
    | eth             | tx_vld                 | int    | Running count of number of 256-bit |
    |                 |                        |        | words transmitted.                 |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | flash_firmware         | string | The current .fpg bitstream file    |
    |                 |                        |        | stored in flash memory             |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | flash_firmware_md5     | int    | The MD5 checksum of the .fpg       |
    |                 |                        |        | bitstream stored in flash          |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | host                   | string | The hostname of the SNAP2 board    |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | programmed             | bool   | True if the board appears to be    |
    |                 |                        |        | running DSP firmware. False        |
    |                 |                        |        | otherwise.                         |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | serial                 | string | A notional "serial number" of this |
    |                 |                        |        | hardware. Not yet implemented.     |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | sw_version             | string | The software version of the        |
    |                 |                        |        | ``lwa_f`` python library currently |
    |                 |                        |        | in use                             |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | sys_mon                | string | "reporting" if the current         |
    |                 |                        |        | firmware has a working system      |
    |                 |                        |        | monitor module. "not reporting" if |
    |                 |                        |        | no monitoring is available.        |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | temp                   | float  | FPGA junction temperature, in      |
    |                 |                        |        | degrees C, reported by system      |
    |                 |                        |        | monitor (if available)             |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | vccaux                 | float  | Voltage of the VCCAUX FPGA power   |
    |                 |                        |        | rail reported by system monitor    |
    |                 |                        |        | (if available)                     |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | vccbram                | float  | Voltage of the VCCBRAM FPGA power  |
    |                 |                        |        | rail reported by system monitor    |
    |                 |                        |        | (if available)                     |
    +-----------------+------------------------+--------+------------------------------------+
    | feng            | vccint                 | float  | Voltage of the VCCINT FPGA power   |
    |                 |                        |        | rail reported by system monitor    |
    |                 |                        |        | (if available)                     |
    +-----------------+------------------------+--------+------------------------------------+
    | input           | mean``n``              | float  | Mean of ADC sample values for      |
    |                 |                        |        | input ADC ``n``.                   |
    +-----------------+------------------------+--------+------------------------------------+
    | input           | rms``n``               | float  | RMS of ADC sample values for input |
    |                 |                        |        | ADC ``n``.                         |
    +-----------------+------------------------+--------+------------------------------------+
    | input           | power``n``             | float  | Mean of squares of ADC sample      |
    |                 |                        |        | values for input ADC ``n``.        |
    +-----------------+------------------------+--------+------------------------------------+
    | input           | switch_position``n``   | string | Switch position for input data     |
    |                 |                        |        | stream ``n``. ``noise`` for        |
    |                 |                        |        | internal noise generators, ``adc`` |
    |                 |                        |        | for analog inputs, ``zero`` for    |
    |                 |                        |        | zero.                              |
    +-----------------+------------------------+--------+------------------------------------+
    | noise           | noise_core00_seed      | int    | Seed value for internal noise      |
    |                 |                        |        | generator 0.                       |
    +-----------------+------------------------+--------+------------------------------------+
    | noise           | noise_core01_seed      | int    | Seed value for internal noise      |
    |                 |                        |        | generator 1.                       |
    +-----------------+------------------------+--------+------------------------------------+
    | noise           | noise_core02_seed      | int    | Seed value for internal noise      |
    |                 |                        |        | generator 2.                       |
    +-----------------+------------------------+--------+------------------------------------+
    | noise           | output_assignment``n`` | int    | Noise source (0 - 5) currently     |
    |                 |                        |        | assigned to data stream ``n``.     |
    +-----------------+------------------------+--------+------------------------------------+
    | pfb             | fft_shift              | int    | Currently loaded FFT shift         |
    |                 |                        |        | schedule.                          |
    +-----------------+------------------------+--------+------------------------------------+
    | pfb             | overflow_count         | int    | Running count of FFT overflow      |
    |                 |                        |        | events.                            |
    +-----------------+------------------------+--------+------------------------------------+
    | sync            | ext_count              | int    | Running count of number of         |
    |                 |                        |        | external sync pulses received      |
    |                 |                        |        | since FPGA was programmed.         |
    +-----------------+------------------------+--------+------------------------------------+
    | sync            | int_count              | int    | Running count of number of         |
    |                 |                        |        | internal sync pulses received      |
    |                 |                        |        | since FPGA was programmed.         |
    +-----------------+------------------------+--------+------------------------------------+
    | sync            | period_fpga_clks       | int    | Detected period of external sync   |
    |                 |                        |        | pulses in units of FPGA clock      |
    |                 |                        |        | cycles.                            |
    +-----------------+------------------------+--------+------------------------------------+
    | sync            | uptime_fpga_clks       | int    | Number of FPGA clock ticks since   |
    |                 |                        |        | the FPGA was last programmed       |
    +-----------------+------------------------+--------+------------------------------------+


.. [1]
   See `etcd.io <etcd.io>`__
