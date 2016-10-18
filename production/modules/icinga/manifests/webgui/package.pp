class icinga::webgui::package {

  $package_base=$icinga::webgui::params::package_db[$osfamily]
  $package_db="${package_base}${icinga::webgui::dbtype}"

  package{ $icinga::webgui::params::package_base:
    ensure => installed,
  }

  package{ $package_db:
    ensure => installed,
  }

}
