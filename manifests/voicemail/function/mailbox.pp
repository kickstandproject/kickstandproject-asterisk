define asterisk::voicemail::function::mailbox(
  $email = '',
  $fullname = '',
  $description = '',
  $options = '',
) {
  require asterisk::voicemail::server

  # XXX TODO Why do we need this here?  For some reason puppet will not honor
  # existing one from asterisk::common::init.
  File {
    group => $asterisk::params::voicemail::group,
    mode  => $asterisk::params::voicemail::mode,
    owner => $asterisk::params::voicemail::owner,
  }

  $split = split($name, '@')
  $extension = $split[0]
  if ($split[1] != '') {
    $context = $split[1]
  } else {
    $context = 'default'
  }

  $base = "${asterisk::params::basedir}/voicemail.conf.d"
  $spool = "${asterisk::params::spooldir}/voicemail"

  if (!defined(File["${base}/10${context}.conf"])) {
    file { "${base}/10${context}.conf":
      ensure  => present,
      content => template('asterisk/etc/asterisk/voicemail.conf.d/20mailboxes.conf.erb'),
      notify  => Exec['asterisk-module-reload-app_voicemail.so'],
      purge   => true,
      recurse => true,
      require => File[$base],
    }

    file { "${base}/${context}":
      ensure  => directory,
      notify  => Exec['asterisk-module-reload-app_voicemail.so'],
      purge   => true,
      recurse => true,
      require => File[$base],
    }
  }

  file { "${base}/${context}/${extension}.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/voicemail.conf.d/default/template.conf.erb'),
    notify  => Exec['asterisk-module-reload-app_voicemail.so'],
    require => File["${base}/${context}"],
  }

  if (!defined(File["${spool}/${context}"])) {
    file { "${spool}/${context}":
      ensure  => directory,
      force   => true,
      notify  => Exec['asterisk-module-reload-app_voicemail.so'],
      purge   => true,
      recurse => true,
      require => File[$spool],
    }
  }

  file { "${spool}/${context}/${extension}":
    ensure  => directory,
    notify  => Exec['asterisk-module-reload-app_voicemail.so'],
    require => File["${spool}/${context}"],
  }

  file { "${spool}/${context}/${extension}/secret.conf":
    ensure  => present,
    content => template('asterisk/var/spool/asterisk/voicemail/secret.conf.erb'),
    notify  => Exec['asterisk-module-reload-app_voicemail.so'],
    replace => false,
    require => File["${spool}/${context}"],
  }
}

# vim:sw=2:ts=2:expandtab
