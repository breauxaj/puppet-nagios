class nagios {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'nrpe', 'nagios-plugins-all' ],
  }

  package { $required: ensure => latest }

  file { '/etc/nrpe.d':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => 0755,
    recurse => true,
    force => true,
    purge => true,
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

define nagios::service ( $ensure = running,
                         $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

define nagios::config ( $server_port = 5666,
                        $server_address,
                        $allowed_hosts,
                        $command_timeout = 60,
                        $connection_timeout = 300 ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }    
                    
  $config = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/nrpe.cfg',
  }
    
  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nagios/nrpe.erb'),
    notify  => Service[$service],
  }

}

define nagios::disks ( $warning = 20,
                       $critical = 10 ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  file { '/etc/nrpe.d/check_disks.cfg':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template('nagios/disks.erb'),
    notify => Service[$service]
  }

}

define nagios::load ( $warning = '15,10,5',
                      $critical = '30,25,20' ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  file { '/etc/nrpe.d/check_load.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nagios/load.erb'),
    notify  => Service[$service],
  }

}

define nagios::procs ( $warning = 150,
                       $critical = 200 ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  file { '/etc/nrpe.d/check_procs.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nagios/procs.erb'),
    notify  => Service[$service],
  }

}

define nagios::users ( $warning = 5,
                       $critical = 10 ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  file { '/etc/nrpe.d/check_users.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nagios/users.erb'),
    notify  => Service[$service],
  }

}
