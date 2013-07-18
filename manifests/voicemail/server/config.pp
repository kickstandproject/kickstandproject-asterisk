class asterisk::voicemail::server::config {
  file { "${asterisk::params::voicemail::spooldir}/voicemail":
    ensure  => directory,
    require => File[$asterisk::params::voicemail::spooldir],
  }

  file { "${asterisk::params::voicemail::basedir}/modules.conf.d/01voicemail.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/modules.conf.d/01voicemail.conf.erb'),
    notify  => Class['asterisk::server::service'],
    require => File["${asterisk::params::voicemail::basedir}/modules.conf.d"],
  }
}

# vim:sw=2:ts=2:expandtab
