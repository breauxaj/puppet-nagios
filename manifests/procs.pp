define nagios::procs (
  $warning = 150,
  $critical = 200
) {
  $service = $::operatingsystem ? {
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
