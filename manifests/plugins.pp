class nagios::plugins {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nagios-plugins-all',
      'nagios-plugins-check-updates'
    ]
  }

  package { $required: ensure => latest }

}
