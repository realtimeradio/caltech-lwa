#! /usr/bin/env python

import os
import sys
import argparse
import yaml
import logging
import numpy as np
from lwa_f import snap2_fengine

N_ANTS_PER_BOARD = 32

FAIL = -1
SUCCESS = 0

logger = logging.getLogger(__file__)
handler = logging.StreamHandler(sys.stdout)
logger.setLevel(logging.INFO)
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

def test_identical_noise(f):
    """
    Set all inputs to point to the same noise source and verify that
    power, RMS, mean, and autocorrelations (among groups of 16 inputs)
    are identical.
    """
    # Point all inputs to the first noise generator
    for i in range(f.noise.n_outputs):
        f.noise.assign_output(i, 0)

    means, rmss, powers = f.input.get_bit_stats()
    ok = True

    if not np.all(means != 0):
        logger.error("Means were not all non-zero!")
        ok = False
    else:
        logger.debug("Means all non-zero")

    if not np.all(rmss != 0):
        logger.error("RMSs were not all non-zero!")
        ok = False
    else:
        logger.debug("RMSs all non-zero")

    if not np.all(powers != 0):
        logger.error("Powers were not all non-zero!")
        ok = False
    else:
        logger.debug("Powers all non-zero")

    for i in range(f.input.n_streams):
        if not np.all(means[i] == means[0]):
            logger.error("Mean mismatch on input %d" % i)
            ok = False
        else:
            logger.debug("Means match between input %d and input 0" % i)
        if not np.all(rmss[i] == rmss[0]):
            logger.error("RMS mismatch on input %d" % i)
            ok = False
        else:
            logger.debug("RMSs match between input %d and input 0" % i)
        if not np.all(powers[i] == powers[0]):
            logger.error("Power mismatch on input %d" % i)
            ok = False
        else:
            logger.debug("Powers match between input %d and input 0" % i)

    spectra = f.autocorr.get_new_spectra(0) # dummy capture to flush vacc
    for i in range(f.autocorr._n_cores):
        spectra = f.autocorr.get_new_spectra(i)
        n_spectra, nchans = spectra.shape
        for j in range(n_spectra):
            if not np.all(spectra[j] == spectra[0]):
                logger.error("Spectra mismatch between autocorr block %d input %d and input 0" % (i, j))
                ok = False
            else:
                logger.debug("Spectra between autocorr block %d input %d and input 0 match" % (i, j))
            # Check DC spike is in zero bin
            if not np.max(spectra[j]) == spectra[j,0]:
                logger.error("Maximum power of spectra for block %d chan %d was not DC bin" % (i, j))
                ok = False
            mean = np.mean(spectra[j,1:])
            sigma = np.sqrt(np.var(spectra[j,1:]))
            dc_peak = (spectra[j,0] - mean) / sigma
            if not dc_peak > 100:
                logger.error("DC bin for block %d chan %d less than 100 sigma above mean (only %.2f sigma)" % (i, j, dc_peak))
                ok = False
            noise_peak = np.max(np.abs((spectra[j, 1:] - mean) / sigma))
            if not noise_peak < 10:
                logger.error("Highest noise peak for block %d chan %d >10 sigma above mean (%.2f sigma)" % (i, j, noise_peak))
                ok = False

    if ok:
        return SUCCESS
    else:
        return FAIL

def test_zeros(f, zero_chans):
    """
    Set a subset of inputs to zero.
    Ensure bit stats and autocorrelations are zero only in
    the expected channels.
    """
    ok = True
    f.input.use_noise()
    for chan in zero_chans:
        f.input.use_zero(chan)

    # Flush a spectra
    f.autocorr.get_new_spectra(0)

    means, rmss, powers = f.input.get_bit_stats()

    for chan in zero_chans:
        if not means[chan] == 0:
            logger.error("Channel %d had non-zero mean" % chan)
            ok = False
        if not rmss[chan] == 0:
            logger.error("Channel %d had non-zero rms" % chan)
            ok = False
        if not powers[chan] == 0:
            logger.error("Channel %d had non-zero power" % chan)
            ok = False

    for block in range(f.autocorr._n_cores):
        spectra = f.autocorr.get_new_spectra(block)
        n_spectra, nchans = spectra.shape
        for i in range(n_spectra):
            if block*n_spectra + i in zero_chans:
                if not np.all(spectra[i] == 0):
                    logger.error("Non-zero spectra for autocorr block %d input %d" % (block, i))
                    ok = False
            else:
                if not np.all(spectra[i] != 0):
                    logger.error("Unexpected zero autocorr bin for block %d input %d" % (block, i))
                    ok = False
    if ok:
        return SUCCESS
    else:
        return FAIL


def test_different_noise(f, noise_sources):
    """
    Set different inputs to one of several uncorrelated noise sources.
    Verify that bit stats and autocorrelation spectra are the same,
    or different, between different inputs, as expected.
    """
    ok = True
    # Point all inputs to the appropriate noise generator
    for output, noisegen in enumerate(noise_sources):
        f.noise.assign_output(output, noisegen)
    logger.info("Assigning outputs %s to noise generator %s" % (range(len(noise_sources)), noise_sources))

    # Flush a spectra
    f.autocorr.get_new_spectra(0)

    means, rmss, powers = f.input.get_bit_stats()

    if not np.all(means != 0):
        logger.error("Means were not all non-zero!")
        ok = False
    else:
        logger.debug("Means all non-zero")

    if not np.all(rmss != 0):
        logger.error("RMSs were not all non-zero!")
        ok = False
    else:
        logger.debug("RMSs all non-zero")

    if not np.all(powers != 0):
        logger.error("Powers were not all non-zero!")
        ok = False
    else:
        logger.debug("Powers all non-zero")

    for i in range(f.input.n_streams):
        for j in range(i, f.input.n_streams):
            if (noise_sources[i] == noise_sources[j]):
                if not np.all(means[i] == means[j]):
                    logger.error("Mean mismatch between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("Means match between inputs %d and %d" % (i, j))
                if not np.all(rmss[i] == rmss[j]):
                    logger.error("RMS mismatch between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("RMSs match between inputs %d and %d" % (i, j))
                if not np.all(powers[i] == powers[j]):
                    logger.error("Power mismatch between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("Powers match between inputs %d and %d" % (i, j))
            else:
                if not np.all(means[i] != means[j]):
                    logger.error("Unexpected Mean match between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("Means differ between inputs %d and %d" % (i, j))
                if not np.all(rmss[i] != rmss[j]):
                    logger.error("Unexpected RMS match between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("RMSs differ between inputs %d and %d" % (i, j))
                if not np.all(powers[i] != powers[j]):
                    logger.error("Unexpected Power match between inputs %d and %d" % (i, j))
                    ok = False
                else:
                    logger.debug("Powers differ between inputs %d and %d" % (i, j))

    spectra = f.autocorr.get_new_spectra(0) # dummy capture to flush vacc
    for block in range(f.autocorr._n_cores):
        spectra = f.autocorr.get_new_spectra(block)
        n_spectra, nchans = spectra.shape
        for i in range(n_spectra):
            for j in range(i, n_spectra):
                if (noise_sources[n_spectra*block + i] == noise_sources[n_spectra*block + j]):
                    if not np.all(spectra[i] == spectra[j]):
                        logger.error("Spectra mismatch between autocorr block %d input %d and input %d" % (block, i, j))
                        ok = False
                    else:
                        logger.debug("Spectra between autocorr block %d input %d and input %d differ" % (block, i, j))
                else:
                    # Allow some random matches
                    if np.sum(spectra[i] == spectra[j]) > 3:
                        logger.error("Unexpected match between autocorr block %d input %d and input %d" % (block, i, j))
                        ok = False
                    else:
                        logger.debug("Spectra between autocorr block %d input %d and input %d differ" % (block, i, j))

    if ok:
        return SUCCESS
    else:
        return FAIL

def test_delays(f, delays, equalize=True, check_list=None):
    """
    Set all inputs to use the same noise source.
    Apply random delays to inputs.
    Using the corr block, check a subset of baselines
    to ensure correlations have expected phase slopes.
    """
    ok = True
    f.input.use_noise()
    for i in range(f.noise.n_outputs):
        f.noise.assign_output(i, 0)

    for dn, delay in enumerate(delays):
        logger.info("Setting delay of input %d to %d" % (dn, delay))
        f.delay.set_delay(dn, delay)

    if equalize:
        f.set_equalization() # Just use defaults

    for dn0, delay0 in enumerate(delays):
        for dn1, delay1 in enumerate(delays):
            if check_list is not None and dn0*f.delay.n_streams + dn1 not in check_list:
                continue
            rel_delay = delay1 - delay0
            corr = f.corr.get_new_corr(dn0, dn1)
            if np.all(corr == 0):
                logger.error("Correlations were all zero between inputs %d and %d" % (dn0, dn1))
                ok = False
            expected_phase = np.linspace(0, np.pi*rel_delay, corr.shape[0]*f.corr._chan_sum_factor, endpoint=False)
            expected_complex = np.exp(1j*expected_phase)
            expected_complex = expected_complex.reshape(corr.shape[0], f.corr._chan_sum_factor).mean(axis=1)
            phase_diff = np.angle(expected_complex / corr)
            max_phase_diff = np.abs(phase_diff[corr != 0]).max()
            logger.info("Checking phase of input %d vs %d (relative delay %d). Max phase diff %.3f" %
                    (dn0, dn1, rel_delay, max_phase_diff))
            if max_phase_diff > (np.pi/50):
                ok = False
                logger.error("Phase mismatch between inputs %d (delay %d) and %d (delay %d)" % (dn0, delay0, dn1, delay1))
                print("Expected phase (bins [300:310]):", np.angle(expected_complex[300:310]))
                print("Observed phase (bins [300:310]):", np.angle(corr[300:310]))
                #import pylab
                #pylab.figure()
                #pylab.plot(expected_phase)
                #pylab.plot(obs_phase)
                #pylab.figure()
                #pylab.plot(np.abs(phase_diff[corr != 0]), label=0)
                #pylab.legend()
                #pylab.show()
                #exit()
    if ok:
        return SUCCESS
    else:
        return FAIL


def main(args):
    rng = np.random.default_rng(args.seed)
    f = snap2_fengine.Snap2Fengine(args.host)
    if args.initialize:
        f.initialize(read_only=False)

    for block in [f.sync, f.noise, f.input, f.delay, f.pfb, f.autocorr, f.corr]:
        logger.info("Initializing block %s" % block.name)
        block.initialize(read_only=False)

    noise_seed = rng.integers(0, 256)
    for i in range(f.noise.n_noise):
        logger.info("Setting noise seed of generator %d to %d" % (i, noise_seed + i))
        f.noise.set_seed(i, noise_seed + i)
    f.input.use_noise()

    f.sync.arm_sync()
    f.sync.arm_noise()
    f.sync.sw_sync()

    if args.samenoise:
        logger.info("Checking input stats and autocorrs make sense with all inputs using identical noise")
        if test_identical_noise(f) == SUCCESS:
            logger.info("PASS")
        else:
            logger.error("FAIL")
            exit()

    if args.diffnoise:
        logger.info("Checking input stats and autocorrs with different noise sources")
        noise_allocation = rng.integers(0, 2*f.noise.n_noise, f.noise.n_outputs)
        if test_different_noise(f, noise_allocation) == SUCCESS:
            logger.info("PASS")
        else:
            logger.error("FAIL")
            exit()

    if args.zero:
        logger.info("Checking input stats and autocorrs with some channels zeroed")
        zero_chans = rng.integers(0, f.input.n_streams, f.input.n_streams // 2)
        if test_zeros(f, zero_chans) == SUCCESS:
            logger.info("PASS")
        else:
            logger.error("FAIL")
            exit()

    if args.delay:
        logger.info("Checking phase between delayed noise sources")
        check_list = rng.integers(0, f.delay.n_streams**2, 200)
        # Use delays of maximum range 200 to avoid decohering. But also place
        # range around 1024, to exercise the multi-bram delays in firmware
        delays = rng.integers(1024-100, 1024+100, f.delay.n_streams)
        if test_delays(f, delays, equalize=True, check_list=check_list) == SUCCESS:
            logger.info("PASS")
        else:
            logger.error("FAIL")
            exit()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Check internal test modes',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-i', dest='initialize', action='store_true',
                        help ='Use this flag to initialize an F-engine')
    parser.add_argument('-s', dest='seed', type=int, default=0xabcdabcd,
                        help ='Random number seed for this test')
    parser.add_argument('--samenoise', action='store_true',
                        help='Run "Same noise" tests')
    parser.add_argument('--diffnoise', action='store_true',
                        help='Run "Different noise" tests')
    parser.add_argument('--zero', action='store_true',
                        help='Run "Zeroing out" tests')
    parser.add_argument('--delay', action='store_true',
                        help='Run "Delay phase" tests')
    parser.add_argument('host', type=str,
                        help='SNAP2 hostname (or IP address) to initialize')
    args = parser.parse_args()
    main(args)
