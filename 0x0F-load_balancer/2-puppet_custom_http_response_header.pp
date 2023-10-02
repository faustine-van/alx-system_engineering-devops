# automate the task of creating a custom HTTP header response, but with Puppet.

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
  command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
}
$str     => 'error_page 404 /page_404.html;\n\tlocation = /page_404.html {\n\t\troot /usr/share/nginx/html;\n\t\tinternal;\n\t}"'
exec { 'configre 404-page':
  command  => 'sed -i "41i	$str /etc/nginx/sites-available/default',
  provider => 'shell',
}
exec { 'X-Served-By':
  command  => 'sed -i "42i	add_header X-Served-By $\hostname;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
