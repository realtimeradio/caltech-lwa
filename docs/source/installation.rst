.. |repopath| replace:: https://github.com/realtimeradio/caltech-lwa
.. |py-version| replace:: >=3.5

Installation
============

The LWA 352 F-Engine pipeline is available at |repopath|.
Follow the following instructions to download and install the pipeline.

Specify the build directory by defining the ``BUILDDIR`` environment variable, eg:

.. code-block::

  export BUILDDIR=~/src/
  mkdir -p $BUILDDIR

Get the Source Code
-------------------

Clone the repository and its dependencies with:

.. code-block::

  # Clone the main repository
  cd $BUILDDIR
  git clone https://github.com/realtimeradio/caltech-lwa
  # Clone relevant submodules
  cd caltech-lwa
  git submodule init
  git submodule update

Install Prerequisites
---------------------

Firmware Requirements
+++++++++++++++++++++

The LWA-253 F-Engine firmware can be built with the CASPER toolflow, and was
designed using the following software stack:

  - Ubuntu 18.04.0 LTS (64-bit)
  - MATLAB R2019a
  - Simulink R2019a
  - MATLAB Fixed-Point Designer Toolbox R2019a
  - Xilinx Vivado HLx 2019.1.3
  - Python 3.6.9

It is *strongly* recommended that the same software versions be used to rebuild
the design.
