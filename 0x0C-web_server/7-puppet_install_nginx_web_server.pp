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

exec { 'configure redirect_me':
  path     => ['usr/bin','/bin]',
  command  => 'sudo sed -i "40i \\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites_available/default',
  provider => 'shell',

}
exec { 'restart':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
}
