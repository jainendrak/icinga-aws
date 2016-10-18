class icinga::classicui::package {

  #
  # That's a dirty-hack.
  # It is needed since the two packages need to be installed in one yum shot
  # 
  exec{'icinga::classicui::install':
    command => "/usr/bin/yum -y install ${icinga::classicui::params::packages}",
    creates => '/var/log/icinga/gui',
    notify  => [ Service[$icinga::icinga_name], Service['httpd'] ]
  }
  
}
