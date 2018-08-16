class dte::nfs_auto {

file { '/etc/auto_devinfra':
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///extra_files/auto_devinfra"
  }

file { '/etc/auto_redhat':
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///extra_files/auto_redhat"
  }
file { '/etc/auto_remote':
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///extra_files/auto_remote"
  }
file { '/etc/auto_solaris':
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///extra_files/auto_solaris"
  }
file { '/etc/ade_autofs':
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///extra_files/ade_autofs"
  }


service { 'autofs':
   ensure => running
 }

}


