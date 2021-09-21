F-Engine System Overview
========================

Overview
--------

The LWA352 F-Engine firmware is designed to run on a SNAP2 [1]_ FPGA board, and provides channelization of 64 analog data streams, sampled at up to 200 Msps, into 4096 sub-bands.

After channelization, data words are requantized to 4-bit resolution (4-bit real + 4-bit imaginary) and a subset of the 4096 generated frequency channels are output as a UDP/IP stream over a single 40 Gb/s Ethernet interface.

The top-level specs of the F-Engine are:

+-------------------------+----------+----------------------+
| Parameter               | Value    | Notes                |
+=========================+==========+======================+
| Number of analog inputs | 64       | 32-inputs per SNAP2  |
|                         |          | FMC+ port            |
+-------------------------+----------+----------------------+
| Maximum sampling rate   | 200 Msps | Limited by ADC speed |
|                         |          | & timing constraint  |
|                         |          | target               |
+-------------------------+----------+----------------------+
| Test inputs             | Noise;   | Firmware contains 6  |
|                         | zeros    | independent gaussian |
|                         |          | noise generators.    |
|                         |          | Any of the 64 data   |
|                         |          | streams may be       |
|                         |          | replaced with any of |
|                         |          | these digital noise  |
|                         |          | sources, or zeros.   |
+-------------------------+----------+----------------------+
| Delay compensation      | <=8191   | Programmable per-    |
|                         | samples  | input between 5 and  |
|                         |          | 8191 samples         |
+-------------------------+----------+----------------------+
| Polyphase Filter Bank   | 4096     |                      |
| Channels                |          |                      |
+-------------------------+----------+----------------------+
| Polyphase Filter Bank   | Hamming; |                      |
| Window                  | 4-tap    |                      |
+-------------------------+----------+----------------------+
| Polyphase Filter Bank   | 9 bits   | LSB of ADC samples   |
| Input Bitwidth          |          | are discarded.       |
|                         |          | **TODO: Fix this**   |
+-------------------------+----------+----------------------+
| FFT Coefficient Width   | 18 bits  |                      |
+-------------------------+----------+----------------------+
| FFT Data Path Width     | 18 bits  |                      |
+-------------------------+----------+----------------------+
| Post-FFT Scaling        | 16       |                      |
| Coefficient Width       |          |                      |
+-------------------------+----------+----------------------+
| Post-FFT Scaling        | 5        |                      |
| Coefficient Binary      |          |                      |
| Point                   |          |                      |
+-------------------------+----------+----------------------+
| Number of Post-FFT      | 32768    | One coefficient per  |
| Scaling Coefficients    |          | analog input. One    |
|                         |          | coefficient per 8    |
|                         |          | frequency channels   |
+-------------------------+----------+----------------------+
| Post-Quantization Data  | 4        | 4-bit real; 4-bit    |
| Bitwidth                |          | imaginary            |
+-------------------------+----------+----------------------+
| Frequency Channels      | <=3072   | Runtime              |
| Output                  |          | programmable.        |
|                         |          | Maximum is set by    |
|                         |          | total data rate      |
|                         |          | which is limited to  |
|                         |          | 40Gb/s (including    |
|                         |          | protocol overhead).  |
|                         |          | 3072 channels =      |
|                         |          | approx 38Gb/s        |
+-------------------------+----------+----------------------+

A block diagram of the F-engine -- which is also the top-level of the Simulink source code for the firmware -- is shown in :numref:`feng_firmware_top`.

.. figure:: _static/figures/feng_firmware_annotated.pdf
    :align: center
    :name: feng_firmware_top

    F-Engine top-level Simulink diagram.

Initialization
++++++++++++++

The functionality of individual blocks is described below.
However, in order to simply get the firmware into a basic working state the following process should be followed:

  1. Program the FPGA
  2. Initialize all blocks in the system
  3. Trigger master reset and timing synchronization event.

In a multi-board system, the process of synchronizing a board can be relatively involved.
For testing purposes, using single board, a simple software reset can be used in place of a hardware timing signal to perform an artificial synchronization.
A software reset is automatically issued as part of system initialization.

The following commands bring the F-engine firmware into a functional state, suitable for testing.
See :numref:`control-interface` for a full software API description

.. code-block:: python

  # Import the SNAP2 F-Engine library
  from lwa_f import snap2_fengine

  # Instantiate a Snap2Fengine instance to a board with
  # hostname 'snap2-rev2-11'
  f = snap2_fengine.Snap2Fengine('snap2-rev2-11')

  # Program a board
  f.program() # Load whatever firmware is in flash
  # Wait 30 seconds for the board to reboot...

  # Initialize all the firmware blocks
  # and issue a global software reset
  f.initialize(read_only=False)


Block Descriptions
++++++++++++++++++

Each block in the firmware design can be controlled using an API described in :numref:`control-interface`. Here the basic functionality of each block is described.

ADC
~~~

The ADC block contains the interface to the physical ADC cards, and presents ADC data to the Simulink DSP pipeline. It is controlled using the API in :numref:`control-adc`. This API provides the ability to read ADC samples, and is required to "train" the ADC to FPGA link after the FPGA is programmed.

The block has the following ports:

.. table::
    :widths: 15 10 15 60

    +---------------+-----------+-----------------+------------------------------+
    | Name          | Direction | Data Type       | Description                  |
    +===============+===========+=================+==============================+
    | ``chip_sync`` | in        | Bool            | Path from Simulink to the    |
    |               |           |                 | (multiple) ADC physical      |
    |               |           |                 | ``sync`` pins. This signal   |
    |               |           |                 | is ``AND`` -ed with an       |
    |               |           |                 | internal control flag        |
    |               |           |                 | controlled by the ADC        |
    |               |           |                 | block's API.                 |
    +---------------+-----------+-----------------+------------------------------+
    | ``adc_data``  | out       | ``UFix_640_0``  | Concatenated, 10-bit,        |
    |               |           |                 | two’s-complement ADC samples |
    |               |           |                 | from 64 channels. Bits       |
    |               |           |                 | ``10(i+1)-1`` down to        |
    |               |           |                 | ``10i`` correspond to a      |
    |               |           |                 | sample from channel ``i`` in |
    |               |           |                 | ``Fix_10_9`` format.         |
    +---------------+-----------+-----------------+------------------------------+
    | ``adc_sync``  | out       | Bool            | A 1-cycle pulse which        |
    |               |           |                 | precedes the samples from    |
    |               |           |                 | the "even-sample" ADC core.  |
    +---------------+-----------+-----------------+------------------------------+


Output Data Format
==================

UDP packets output from the F-Engine are described below.
Packet format is chosen to be broadly compatible with ``bifrost``'s
packet receive architecture, and to have the following features:

  - Supports arbitrary numbers of channels / antenna inputs per packet
  - Allows channels to be easily distributed among multiple destinations
    (X-Engine pipelines)

.. code:: C

    struct f_packet {
            uint64_t  seq;
            uint32_t  sync_time;
            uint16_t  nsignal;
            uint16_t  nsignal_tot;
            uint16_t  nchan;
            uint16_t  nchan_tot;
            uint32_t  chan_block_id;
            uint32_t  chan0;
            uint32_t  signal0;
            uint8_t   data[nchan, nsignal];
    };

Packet Fields are as follows:

.. table::
    :widths: 20 10 10 60

    +-------------------+--------+---------+-------------------------+
    | Field             | Format | Units   | Description             |
    +===================+========+=========+=========================+
    | ``seq``           | uint64 | spectra | Spectrum index, with    |
    |                   |        | count   | seq=0 corre sponding to |
    |                   |        |         | the spectra at UNIX     |
    |                   |        |         | time ``sync_time``      |
    +-------------------+--------+---------+-------------------------+
    | ``sync_time``     | uint32 | UNIX    | UNIX time corresponding |
    |                   |        | seconds | to the first            |
    |                   |        |         | (``seq=0``) spectrum    |
    +-------------------+--------+---------+-------------------------+
    | ``nsignal``       | uint16 |         | Number of inputs        |
    |                   |        |         | present in a packet     |
    +-------------------+--------+---------+-------------------------+
    | ``nsignal_tot``   | uint16 |         | Number of inputs        |
    |                   |        |         | present in the complete |
    |                   |        |         | multi-SNAP system       |
    +-------------------+--------+---------+-------------------------+
    | ``nchan``         | uint16 |         | Number of frequency     |
    |                   |        |         | channels present in a   |
    |                   |        |         | packet                  |
    +-------------------+--------+---------+-------------------------+
    | ``nchan_tot``     | uint16 |         | Number of frequency     |
    |                   |        |         | channels present in a   |
    |                   |        |         | data stream destined    |
    |                   |        |         | for a single            |
    |                   |        |         | destination.            |
    +-------------------+--------+---------+-------------------------+
    | ``chan_block_id`` | uint32 |         | Index of this block of  |
    |                   |        |         | channels. I.e.          |
    |                   |        |         | ``mod(chan0, nchan)``   |
    +-------------------+--------+---------+-------------------------+
    | ``chan0``         | uint32 |         | The index of the first  |
    |                   |        |         | channel present in a    |
    |                   |        |         | packet                  |
    +-------------------+--------+---------+-------------------------+
    | ``signal0``       | uint32 |         | The index of the first  |
    |                   |        |         | input present in this   |
    |                   |        |         | packet                  |
    +-------------------+--------+---------+-------------------------+
    | ``data``          | uint8  |         | An array of ``nchan x   |
    |                   |        |         | nsignal`` data samples, |
    |                   |        |         | with channel the        |
    |                   |        |         | slowest-varying axis,   |
    |                   |        |         | and input number the    |
    |                   |        |         | fastest-varying axis.   |
    |                   |        |         | Each sample should be   |
    |                   |        |         | interpretted as complex |
    |                   |        |         | data, with the most-    |
    |                   |        |         | significant and least-  |
    |                   |        |         | significant 4 bits      |
    |                   |        |         | corresponding to the    |
    |                   |        |         | real and imaginary data |
    |                   |        |         | parts, respectively.    |
    |                   |        |         | Each component should   |
    |                   |        |         | be interpretted as a    |
    |                   |        |         | two's complement signed |
    |                   |        |         | 4-bit integer           |
    +-------------------+--------+---------+-------------------------+

Packet parameters are chosen to be compatible with the total number
of frequencies the system is required to process, the number of
independent X-Engine pipelines in the system, a target packet size
(generally larger is better, up to the Ethernet network's largest
allowed *Maximum Transmission Unit* (MTU).

In practice, the LWA352 system operates with
  - ``nsignal = 64``
  - ``nsignal_tot = 704``
  - ``nchan = 96``
  - ``nchan_tot = 192``

.. [1]
    See `SNAP2 design document <https://casper.ssl.berkeley.edu/wiki/images/6/62/SNAP2_Doc.pdf>`__ and `SNAP2 CASPER workshop presentation (2017) <http://www.tauceti.caltech.edu/casper-workshop-2017/slides/17_fan.pdf>`__

