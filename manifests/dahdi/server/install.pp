class asterisk::dahdi::server::install {
  package { $asterisk::params::dahdi::packagename:
    ensure => present,
  }
}

# vim:sw=2:ts=2:expandtab
