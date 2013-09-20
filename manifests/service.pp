define nagios::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nrpe',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
