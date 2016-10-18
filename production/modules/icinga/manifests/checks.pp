class icinga::checks {
	file{ "/usr/lib64/nagios/plugins" :
		ensure => 'directory' ,
	        owner   => 'root' ,
		group   => 'root' ,
      		mode    => '0755' ,
		source =>"/etc/puppetlabs/code/environments/production/modules/icinga/files/checks/",
      		recurse => true ,
#     		purge   => true ,

# 	     ignore  => '.svn' ,

      		alias   => "external-plugins-dir" ,

#      require => Class['nagios::plugins::install'] ,
#		source =>"/etc/puppetlabs/code/environments/production/modules/icinga/files/checks/",
		}
	file { "/etc/icinga2/conf.d/commands.conf" :
		ensure => "file",
		source => "/etc/puppetlabs/code/environments/production/modules/icinga/files/commands.conf"
		}
	file { "/etc/icinga2/conf.d/services.conf" : 
		ensure => "file" ,
		source => "/etc/puppetlabs/code/environments/production/modules/icinga/files/services.conf"
}
	file { "/etc/php.ini" :
		ensure => 'file',
		source => "/etc/puppetlabs/code/environments/production/modules/icinga/files/php.ini"
		
}
}
