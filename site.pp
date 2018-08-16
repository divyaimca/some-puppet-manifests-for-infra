
node default {}

node 'slcn09vmf0207.us.org.com'{
 
 include dte::nfs_auto

}

node 'slcn09vmf0042.us.org.com'{
 include dte::nfs_auto
 include dte::lvm_conf
 include dte::usr_mgmt
 include dte::pkg_inst
}

node 'slcn09vmf0008.us.org.com'{
 include dte::pkg_inst
}
node 'slcn09vmf0041.us.org.com'{
 include dte::nfs_auto
 include dte::lvm_conf
 include dte::usr_mgmt
 include dte::pkg_inst


}
node 'slcn09vmf0077.us.org.com'{
 include dte::nfs_auto
 include dte::usr_mgmt
 include dte::pkg_inst
}
