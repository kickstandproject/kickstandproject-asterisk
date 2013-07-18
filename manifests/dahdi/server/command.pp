class asterisk::dahdi::server::command {
  exec { 'asterisk-module-reload-chan_dahdi.conf':
    command     => 'asterisk -rx "module reload chan_dahdi.so"',
    refreshonly => true,
  }
}

# vim:sw=2:ts=2:expandtab
