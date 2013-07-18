class asterisk::server::init {
  include asterisk::server::install
  include asterisk::server::config
  include asterisk::server::service
  include asterisk::server::command

  File {
    group => $asterisk::params::group,
    mode  => $asterisk::params::mode,
    owner => $asterisk::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab
