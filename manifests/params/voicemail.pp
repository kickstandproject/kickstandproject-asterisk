class asterisk::params::voicemail inherits asterisk::params {
  $packagename = $::operatingsystem ? {
    default => 'asterisk-voicemail',
  }
}

# vim:sw=2:ts=2:expandtab
