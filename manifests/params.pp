class asterisk::params {
  $basedir = $::operatingsystem ? {
    default => '/etc/asterisk',
  }

  $group = $::operatingsystem ? {
    default => 'asterisk',
  }

  $mode = $::operatingsystem ? {
    default => '0640',
  }

  $owner = $::operatingsystem ? {
    default => 'asterisk',
  }

  $spooldir = $::operatingsystem ? {
    default => '/var/spool/asterisk',
  }
}

# vim:sw=2:ts=2:expandtab
