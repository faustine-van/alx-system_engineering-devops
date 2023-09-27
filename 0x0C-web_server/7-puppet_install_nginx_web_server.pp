# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get update'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

exec { 'direct_me':
  command  => 'sed -i "25i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell',
}
service { 'nginx':
  ensure  => 'running',
  require => Exec['nginx'],
}
