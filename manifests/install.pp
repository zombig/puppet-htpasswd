class htpasswd::install{
  package{ 'httpd-tools':
    ensure => installed,
  }
}
