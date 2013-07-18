class asterisk::server::install {
  package { $asterisk::params::server::packagename:
    ensure => present,
  }
}

# vim:sw=2:ts=2:expandtab
