class icinga::webgui::params {
  $dbtype                   = 'mysql'
  $dbhost                   = 'localhost'
  $dbuser                   = 'icinga_web'
  $dbpasswd                 = 'icinga_web'
  $dbname                   = 'icinga_web'
  $backend_dbtype           = 'mysql'
  $backend_dbhost           = 'localhost'
  $backend_dbuser           = 'icinga'
  $backend_dbpasswd         = 'icinga'
  $backend_dbname           = 'icinga'
  $db_overwrite_defaults    = false
  $db_config_file           = '/etc/icinga-web/conf.d/databases.xml'
  $db_default_config_file   = '/usr/share/icinga-web/app/config/databases.xml'
  $initdb                   = false
  $package_base             = 'icinga-web'
  $package_db               =
  {
    'RedHat' => 'icinga-web-',
    'Debian' => 'icinga-web-config-icinga2-ido-'
  }
  $db_schema                =
  {
    'RedHat' =>
    {
      'mysql' => '/usr/share/doc/icinga-web-1.13.0/schema/mysql.sql',
      'pgsql' => '/usr/share/doc/icinga-web-1.12.0/schema/pgsql.sql'
    },
    'Debian' =>
    {
      'mysql' => '/usr/share/dbconfig-common/data/icinga-web/install/mysql',
      'pgsql' => '/usr/share/dbconfig-common/data/icinga-web/install/pgsql'
    }
  }
}
