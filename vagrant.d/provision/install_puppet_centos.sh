#!/bin/bash

echo "installing Puppet"
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum -y install puppet

sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet

echo "ensure puppet service is running"
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

echo "ensure puppet service is running for standalone install"
sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'


sudo yum install -y rubygems
sudo gem install librarian-puppet

cd /vagrant/Vagrant/puppet
librarian-puppet install --verbose
