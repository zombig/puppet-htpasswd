# Puppet
# users => {
#   bob => { password => my_very_good_passwd }
# }
# Hiera
# users:
#   bob:
#     password: my_very_good_passwd
class htpasswd (
  String $passwordfile,
  Hash   $users = {}
){
  class { '::htpasswd::install': }
  create_resources('::htpasswd::user', $users)
}
