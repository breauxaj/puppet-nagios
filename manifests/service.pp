define nagios::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
