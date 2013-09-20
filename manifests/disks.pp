define nagios::disks (
  $warning = 20,
  $critical = 10
) {
  $service = $::operatingsystem ? {
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
