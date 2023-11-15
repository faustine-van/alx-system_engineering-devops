#  let’s fix our stack so that we get to 0
exec { 'replacing':
  provider => 'shell',
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx && sudo service nginx restart',
}
