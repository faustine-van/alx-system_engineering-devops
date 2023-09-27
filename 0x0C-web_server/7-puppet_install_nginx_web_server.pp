# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}
