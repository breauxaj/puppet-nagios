define nagios::config (

) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  file { '/etc/nagios/nagios.cfg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    notify => Service[$service],
  }

  file { '/etc/nagios/cgi.cfg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service[$service],
  }

}
