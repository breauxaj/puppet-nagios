class nagios::pnp4nagios (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'php4nagios'
  }

  package { $required: ensure => $ensure }

}
