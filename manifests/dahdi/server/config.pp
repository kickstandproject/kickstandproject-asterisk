class asterisk::dahdi::server::config {
  file { "${asterisk::params::dahdi::basedir}/modules.conf.d/01dahdi.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/modules.conf.d/01dahdi.conf.erb'),
    notify  => Class['asterisk::server::service'],
    require => File["${asterisk::params::dahdi::basedir}/modules.conf.d"],
  }
}

# vim:sw=2:ts=2:expandtab
