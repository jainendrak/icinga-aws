class icinga::configure {
  
  icinga::feature { $icinga::enabled_features:
    action => 'enable'
  }
  
  icinga::feature { "ido-${icinga::dbtype}":
    action => 'enable'
  }

  icinga::feature{ $icinga::disabled_features:
    action => 'disable'
  }
  
  file{"${icinga::params::features_avail_path}/ido-${::icinga::dbtype}.conf" :
    content => template("icinga/ido-${::icinga::dbtype}.erb"),
    notify  => Class['::icinga::service'],
  }

  if $icinga::initdb {
    $schema="/usr/share/icinga2-ido-${::icinga::dbtype}/schema/${icinga::dbtype}.sql"

    icinga::common::initdb{'icinga::configure::init-db':
      dbtype     => $icinga::dbtype,
      test_table => 'icinga_hosts',
      schema     => $schema,
      dbuser     => $icinga::dbuser,
      dbpasswd   => $icinga::dbpasswd,
      dbhost     => $icinga::dbhost,
      dbname     => $icinga::dbname,
    }
  }
}
