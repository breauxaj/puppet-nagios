define nagios::load (
  $warning = '15,10,5',
  $critical = '30,25,20'
) {
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
