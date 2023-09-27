# Install Nginx web server and configure puppet

exec { 'apt-get update':
  path => ['/usr/bin', '/bin'],
  command => 'apt-get update',
}

package { 'nginx':
  ensure         => 'installed',
  provider       => 'apt',
  install_options => ['-y'],
}

service { 'nginx':
  ensure => 'running',
  hasrestart => true,
  hasstatus  => true,
  enable=> true,
}

file { '/var/www/html/index1.html':
  ensure  => 'file',
  content => 'Hello World!',
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
',
}


exec { 'restart':
  path    => 'usr/bin:/bin',
  command => 'sudo service nginx restart',
}
