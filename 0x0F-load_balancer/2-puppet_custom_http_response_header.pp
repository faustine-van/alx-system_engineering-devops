# automate the task of creating a custom HTTP header response, but with Puppet.

exec { 'update':
  command => '/usr/bin/apt-get update',
}

-> package { 'nginx':
  ensure  => 'present',
}

-> exec { 'X-Served-By':
  command  => 'sed -i "42i	add_header X-Served-By $\hostname;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

-> exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => 'shell',
}
