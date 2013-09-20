class nagios::plugins {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios-plugins-all',
  }

  package { $required: ensure => latest }

}
