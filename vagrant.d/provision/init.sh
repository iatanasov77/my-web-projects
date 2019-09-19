#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh

mkdir -p /etc/puppetlabs/facter/facts.d

if [ "$OS" == "Ubuntu" ]; then
	apt-get update -y
else
	# htop repository
	# This is for CentOS 7, For another centos versions see: https://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
	sudo wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
	sudo rpm -ihv --force epel-release-7-11.noarch.rpm
	
	# phpMyAdmin repository
	rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
	yum -y install epel-release
fi
