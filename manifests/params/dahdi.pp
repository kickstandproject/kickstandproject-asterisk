class asterisk::params::dahdi inherits asterisk::params {
  $packagename = $::operatingsystem ? {
    default => 'asterisk-dahdi',
  }
}

# vim:sw=2:ts=2:expandtab
