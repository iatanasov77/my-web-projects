#!/bin/bash

########################################################################
# NOT USE LIBRARIAN, AT NOW USED GIT SUBMODULES TO ADD PUPPET MODULES
########################################################################
	
cd /vagrant/vagrant.d/puppet

echo "Insttall Puppet modules with Librarian ..."
echo "Current dir: $(pwd)"

# Clear previous installation
#echo "Remove previous installed modules at ./modules"
#sudo rm -rf /vagrant/vagrant.d/puppet/modules/*
#sudo rm -rf /vagrant/vagrant.d/puppet/.tmp
#sudo rm -rf /vagrant/vagrant.d/puppet/.librarian
#sudo rm -f /vagrant/vagrant.d/puppet/Puppetfile.lock

# Run modules installation
echo "Start modules installation ..."
sudo librarian-puppet install --verbose

# Change directory to old one
cd --
