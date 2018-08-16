class dte::lvm_conf {
include dte::nfs_auto

file { "u01":
	path => "/u01",
        ensure => "directory",
	mode => 777,
	owner => oracle,
	group => oinstall
}
class { 'lvm':
  volume_groups    => {
    'appsvg' => {
      physical_volumes => [ '/dev/xvda5' ],
      logical_volumes  => {
        'appslv' => {
          'size'              => '155G',
          'mountpath'         => '/u01',
          'mountpath_require' => true,
        },

      },
    },
  },
 } 
 exec { 'create_swap':
  command => "/sbin/lvcreate -L +14g -n swaplv appsvg && /sbin/mkswap /dev/mapper/appsvg-swaplv && /sbin/swapon /dev/mapper/appsvg-swaplv",
  require => Class['lvm'],
 }
 fstab { 'fstab_swap_entry':
  source => '/dev/mapper/appsvg-swaplv',
  dest   => 'swap',
  type   => 'swap',
  opts   => 'defaults',
  dump   => 0,
  passno => 0,
  require => Class['lvm'],
 }

 
 exec { "mount_all":
	command => "/bin/mount -a",
      }
}

