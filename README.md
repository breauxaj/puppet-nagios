nagios
======

Installs nagios with the main plugins.

Samples
-------
```
include nagios
```
```
nagios::service { 'default': ensure => running, enable => true }
```
