# - Configure SSH client for key-based authentication and disable password
# authentication

class shhConfig {
  file { '/etc/ssh/ssh_config' :
    ensure => 'file',
  }

  # Ensure SSH client uses the specified private key
  augeas { 'IdentityFile':
    context => "/files/etc/ssh/ssh_config",
    changes => ["set Host[.='*']/IdentityFile '~/.ssh/school'",],
    # notify  => Service['ssh.service '],  # Restart SSH service for changes
  }
  # disable password authentication in ssh configuration
  augeas { 'disable password':
    context  => '/files/etc/ssh/ssh_config',
    changes  => "set Host[.='*']/PasswordAuthentication no",
    # notify  => Service['ssh.service '],  # Restart SSH service for changes
  }
  # notify any changes made
  notify { 'SSH client configuarion updated':
    require => [
     File['/etc/ssh/ssh_config'],
     Augeas['disable password'],
     Augeas['disable password'],],
  }
}
include shhConfig
