# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get update'],
}

Sercice { 'nginx':
  ensure     => 'running',
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
}
exec { 'list to port':
  path    => 'usr/bin:/bin',
  command => 'echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html',
  require => Package['nginx'],
}

$string = "\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;"

exec { '/redirect_me is redirecting to another page':
  path    => 'usr/bin:/bin',
  command => 'sudo sed -i "40i $string" /etc/nginx/sites-available/default',
  require => Exec['list to port'],
}

exec { 'append to the default file':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
  require => Exec['/redirect_me is redirecting to another page'],
}
