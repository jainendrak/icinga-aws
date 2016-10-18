class icinga::package {

  $ido_db= "icinga2-ido-${::icinga::dbtype}"

  $packages=[$ido_db, $icinga::params::icinga_name, icingaweb2, icingacli, nagios-plugins-all]

  package{ $packages:
    ensure => installed,
  }
    
}
