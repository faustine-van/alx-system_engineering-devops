# - Configure SSH client for key-based authentication and disable password
# authentication

class shhConfig {
  $ssh_config_file = '/etc/ssh/ssh_config'

  $config_content = "
    IdentityFile ~/.ssh/id_rsa
    PasswordAuthentication yes
  "

  file { $ssh_config_file:
    ensure  => 'present',
    content => $config_content,
  }
}

include shhConfig
