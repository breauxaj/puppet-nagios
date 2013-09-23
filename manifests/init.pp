class nagios {
  Class['nagios']->Class['apache']

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/etc/nagios',
      '/etc/nagios/conf.d',
      '/etc/nagios/objects',
      '/etc/nagios/private'
    ],
  }

  package { $required: ensure => latest }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
