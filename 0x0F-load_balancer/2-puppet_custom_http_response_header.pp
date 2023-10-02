exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
}
exec {'redirect_me':
	command => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
	provider => 'shell',
}

exec { 'custom HTTP header response':
  command  => 'sudo sed -i "/server_name _;/a\\\tadd_header X-Served-By $\hostname;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}
