class nagios {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  $conf = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/etc/nagios'
    ],
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/etc/nagios/conf.d',
      '/etc/nagios/objects',
      '/etc/nagios/private'
    ],
  }

  package { $required: ensure => latest }

  file { $conf:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'nagios',
    mode   => '0750',
  }

}
