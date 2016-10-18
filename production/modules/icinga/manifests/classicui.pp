class icinga::classicui
inherits icinga::classicui::params {
  Class[icinga::repo] -> Class[icinga::classicui::package]

  class { 'icinga::classicui::package': }
  }
