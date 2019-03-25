"""Tests for the default scenario."""
import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_fbl01_user(host):
    """Ensure that the fbl01 user exists."""
    fbl01 = host.user('fbl01')
    assert fbl01.exists
    assert fbl01.group == 'fbl01'


def test_ntp_is_installed(host):
    """Check that the NTP package is installed."""
    ntp = host.package("ntp")
    assert ntp.is_installed


def test_ntp_config_file(host):
    """Check that the NTP config file exists and has the expected contents."""
    ntp_config = host.file("/etc/ntp.conf")
    ntp_config.contains('/^server [0-9].uk.pool.ntp.org iburst$/')


def test_ntpd_running_and_enabled(host):
    """Ensure that the NTPD service is enabled and running."""
    nginx = host.service("ntpd")
    assert nginx.is_running
    assert nginx.is_enabled
