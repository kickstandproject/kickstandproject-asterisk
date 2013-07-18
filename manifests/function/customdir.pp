define asterisk::function::customdir(
) {
  require asterisk::server

  File {
    group => $asterisk::params::group,
    mode  => $asterisk::params::mode,
    owner => $asterisk::params::owner,
  }

  $base = "${asterisk::params::server::basedir}/${name}.d"

  file { $base:
    ensure  => directory,
    force   => true,
    notify  => Exec["asterisk-module-reload-${name}"],
    purge   => true,
    recurse => true,
    require => File[$asterisk::params::server::basedir],
  }

  file { "${base}/custom.d":
    ensure  => directory,
    require => File[$base],
  }

  file { "${base}/15custom.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/sip.conf.d/15custom.conf.erb'),
    require => File[$base],
  }
}

# vim:sw=2:ts=2:expandtab
