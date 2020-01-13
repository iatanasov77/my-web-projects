#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh
#source /vagrant/vagrant.d/provision/init.sh
source /vagrant/vagrant.d/provision/make_swap.sh
source /vagrant/vagrant.d/provision/install_puppet.sh

########################################################################
# NOT USE LIBRARIAN, AT NOW USED GIT SUBMODULES TO ADD PUPPET MODULES
########################################################################
#source /vagrant/vagrant.d/provision/install_ruby.sh
source /vagrant/vagrant.d/provision/install_puppet_librarian.sh
#source /vagrant/vagrant.d/provision/install_puppet_modules.sh
