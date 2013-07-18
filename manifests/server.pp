# == Class: asterisk::server
#
# This class manages the asterisk server
#
# === Examples
#
#  class { 'asterisk::server': }
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the Apache License, Version 2.0. See the LICENSE file at
# the top of the source tree.
#
class asterisk::server(
    $sip = {}
) {
    $sip_defaults = {
        'udpbindaddr'   => "${ipaddress_eth0}:5060",
        'contactpermit' => "${network_eth0}/${netmask_eth0}",
        'localnet'      => "${network_eth0}/${netmask_eth0}",
    }

    $sip_real = merge($sip_defaults, $sip)

    include asterisk::params::server
    include asterisk::server::init
}

# vim:sw=4:ts=4:expandtab:textwidth=79
