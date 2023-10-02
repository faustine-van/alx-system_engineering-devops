# automate the task of creating a custom HTTP header response, but with Puppet.

exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

exec { 'X-Served-By':
  command  => 'sed -i "42i	add_header X-Served-By $\hostname;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
