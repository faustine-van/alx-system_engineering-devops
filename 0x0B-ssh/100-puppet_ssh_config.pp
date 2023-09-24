# - Configure SSH client for key-based authentication and disable password
# authentication


# Ensure SSH client uses the specified private key
exec { 'echo':
  path    => 'usr/bin:/bin',
  command => 'echo "    IdentityFile ~/.ssh/school\n    PasswordAuthentication no" >> /etc/ssh/ssh_config',
  returns => [0,1],
}















