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
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => '
server {
    listen 80;
    server_name localhost;

    location / {
      root /var/www/html;
      index index.html;
    }

    location /redirect_me {
      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }
}
',
}

exec { 'restart':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
}
