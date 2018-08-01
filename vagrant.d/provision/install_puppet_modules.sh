#!/bin/bash

cd /vagrant/Vagrant/puppet

echo "Insttall Puppet modules with Librarian ..."
echo "Current dir: $(pwd)"

# Clear previous installation
echo "Remove previous installed modules at ./modules"
sudo rm -rf /vagrant/Vagrant/puppet/modules/*
sudo rm -rf /vagrant/Vagrant/puppet/.tmp
sudo rm -rf /vagrant/Vagrant/puppet/.librarian
sudo rm -f /vagrant/Vagrant/puppet/Puppetfile.lock

# Workaround: Puppet cannot find installed modules
echo "Remove /usr/share/puppet/modules and link that dir to current installed modules ./modules"
sudo rm -rf /usr/share/puppet/modules
sudo ln -sf /vagrant/Vagrant/puppet/modules /usr/share/puppet/modules

# Run modules installation
echo "Start modules installation ..."
librarian-puppet install --verbose

# Change directory to old one
cd --
