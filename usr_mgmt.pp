class dte::usr_mgmt{
 	user { 'oracle': 
		 ensure   => present,
  		 password => '$1$8JTmsMFS$9ktSuauNhX0rZij1TIwQt/',
	}

	file { 'ade':
                path => "/ade",
                ensure => "directory",
                mode => 777,
                owner => oracle,
                group => oinstall
        }
        
	file { 'work':
                path => "/u01/work",
                ensure => "directory",
                mode => 777,
                owner => oracle,
                group => oinstall,
        }


        file { 'auto_home_file':
                    path => '/etc/profile.d/auto_home.sh',
                    content => 'export AUTO_HOME=/usr/local/packages/',
        }

        file_line { 'auto_work-set':
                   path => '/etc/profile.d/auto_home.sh',
                   line => 'export AUTO_WORK=/u01/work',

        }
        file_line { 'proxy_set':
		  path => '/etc/rc.local',
		  line => '/usr/local/packages/bin/proxyDaemon 33033'
		}
}
