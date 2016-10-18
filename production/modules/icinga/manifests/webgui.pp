class icinga::webgui (
  $dbtype                = $icinga::webgui::params::dbtype,
  $dbhost                = $icinga::webgui::params::dbhost,
  $dbuser                = $icinga::webgui::params::dbuser,
  $dbpasswd              = $icinga::webgui::params::dbpasswd,
  $dbname                = $icinga::webgui::params::dbname,
  $backend_dbtype        = $icinga::webgui::params::backend_dbtype,
  $backend_dbhost        = $icinga::webgui::params::backend_dbhost,
  $backend_dbuser        = $icinga::webgui::params::backend_dbuser,
  $backend_dbpasswd      = $icinga::webgui::params::backend_dbpasswd,
  $backend_dbname        = $icinga::webgui::params::backend_dbname,
  $initdb                = $icinga::webgui::params::initdb
) inherits icinga::webgui::params {

  case $::osfamily {
    'RedHat', 'Debian': {

      Class[icinga::repo] -> Class[icinga::webgui::package]
      Class[icinga::webgui::package] -> Class[icinga::webgui::configure]
      
      class { 'icinga::webgui::package': }
      class { 'icinga::webgui::configure': }
      
    }
    default: { fail("Currently unavailable for ${::osfamily}") }
  }


}
