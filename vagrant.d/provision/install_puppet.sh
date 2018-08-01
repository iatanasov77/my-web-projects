#!/bin/bash

echo "installing Puppet"
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get -y install puppet

echo "ensure puppet service is running"
sudo puppet resource service puppet ensure=running enable=true

echo "ensure puppet service is running for standalone install"
sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'

sudo apt-get -y install ruby-dev
sudo gem install librarian-puppet
sudo gem install curl
