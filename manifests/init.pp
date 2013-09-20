class nagios {
  Class['nagios']->Class['apache']

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nagios',
      'nagios-plugins-all'
    ],
  }

  package { $required: ensure => latest }

}
