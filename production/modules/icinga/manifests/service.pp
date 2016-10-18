class icinga::service {
  service{$icinga::params::icinga_name:
    ensure    => running,
    hasstatus => true,
  }
}
