# Install Nginx web server and configure puppet

exec { 'apt-get update':
  path    => ['/usr/bin', '/bin'],
  command => 'apt-get update',
}

package { 'nginx':
  ensure          => 'installed',
  provider        => 'apt',
  install_options => ['-y'],
}


file { '/var/www/html/index1.html':
  ensure  => 'file',
  content => 'Hello World!',
}


exec { 'restart':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
}
