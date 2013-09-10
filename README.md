nagios
======

Installs nrpe with the main plugins. Use nagios::server to install the server
and configure monitoring.

Samples
=======
```
include nagios
```
```
nagios::service { 'default': ensure => running, enable => true }
```
```
nagios::config { 'default':
  server_port => 5666,
  server_address => '',
  allowed_hosts => '192.168.1.55',
  command_timeout => 60,
  connection_timeout = 300
}
```
```
nagios::disks { 'default':
  warning => 20,
  critical => 10
}
```
```
nagios::load { 'default':
  warning => '15,10,5',
  critical => '30,25,20'
}
```
```
nagios::procs { 'default':
  warning => 150,
  critical => 200
}
```
```
nagios::users { 'default':
  warning => 5,
  critical => 10
}
```

Server
------
```
include nagios::server
```
