class asterisk::voicemail::server::install {
  package { $asterisk::params::voicemail::packagename:
    ensure  => present,
  }
}

# vim:sw=2:ts=2:expandtab
