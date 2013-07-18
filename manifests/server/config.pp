class asterisk::server::config {
  file { $asterisk::params::basedir:
    ensure  => directory,
    require => Class['asterisk::server::install'],
  }

  file { $asterisk::params::spooldir:
    ensure  => directory,
    require => Class['asterisk::server::install'],
  }

  $files = [
    'ais.conf', 'amd.conf', 'asterisk.conf', 'calendar.conf', 'ccss.conf',
    'cdr_adaptive_odbc.conf', 'cdr.conf', 'cdr_custom.conf',
    'cdr_manager.conf', 'cdr_syslog.conf', 'cel.conf', 'cel_custom.conf',
    'cel_odbc.conf', 'cli.conf', 'cli_permissions.conf',
    'codecs.conf', 'dnsmgr.conf', 'dsp.conf', 'dundi.conf', 'enum.conf',
    'extconfig.conf', 'extensions.conf', 'features.conf', 'func_odbc.conf',
    'gtalk.conf', 'http.conf', 'iax.conf', 'iaxprov.conf',
    'indications.conf', 'jabber.conf', 'logger.conf', 'manager.conf',
    'meetme.conf', 'modules.conf', 'musiconhold.conf', 'queuerules.conf',
    'queues.conf', 'res_curl.conf', 'res_fax.conf', 'res_ldap.conf',
    'res_odbc.conf', 'res_stun_monitor.conf', 'rtp.conf', 'say.conf',
    'sip.conf', 'sip_notify.conf', 'smdi.conf', 'udptl.conf',
    'voicemail.conf',
  ]

  asterisk::function::customdir { $files: }

  file { "${asterisk::params::server::basedir}/extensions.conf.d/10templates.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/extensions.conf.d/10templates.conf.erb'),
    notify  => Exec['asterisk-module-reload-extensions.conf'],
    require => File["${asterisk::params::server::basedir}/extensions.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/extensions.conf.d/20includes.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/extensions.conf.d/20includes.conf.erb'),
    notify  => Exec['asterisk-module-reload-extensions.conf'],
    require => File["${asterisk::params::server::basedir}/extensions.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/extensions.conf.d/devices":
    ensure  => directory,
    force   => true,
    notify  => Exec['asterisk-module-reload-extensions.conf'],
    purge   => true,
    recurse => true,
    require => File["${asterisk::params::server::basedir}/extensions.conf.d/20includes.conf"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/10general.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/sip.conf.d/10general.conf.erb'),
    notify  => Exec['asterisk-module-reload-sip.conf'],
    require => File["${asterisk::params::server::basedir}/sip.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/10templates.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/sip.conf.d/10templates.conf.erb'),
    notify  => Exec['asterisk-module-reload-sip.conf'],
    require => File["${asterisk::params::server::basedir}/sip.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/20includes.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/sip.conf.d/20includes.conf.erb'),
    notify  => Exec['asterisk-module-reload-sip.conf'],
    require => File["${asterisk::params::server::basedir}/sip.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/devices":
    ensure  => directory,
    force   => true,
    notify  => Exec['asterisk-module-reload-sip.conf'],
    purge   => true,
    recurse => true,
    require => File["${asterisk::params::server::basedir}/sip.conf.d/20includes.conf"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/registrations":
    ensure  => directory,
    notify  => Exec['asterisk-module-reload-sip.conf'],
    purge   => true,
    recurse => true,
    require => File["${asterisk::params::server::basedir}/sip.conf.d/20includes.conf"],
  }

  file { "${asterisk::params::server::basedir}/sip.conf.d/trunks":
    ensure  => directory,
    force   => true,
    notify  => Exec['asterisk-module-reload-sip.conf'],
    purge   => true,
    recurse => true,
    require => File["${asterisk::params::server::basedir}/sip.conf.d/20includes.conf"],
  }

  file { "${asterisk::params::server::basedir}/queues.conf.d/20includes.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/queues.conf.d/20includes.conf.erb'),
    notify  => Exec['asterisk-module-reload-queues.conf'],
    require => File["${asterisk::params::server::basedir}/queues.conf.d"],
  }

  file { "${asterisk::params::server::basedir}/queues.conf.d/includes":
    ensure  => directory,
    force   => true,
    notify  => Exec['asterisk-module-reload-queues.conf'],
    purge   => true,
    recurse => true,
    require => File["${asterisk::params::server::basedir}/queues.conf.d"],
  }
}

# vim:sw=2:ts=2:expandtab
