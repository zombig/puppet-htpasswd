puppet-htpasswd
===============

Manage htpasswd files with Puppet.

NOTE: This module only works on Linux systems.

REQUIREMENTS

This module requires the httpd-tools package.

NEW TYPE

This module creates an htpasswd resource type:

```puppet
htpasswd { 'foo':
  user         => 'bar',                                      # Name var
  password     => 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'  # Can be plain-text, md5, sha, or crypt
  passwordfile => '/etc/htpass'                               # Path to htpasswd file
}
```
