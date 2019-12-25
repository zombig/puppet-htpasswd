# Simple wrapper for make for Hiera friendly
define htpasswd::user(
  String $password,
  String $user         = $title,
  String $passwordfile = $::htpasswd::passwordfile,
){
  htpasswd{"${user}-htpasswd":
    user         => $user,
    password     => $password,
    passwordfile => $passwordfile,
  }
}