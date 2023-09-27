# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure          => 'installed',
  provider        => 'apt',
  install_options => ['-y'],
  require         => Exec['apt-get update'],
}


file { '/var/www/html/index1.html':
  ensure  => 'file',
  content => 'Hello World!',
}
