# Install Nginx web server and configure puppet

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

package { 'nginx':
  ensure         => 'installed',
  provider       => 'apt',
  install_option => ['-y'],
}

Sercice { 'nginx':
  ensure     => 'running',
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
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
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        root /var/www/html;
        error_page 404 /page_404.html;
        location = /page_404.html {
                root /usr/share/nginx/html;
                internal;
        }

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
