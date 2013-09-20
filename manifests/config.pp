define nagios::config (
  $server_port = 5666,
  $server_address,
  $allowed_hosts,
  $command_timeout = 60,
  $connection_timeout = 300
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }    
                    
  $config = $::operatingsystem ? {
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
