class asterisk::dahdi::server::init {
  include asterisk::dahdi::server::install
  include asterisk::dahdi::server::config
  include asterisk::dahdi::server::command

  File {
    group => $asterisk::params::dahdi::group,
    mode  => $asterisk::params::dahdi::mode,
    owner => $asterisk::params::dahdi::owner,
  }
}

# vim:sw=2:ts=2:expandtab
