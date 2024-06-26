#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh
source /vagrant/vagrant.d/provision/make_swap.sh

#source /vagrant/vagrant.d/provision/centos_stream.sh
source /vagrant/vagrant.d/provision/fix_box.sh

# PHP 7 and MySql 5.7
#source /vagrant/vagrant.d/provision/install_dependencies.sh

source /vagrant/vagrant.d/provision/install_puppet.sh
########################################################################
# NOT USE LIBRARIAN, AT NOW USED GIT SUBMODULES TO ADD PUPPET MODULES
########################################################################
#source /vagrant/vagrant.d/provision/install_ruby.sh
source /vagrant/vagrant.d/provision/install_puppet_librarian.sh
#source /vagrant/vagrant.d/provision/install_puppet_modules.sh
