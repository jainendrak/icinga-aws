node default {
class{'::epel':}

class{'::icinga':
  initdb           => true,
  with_classicui   => false,
  enabled_features => ['statusdata', 'compatlog', 'command'],
}
class { 'icingaweb2':
## backend database
dbhost     => 'localhost',
dbtype     => 'mysql',
dbname     => 'icinga',
dbuser     => 'icinga',
dbpasswd   => 'icinga',
#dbame      => 'icinga',
## frontend database
   dbwebtype   => 'mysql',
   dbwebhost   => 'localhost',
   dbwebport   => '3306',
   dbwebuser   => 'icinga_web',
   dbwebpasswd => 'icinga_web',
   dbwebname   => 'icinga_web',
## modules list
   modules     => ['monitoring']
}

class{'::icinga::webgui':
  initdb              => false,    
}

class { '::mysql::server':
  root_password           => 'strongpassword',
  remove_default_accounts => true,
  override_options        => $override_options
}

class { 'apache':
  purge_configs => false,   
}

 class {'::apache::mod::php': }

mysql::db { 'icinga':
  user     => 'icinga',
  password => 'icinga',
  host     => 'localhost',
  grant    => ['ALL'],
}

mysql::db { 'icinga_web':
  user     => 'icinga_web',
  password => 'icinga_web',
  host     => 'localhost',
  grant    => ['ALL'],
}
#class {"icinga::checks" :}
}
