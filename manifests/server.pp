class nagios::server {
  Class['nagios::server']->Class['apache']

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nagios',
  }

  package { $required: ensure => latest }

}
