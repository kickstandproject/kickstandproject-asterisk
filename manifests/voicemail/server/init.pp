class asterisk::voicemail::server::init {
  include asterisk::voicemail::server::install
  include asterisk::voicemail::server::config
  include asterisk::voicemail::server::command

  File {
    group => $asterisk::params::voicemail::group,
    mode  => $asterisk::params::voicemail::mode,
    owner => $asterisk::params::voicemail::owner,
  }
}

# vim:sw=2:ts=2:expandtab
