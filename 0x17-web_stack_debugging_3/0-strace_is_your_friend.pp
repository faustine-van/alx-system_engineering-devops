# fix whay apache2 is return 500 error
exec { 'fix 500 error':
  command  => 'sed -i "s/class-wp-locale.phpp/class-wp-locale.php/g" /var/www/html/wp-settings.php',
  provider => 'shell',
}
