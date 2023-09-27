# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

package { 'nginx':
  ensure         => 'installed',
  provider       => 'apt',
  install_option => ['-y'],
}

exec { 'nginx':
  path => ['/usr/bin', '/bin']
  command => 'nc -l -p 80',
}

exec { '/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!',
}

exec { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  content =>
'
server {
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
