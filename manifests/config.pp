define nagios::config (

) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  file { '/etc/nagios/nagios.cfg':
    ensure => present,
    notify => Service[$service],
  }

  file { '/etc/nagios/cgi.cfg':
    ensure => present,
    notify => Service[$service],
  }

}
