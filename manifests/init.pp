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

  package { $required:
    ensure  => latest,
    require => Package[ 'httpd', 'php' ],
  }

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

  file { '/etc/httpd/conf.d/nagios.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nagios/nagios.txt',
  }

}
