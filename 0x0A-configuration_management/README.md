0x0A. Configuration management


#### Note on Versioning
. Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

Install puppet
```
$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet
```
[Puppet 5 Docs](https://www.puppet.com/docs/puppet/5.5/type)

Install puppet-lint
`$ gem install puppet-lint`
