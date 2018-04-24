#!/bin/bash

echo "Insttall Puppet modules with Librarian ..."

# Clear previous installation
#sudo rm -rf /vagrant/Vagrant/puppet/modules/*
sudo rm -rf /vagrant/Vagrant/puppet/.tmp
sudo rm -rf /vagrant/Vagrant/puppet/.librarian
sudo rm -f /vagrant/Vagrant/puppet/Puppetfile.lock

# Workaround: Puppet cannot find installed modules
sudo rm -rf /usr/share/puppet/modules
sudo ln -sf /vagrant/Vagrant/puppet/modules /usr/share/puppet/modules

# Run modules installation
cd /vagrant/Vagrant/puppet
librarian-puppet install --verbose
