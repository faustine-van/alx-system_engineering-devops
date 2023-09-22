# kill process called killmenow

exec { 'kills a process named killmenow':
  command  => 'pkill killmenow',
  provider => 'shell',
}
