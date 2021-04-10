Output Data Formats
===================

This section defines the output packet formats for each of the pipeline
output data products. Unless otherwise specified, all data products are
transmitted in network- (i.e. big-) endian format.

Packet sizing is partially determined by the pipeline configuration.
Specifically:

-  ``NCHAN`` – The number of channels processed per pipeline.

-  ``NSTAND`` – The number of antenna stands in the array.

-  ``NPOL`` – The number of polarizations per antenna stand.

For the LWA-352 system:

-  ``NCHAN`` = 184

-  ``NSTAND`` = 352

-  ``NPOL`` = 2

Full Correlation Packets
------------------------

Data from the full, slow correlator are transmitted as a series of UDP
packets, with each packet carrying data for one dual-polarization
baseline, for multiple channels. Each packet has a 56 byte header
followed by a payload of signed 32-bit integers.

.. code:: C

      struct corr_output_full_packet {
        uint64_t  sync_time;
        uint64_t  spectra_id;
        double    bw_hz;
        double    sfreq_hz;
        uint32_t  acc_len;
        uint32_t  nchans;
        uint32_t  chan0;
        uint32_t  npols;
        uint32_t  stand0;
        uint32_t  stand1;
        int32_t   data[npols, npols, nchans, 2];
      };

Packet fields are as follows:

.. list-table::
  :widths: 30 30 10 100
  :header-rows: 1
  :align: left

  * - Field
    - Format
    - Units
    - Description

  * - ``sync_time``
    - uint64
    - UNIX seconds
    - The sync time to which spectra IDs are referenced.

  * - ``spectra_id``
    - int
    -
    - The spectrum number for the first spectra which contributed to this packet’s integration.

  * - ``bw_hz``
    - double (binary64)
    - Hz
    - The total bandwidth of data in this packet

  * - ``sfreq_hz``
    - double (binary64)
    - Hz
    - The center frequency of the first channel of data in this packet

  * - ``acc_len``
    - uint32
    - -
    - The number of spectra integrated in this packet

  * - ``nchans``
    - uint32
    -
    - The number of frequency channels in this packet. For LWA-352 this is 184

  * - ``chan0``
    - uint32
    - 
    - The index of the first frequency channel in this packet

  * - ``npols``
    - uint32
    -
    - The number of polarizations of data in this packet. For LWA-352, this is 2.

  * - ``stand0``
    - uint32
    -
    - The index of the first antenna stand in this packet’s visibility.

  * - ``stand1``
    - uint32
    -
    - The index of the second antenna stand in this packet’s visibility.

  * - ``data``
    - int32\*
    -
    - The data payload. Data for the visibility of
      antennas at stand0 and stand1, with stand1 conjugated. Data are a
      multidimensional array of 32-bit integers, with dimensions [``NPOLS``,
      ``NPOLS``, ``NCHANS``, 2]. The first axis is the polarization of the
      antenna at stand0. The second axis is the polarization of the antenna
      at stand1. The third axis is frequency channel. The fourth axis is
      complexity, with index 0 the real part of the visibility, and index 1
      the imaginary part.

Partial Correlation Packets
---------------------------

Data from the fast dump correlator are transmitted as a series of UDP
packets, with each packet carrying data for multiple frequency channels
of multiple, single-polarization visibilities.

Each packet has a variable length header followed by a payload of signed
32-bit integers.

.. code:: C

      struct corr_output_partial_packet {
        uint64_t  sync_time;
        uint64_t  spectra_id;
        double    bw_hz;
        double    sfreq_hz;
        uint32_t  acc_len;
        uint32_t  nvis;
        uint32_t  nchans;
        uint32_t  chan0;
        uint32_t  baselines[nvis, 2, 2];
        int32_t   data[nvis, nchans, 2];

Packet fields are as follows:

.. list-table::
  :widths: 30 30 10 100
  :header-rows: 1
  :align: left

  * - Field
    - Format
    - Units
    - Description

  * - ``sync_time``
    - uint64
    - UNIX seconds
    - The sync time to which spectra IDs are referenced.

  * - ``spectra_id``
    - int
    -
    - The spectrum number for the first spectra which contributed to this packet’s integration.

  * - ``bw_hz``
    - double (binary64)
    - Hz
    - The total bandwidth of data in this packet

  * - ``sfreq_hz``
    - double (binary64)
    - Hz
    - The center frequency of the first channel of data in this packet

  * - ``acc_len``
    - uint32
    -
    - The number of spectra integrated in this packet

  * - ``nvis``
    - uint32
    -
    - The number of single polarization visibilities present in this packet.

  * - ``nchans``
    - uint32
    -
    - The number of frequency channels in this packet. For LWA-352 this is 184

  * - ``chan0``
    - uint32
    -
    - The index of the first frequency channel in this packet

  * - ``baselines``
    - uint32\*
    -
    - An array containing the stand and
      polarization indices of the multiple visibilities present in this
      packet. This entry has dimensions [``nvis``, 2, 2]. The first index
      runs over the number of visibilities within this packet. The second
      index is 0 for the first (unconjugated) visibility input and 1 for the
      second (conjugated) antenna input. The third index is zero for stand
      number, and 1 for polarization number.

  * - ``data``
    - int32\*
    -
    - The data payload. Data for the visibility of
      antennas at stand0 and stand1, with stand1 conjugated. Data are a
      multidimensional array of 32-bit integers, with dimensions [``NVIS``,
      ``NCHANS``, 2]. The first axis runs over the multiple visibilities in
      this packet. Each index can be associated with a physical antenna
      using the ``baselines`` field. The second axis is frequency channel.
      The third axis is complexity, with index 0 the real part of the
      visibility, and index 1 the imaginary part.

VLBI Beam
---------

Integrated Beams
----------------

Control Interface
=================

Control and monitoring of the X-Engine pipeline is carried out through
the passing of JSON-encoded messages through an ``etcd``\  [1]_
key-value store. Each processing block in the LWA system has a unique
identifier which defines a key to which runtime status is published and
a key which should be monitored for command messages.

The unique key of a processing block is derived from the ``blockname``
of the module within the pipeline, the ``hostname`` of the server on
which a pipeline is running, and the pipeline id - ``pid`` - of this
pipeline.

In general, keys to which status information is published have the
prefix:

``/mon/corr/xeng/<hostname>/pipeline/<pid>/<blockname>``.

Keys to which users should write commands have the prefix

``/cmd/corr/xeng/<hostname>/pipeline/<pid>/<blockname>``.

The format of these status and command messages, and their allowed
values are given in the remainder of this section on a per-block basis.

Capture Thread (blockname: ``capture``)
---------------------------------------

Commands
~~~~~~~~

The ``capture`` block accepts no runtime commands. When a pipeline is
executed, the capture module will automatically begin filling processing
buffers. Buffer boundaries occur every ``GSIZE`` samples.

Monitoring
~~~~~~~~~~

The ``capture`` block writes monitoring data to the key
``/mon/corr/xeng/<hostname>/pipeline/<pid>/capture``. Data are written
as a JSON-encoded dictionary with the following entries:

+------------------+--------+-----------+--------------------------------------------------+
| Field            | Format | Units     | Description                                      |
+==================+========+===========+==================================================+
| thoughput        | float  | Gbits/s   | Block throughput                                 |
+------------------+--------+-----------+--------------------------------------------------+
| n\_dropped       | int    | packets   | Number of packets dropped since pipeline start   |
+------------------+--------+-----------+--------------------------------------------------+
| n\_received      | int    | packets   | Number of packets received since pipeline start  |
+------------------+--------+-----------+--------------------------------------------------+
| frac\_dropped    | float  |           | Fraction of packets dropped since pipeline start |
+------------------+--------+-----------+--------------------------------------------------+
| n\_late          | int    | packets   | Number of late packets since pipeline start      |
+------------------+--------+-----------+--------------------------------------------------+
| n\_f\_missing    | int    | boards    | TODO                                             |
+------------------+--------+-----------+--------------------------------------------------+
| n\_part\_dropped | int    | packets   | TODO                                             |
+------------------+--------+-----------+--------------------------------------------------+
| time             | float  | UNIX time | The time this key was updated.                   |
+------------------+--------+-----------+--------------------------------------------------+

Copy Thread (blockname: ``gpucopy``)
------------------------------------

The ``gpucopy`` block accepts no runtime commands and outputs no
run-time statistics.

Correlation Thread (blockname: ``corr``)
----------------------------------------

The ``corr`` block takes blocks of ``GSIZE`` 4-bit time samples from
the ``gpucopy`` thread and generates visibility matrices using an xGPU
computation kernel. Integration takes place over the ``GSIZE`` input
samples.

Commands
~~~~~~~~

The ``corr``\ block has a run-time configurable accumulation length and
start time. These can be set by writing a JSON-encoded dictionary to the
key ``/cmd/corr/xeng/<hostname>/pipeline/<pid>/corr``, which should have
the following fields:

| c c c X Field & Format & Units & Description
| acc\_len & int & samples & Number of samples to integrate. Must be a
  multiple of ``GSIZE``. acc\_len = 0 can be used to force the
  ``corr``\ module to stop processing.
| start\_time & int & samples & Sample index on which to begin
  integrating. Must be a multiple of ``GSIZE``.

Sample indices are relative to the F-Engine sync time – i.e., sample
index 0 is the first sample after an F-Engine sync event. Sample indices
can only be converted to real time with the knowledge of the F-Engine
sync time and F-Engine ADC clock rate.

It should be noted that modifying the run-time configuration of the
``corr``\ module will impact both the fast- and slow-visibility
processing streams. Both streams will re-synchronize onto new correlator
integration boundaries.

Monitoring
~~~~~~~~~~

The ``corr``\ block writes status data as a JSON-encoded dictionary to
the key:

``/mon/corr/xeng/<hostname>/pipeline/<pid>/corr``

The status dictionary has the following fields:

| c c c X Field & Format & Units & Description
| thoughput & float & Gbits/s & Block throughput
| acc\_len & int & samples & Number of samples currently set to
  integrate
| start\_sample & int & samples & Current start time.
| curr\_sample & int & samples & The last sample to be processed.
| update\_pending & bool & - & True if new integration parameters are
  waiting to be loaded.
| last\_update\_time & float & seconds & The time since UNIX epoch that
  the imtegration parameters were last updated.
| new\_acc\_len & int & samples & The commanded integration length
| new\_start\_sample & int & samples & The commanded start sample
| last\_cmd\_time & float & seconds & The time since UNIX epoch that the
  last command was received

Visibility Sub-Select Thread (blockname: ``corrsubsel``)
--------------------------------------------------------

Commands
~~~~~~~~

The ``corrsubsel``\ block outputs a run-time configurable set of
baselines. These can be set by writing a JSON-encoded dictionary to the
key ``/cmd/corr/xeng/<hostname>/pipeline/<pid>/corrsubsel``, which
should have the following fields:

| c c c X Field & Format & Units & Description
| subsel & list(int) & - & A list of baselines for subselection. This
  field should be provided as a multidimensional list with dimensions
  [``N_VIS``, 2, 2]. The first axis runs over the 4656 baselines which
  may be selected. The second index is 0 for the first (unconjugated)
  input selected and 1 for the second (conjugated) input selected. The
  third axis is 0 for stand number, and 1 for polarization number.

Example
^^^^^^^

To set the baseline subsection to choose:

-  visibility 0: the autocorrelation of antenna 0, polarization 0

-  visibility 1: the cross correlation of antenna 5, polarization 1 with
   antenna 6, polarization 0

use:

``subsel = [ [[0,0], [0,0]], [[5,1], [6,0]], ... ]``

Note that the uploaded selection list must always have 4656 entries.

Monitoring
~~~~~~~~~~

The ``corr``\ block writes status data as a JSON-encoded dictionary to
the key: ``/mon/corr/xeng/<hostname>/pipeline/<pid>/corrsubsel``.

The status dictionary has the following fields:

+--------------------+-----------+---------+---------------------------------------------+
| Field              | Format    | Units   | Description                                 |
+====================+===========+=========+=============================================+
| thoughput          | float     | Gbits/s | Block throughput                            |
+--------------------+-----------+---------+---------------------------------------------+
| subsel             | list(int) | samples | Current set of visibility indices being     |
|                    |           |         | selected                                    |
+--------------------+-----------+---------+---------------------------------------------+
| update\_pending    | bool      |         | True if new selection parameters are        |
|                    |           |         | waiting to be loaded.                       |
+--------------------+-----------+---------+---------------------------------------------+
| last\_update\_time | float     | seconds | The time since UNIX epoch that the          |
|                    |           |         | selection parameters were last updated.     |
+--------------------+-----------+---------+---------------------------------------------+
| new\_subsel        | list(int) | samples | The commanded visibility selection indices. |
+--------------------+-----------+---------+---------------------------------------------+
| last\_cmd\_time    | float     | seconds | The time since UNIX epoch that the last     |
|                    |           |         | command was received                        |
+--------------------+-----------+---------+---------------------------------------------+

Visibility Integrator (blockname: ``corracc``)
----------------------------------------------

Commands
~~~~~~~~

The ``corracc`` block further integrates the output of the
``corr`` block. Integration parameters can be set by writing a
JSON-encoded dictionary to the key:

``/cmd/corr/xeng/<hostname>/pipeline/<pid>/corracc``

This should have the following fields:

+-------------+--------+---------+-----------------------------------------------+
| Field       | Format | Units   | Description                                   |
+=============+========+=========+===============================================+
| acc\_len    | int    |         | Number of samples to integrate. acc\_len = 0  |
|             |        |         | can be used to force the ``corracc`` module   |
|             |        |         | to stop processing.                           |
+-------------+--------+---------+-----------------------------------------------+
| start\_time | int    | samples | Sample index on which to begin integrating.   |
+-------------+--------+---------+-----------------------------------------------+

Note that the acc\_len configuration must be compabible with – i.e.,
must be a multiple of – the accumulation length set in the
``corr`` block. Furtherm the start\_time must be compatible with the
integration boundaries associated with the ``corr`` block’s integration
settings.

Run-time checks will flag bad configurations as errors, but no check is
made on issuing a command to ensure it is valid. After booting the
pipeline, a safe order of configuration is:

#. Boot pipeline.

#. Configure ``corracc`` block

#. Configure ``corr`` block

For changes of configuration, the safe order of updates is:

Monitoring
~~~~~~~~~~

The ``corracc`` block writes status data as a JSON-encoded dictionary
to the key:

``/mon/corr/xeng/<hostname>/pipeline/<pid>/corracc``.

The status dictionary has the following fields:

+--------------------+--------+---------+----------------------------------------------+
| Field              | Format | Units   | Description                                  |
+====================+========+=========+==============================================+
| acc\_len           | int    | samples | Number of samples currently set to integrate |
+--------------------+--------+---------+----------------------------------------------+
| start\_sample      | int    | samples | Current start time.                          |
+--------------------+--------+---------+----------------------------------------------+
| curr\_sample       | int    | samples | The last sample to be processed.             |
+--------------------+--------+---------+----------------------------------------------+
| update\_pending    | bool   |         | True if new integration parameters are       |
|                    |        |         | waiting to be loaded.                        |
+--------------------+--------+---------+----------------------------------------------+
| last\_update\_time | float  | seconds | The time since UNIX epoch that the           |
|                    |        |         | imtegration parameters were last updated.    |
+--------------------+--------+---------+----------------------------------------------+
| new\_acc\_len      | int    | samples | The commanded integration length             |
+--------------------+--------+---------+----------------------------------------------+
| new\_start\_sample | int    | samples | The commanded start sample                   |
+--------------------+--------+---------+----------------------------------------------+
| last\_cmd\_time    | float  | seconds | The time since UNIX epoch that the last      |
|                    |        |         | command was received                         |
+--------------------+--------+---------+----------------------------------------------+

Beamformer (blockname: ``beamform``)
------------------------------------

The ``beamform`` block forms ``2 x NBEAM`` independent, single
polarization voltage beams. Beam pointings are specified by relative
antenna delays and a set of universal, frequency-dependent calibration
coefficients, which are shared among all beams. Note that this interface
precludes direction-dependent calibrations.

Commands
~~~~~~~~

Commands are sent to be ``beamform`` module by writing a JSON-encoded
command to the key:

``/cmd/corr/xeng/<hostname>/pipeline/<pid>/beamform``

This command should have the following fields

+--------------+-----------------+--------+-------------------------------------------+
| Field        | Format          | Units  | Description                               |
+==============+=================+========+===========================================+
| delays[x]    | list(float)     | ns     | An ``NINPUT`` element list of geometric   |
|              |                 |        | delays, in nanoseconds. [x] is a beam     |
|              |                 |        | index, and should be between 0 and        |
|              |                 |        | ``NBEAM - 1``                             |
+--------------+-----------------+--------+-------------------------------------------+
| gains        | list(complex32) |        | A two dimensional list of calibration     |
|              |                 |        | gains with shape ``[NCHAN, NINPUT]``      |
+--------------+-----------------+--------+-------------------------------------------+
| load\_sample | int             | sample | Sample number on which the supplied       |
|              |                 |        | delays should be loaded. If this field is |
|              |                 |        | absent, new delays will be loaded as soon |
|              |                 |        | as possible                               |
+--------------+-----------------+--------+-------------------------------------------+

The ``beamform`` block calculates voltage beams only and has no concept
of polarization. Instead, the ``beamform`` block generates
``2 x NBEAM`` beams and computes the auto- and cross-power spectra
between beams in order to generate auto- and cross-pol products. Beams
are paired such that the cross-power of beams ``2n`` and
``2n+1`` are computed – it is the user’s responsibility to ensure
that these beams have the same pointing and are formed from
complementary antenna polarizations.

Monitoring
~~~~~~~~~~

The ``beamform`` block writes status data as a JSON-encoded dictionary
to the key:

``/mon/corr/xeng/<hostname>/pipeline/<pid>/beamform``.

The status dictionary has the following fields:

+--------------------+-----------------+---------+--------------------------------------+
| Field              | Format          | Units   | Description                          |
+====================+=================+=========+======================================+
| thoughput          | float           | Gbits/s | Block throughput                     |
+--------------------+-----------------+---------+--------------------------------------+
| delays[x]          | list(float)     | ns      | An ``NINPUT`` element list           |
|                    |                 |         | containing the delays currently      |
|                    |                 |         | loaded for beam ``x``                |
+--------------------+-----------------+---------+--------------------------------------+
| gains              | list(complex32) |         | A two dimensional list of currently  |
|                    |                 |         | loaded calibration gains. The        |
|                    |                 |         | dimensions of this list should be    |
|                    |                 |         | ``NCHAN x NINPUT``                   |
+--------------------+-----------------+---------+--------------------------------------+
| new\_delays[x]     | list(float)     | ns      | An ``NINPUT`` element list           |
|                    |                 |         | containing the next set of delays to |
|                    |                 |         | be loaded for beam ``x``             |
+--------------------+-----------------+---------+--------------------------------------+
| new\_gains         | list(complex32) |         | A two-dimensional list of            |
|                    |                 |         | calibration gains with shape         |
|                    |                 |         | ``[NCHAN, NINPUT]``                  |
+--------------------+-----------------+---------+--------------------------------------+
| curr\_sample       | int             | samples | The last sample to be processed.     |
+--------------------+-----------------+---------+--------------------------------------+
| update\_pending    | bool            | -       | True if new integration parameters   |
|                    |                 |         | are waiting to be loaded.            |
+--------------------+-----------------+---------+--------------------------------------+
| last\_update\_time | float           | seconds | The time since UNIX epoch that the   |
|                    |                 |         | imtegration parameters were last     |
|                    |                 |         | updated.                             |
+--------------------+-----------------+---------+--------------------------------------+
| new\_acc\_len      | int             | samples | The commanded integration length     |
+--------------------+-----------------+---------+--------------------------------------+
| new\_start\_sample | int             | samples | The commanded start sample           |
+--------------------+-----------------+---------+--------------------------------------+
| last\_cmd\_time    | float           | seconds | The time since UNIX epoch that the   |
|                    |                 |         | last command was received            |
+--------------------+-----------------+---------+--------------------------------------+

.. [1]
   See `etcd.io <etcd.io>`__
