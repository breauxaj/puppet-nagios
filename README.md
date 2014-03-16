nagios
======

Installs nagios with the main plugins.

Samples
-------
```
include nagios
```
```
include nagios::plugins
```
```
nagios::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
