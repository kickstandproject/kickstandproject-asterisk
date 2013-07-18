define asterisk::function::sip::device(
  $extension,
  $fullname,
  $secret,
  $email   = '',
  $options = {},
) {
  require asterisk::server

  $channel = 'SIP'
  $exten_base = "${asterisk::params::basedir}/extensions.conf.d/devices"
  $sip_base = "${asterisk::params::basedir}/sip.conf.d/devices"

  $defaults = {
    'type'      => 'friend',
    'host'      => 'dynamic',
    'context'   => 'from-internal',
    'template'  => 'ksp-local-phone'
  }

  $options_real = merge($defaults, $options)

  if (!$options_real['description']) {
    $options_real['description'] = "${fullname} <${extension}>"
  }

  if (!$options_real['callerid']) {
    $options_real['callerid'] = "${fullname} <${extension}>"
  }

  if (!$options_real['mailbox']) {
    $options_real['mailbox'] = "${extension}@${options_real['context']}"
  }

  $split = split($name, '-')

  if ($split[1] != '') {
    $line = $split[1]
  } else {
    $line = '1'
  }

  $name_real = "${split[0]}-${line}"
  $options_real['md5secret'] = md5("${name_real}:asterisk:${secret}")

  file { "${exten_base}/${name_real}.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/extensions.conf.d/devices/template.conf.erb'),
    notify  => [
      Exec['asterisk-module-reload-extensions.conf'],
    ],
    require => File[$exten_base],
  }

  file { "${sip_base}/${name_real}.conf":
    ensure  => present,
    content => template('asterisk/etc/asterisk/sip.conf.d/devices/template.conf.erb'),
    notify  => [
      Exec['asterisk-module-reload-sip.conf'],
    ],
    require => File[$sip_base],
  }

  if ($options_real['mailbox'] != 'none') {
    asterisk::voicemail::function::mailbox { $options_real['mailbox']:
      description => $options_real['description'],
      email       => $email,
      fullname    => $fullname,
    }
  }
}

# vim:sw=2:ts=2:expandtab
