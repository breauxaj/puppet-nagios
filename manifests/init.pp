class nagios {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'nrpe', 'nagios-plugins-all' ],
  }

  package { $required: ensure => latest }

  file { '/etc/nrpe.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    force   => true,
    purge   => true,
  }

  file { '/var/run/nrpe':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { '/etc/nagios/nrpe.cfg':
    ensure => absent,
  }

  file { '/etc/init.d/nrpe':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/nagios/nrpe.init'
  }

  group { 'nrpe':
    ensure => present,
    gid    => 126,
  }

  user { 'nrpe':
    ensure     => present,
    gid        => 126,
    home       => '/var/lib/nrpe',
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => 126,
  }

}
