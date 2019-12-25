class htpasswd::install(
  String $version = 'installed'
){
  package{ 'httpd-tools':
    ensure => $version,
  }
}
