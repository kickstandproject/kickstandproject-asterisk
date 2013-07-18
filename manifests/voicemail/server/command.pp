class asterisk::voicemail::server::command {
  exec { 'asterisk-module-reload-app_voicemail.so':
    command     => 'asterisk -rx "module reload app_voicemail.so"',
    refreshonly => true,
  }
}

# vim:sw=2:ts=2:expandtab
