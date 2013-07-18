class asterisk::params::server inherits asterisk::params {
  $hasrestart = $::operatingsystem ? {
    default => true,
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => 'asterisk',
  }

  $processname = $::operatingsystem ? {
    default => 'asterisk',
  }

  $servicename = $::operatingsystem ? {
    default => 'asterisk',
  }
}

# vim:sw=2:ts=2:expandtab
