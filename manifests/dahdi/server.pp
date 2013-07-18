class asterisk::dahdi::server {
  require asterisk::server

  include asterisk::params::dahdi
  include asterisk::dahdi::server::init
}

# vim:sw=2:ts=2:expandtab
