#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh
source /vagrant/vagrant.d/provision/make_swap.sh

#######################################################################################
# The CentOS Linux 8 packages have been removed from the mirrors. 
# If you haven’t already, convert any CentOS Linux 8 installations to Stream 8
#######################################################################################
if [ $CENTOS_8_STREAM_REPOS == "true" ]; then
    dnf -y --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos
    dnf -y distro-sync
fi

# PHP 7 and MySql 5.7
#source /vagrant/vagrant.d/provision/install_dependencies.sh

source /vagrant/vagrant.d/provision/install_puppet.sh

########################################################################
# NOT USE LIBRARIAN, AT NOW USED GIT SUBMODULES TO ADD PUPPET MODULES
########################################################################
#source /vagrant/vagrant.d/provision/install_ruby.sh
source /vagrant/vagrant.d/provision/install_puppet_librarian.sh
#source /vagrant/vagrant.d/provision/install_puppet_modules.sh
