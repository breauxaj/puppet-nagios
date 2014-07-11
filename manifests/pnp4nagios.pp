class nagios::pnp4nagios (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'php4nagios'
  }

  package { $required: ensure => $ensure }

  file { '/etc/httpd/conf.d/pnp4nagios.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nagios/pnp4nagios.txt',
  }

}
