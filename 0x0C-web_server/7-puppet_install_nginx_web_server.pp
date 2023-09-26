# Install Nginx
class { 'nginx':
  ensure => 'installed',
}

# Create a custom Nginx configuration for the redirect
file { '/etc/nginx/sites-available/redirect_config':
  ensure => file,
  content => 'server {
    listen 80;
    server_name localhost;

    location / {
      root /var/www/html;
      index index.html;
    }

    location /redirect_me {
      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }
  }',
  require => Class['nginx'],
}

# Activate the custom Nginx configuration by creating a symbolic link
file { '/etc/nginx/sites-enabled/redirect_config':
  ensure => link,
  target => '/etc/nginx/sites-available/redirect_config',
  require => File['/etc/nginx/sites-available/redirect_config'],
  notify => Exec['nginx_reload'],
}

# Ensure Nginx is running and listening on port 80
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  hasstatus => true,
  hasrestart => true,
}

# Create the index.html file with "Hello World!" in /var/www/html
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Class['nginx'],
}

# Notify Nginx to reload the configuration when the redirect_config file changes
exec { 'nginx_reload':
  command     => 'service nginx reload',
  path        => '/usr/bin:/bin',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-enabled/redirect_config'],
}

