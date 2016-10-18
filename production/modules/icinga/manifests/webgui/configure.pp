class icinga::webgui::configure {

  file{$icinga::webgui::params::db_config_file:
    ensure  => present,
    content => template('icinga/webgui/databases.erb'),
  }
  
  if $icinga::webgui::initdb {

    $schema = $icinga::webgui::db_schema[$osfamily][$icinga::webgui::dbtype]

    icinga::common::initdb{'icinga::webgui::configure::init-db':
      dbtype     => $icinga::dbtype,
      test_table => 'cronk',
      schema     => $schema,
      dbuser     => $icinga::webgui::dbuser,
      dbpasswd   => $icinga::webgui::dbpasswd,
      dbhost     => $icinga::webgui::dbhost,
      dbname     => $icinga::webgui::dbname,
    }
  }
  
}
