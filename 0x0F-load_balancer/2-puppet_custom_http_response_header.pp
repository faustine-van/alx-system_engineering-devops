exec {'custom HTTP header response':
  command  => 'sudo sed -i "/server_name _;/a\\\tadd_header X-Served-By $\hostname;" /etc/nginx/sites-available/default'
  provider => shell,
}

service {'nginx':
  ensure  => 'running',
  require => Package['nginx'].
}
