class asterisk::server::service {
  service { $asterisk::params::server::servicename:
    ensure     => running,
    enable     => true,
    hasrestart => $asterisk::params::server::hasrestart,
    hasstatus  => $asterisk::params::server::hasstatus,
    require    => Class['asterisk::server::config'],
  }
}

# vim:sw=2:ts=2:expandtab
