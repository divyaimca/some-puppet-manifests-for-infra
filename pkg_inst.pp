class edt::pkg_inst {
   # file { "/etc/profile.d/export_proxy.sh":
#		content => "export http_proxy=www-proxy.us.org.com:80 \n export https_proxy=www-proxy.us.org.com:80",
#	}
    
    exec { "pkgs":
		command => "/usr/bin/yum -y install libXtst-devel libXrender-devel kernel-devel libXtst-devel.i686", 
	}
    
    package {"python-crypto": ensure => "installed",require => Exec['epel_repo'], }
    exec { "epel_repo":
		command => "/bin/rpm -ivh /usr/local/packages/epel-release-6-8.noarch.rpm"
        }
    $enhancers = [ "python-simplejson", "python-ldap", "pexpect.noarch", "words", "python-argparse" ]
    package { $enhancers: ensure => "installed",require => Exec['epel_repo'], }

    
    file { 'chef_pkg': 
    		path => "/tmp/chef-11.6.2-1.el6.x86_64.rpm",
    		ensure => present,
    		mode   => 755,
    		owner  => root,
    		group  => root,
    		source => "puppet:///extra_files/chef-11.6.2-1.el6.x86_64.rpm"
  	}
   exec { 'chef_clnt':
                command => "/bin/rpm -ivh /tmp/chef-11.6.2-1.el6.x86_64.rpm",
		require => File['chef_pkg'],
        }
   file { 'chef_file':
		path => "/home/oracle/.chef",
		ensure => directory,
		mode  => 755,
		owner => oracle,
		group => oinstall,
		source => "puppet:///extra_files/chef",
		recurse => true,
		recurselimit => 10,
		require => Exec['chef_clnt'],
 	}
   exec { 'fabric':
		command => "/usr/bin/yum -y install fabric",
	}

   exec { 'cloud-api' :
		command => "/bin/rpm -ivh http://api.orginternalucf2c.orgcorp.com/tools/Red%20Hat%20Enterprise%20Linux/6/python-cloud-api-14.1.14%2b20150312.001357%2brelease-1.el6.noarch.rpm",
		require => Exec['fabric'],
        }
   exec { 'cloud-cli' :
	       command => "/bin/rpm -ivh http://api.orginternalucf2c.orgcorp.com/tools/Red%20Hat%20Enterprise%20Linux/6/cloud-cli-14.1.14%2b20150312.001357%2brelease-1.el6.noarch.rpm",
	       require => Exec['nimbula-api'],
       }
}
