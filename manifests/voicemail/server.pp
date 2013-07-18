class asterisk::voicemail::server {
  require asterisk::server

  include asterisk::params::voicemail
  include asterisk::voicemail::server::init
}

# vim:sw=2:ts=2:expandtab
