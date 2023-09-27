# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure    => 'installed',
  require   => Exec['apt-get update'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

exec { 'restart':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
}
