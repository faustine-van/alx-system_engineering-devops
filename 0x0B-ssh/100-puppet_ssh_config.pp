# - Configure SSH client for key-based authentication and disable password
# authentication

class shhConfig {
  file { '/etc/ssh/ssh_config' :
    ensure => 'file',
  }

  # Ensure SSH client uses the specified private key
  file_line { 'IdentityFile':
    path  => '/etc/ssh/ssh_config',
    line  => '    IdentityFile ~/.ssh/school',
    match => '^#?\s*IdentityFile\s.*$',
  }
  # disable password authentication in ssh configuration
  file_line { 'disable password':
    path  => '/etc/ssh/ssh_config',
    line  => '    PasswordAuthentication no',
    match => '^#?\s*PasswordAuthentication\s.*$',
  }
  # notify any changes made
  notify { 'notify change':
    require => File['/etc/ssh/ssh_config'],
  }
}
include shhConfig
