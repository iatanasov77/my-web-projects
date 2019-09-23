#!/bin/bash

mkdir -p /etc/puppetlabs/facter/facts.d

if [ $ID == "centos" ]; then
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
    yum -y install epel-release
    
    rpm -ivh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    yum -y install yum-utils
    
    #########################################################################
    # USE PHP VERSION FROM .env
    #########################################################################
    # ENABLE_REPO = "yum-config-manager --enable remi-php${PHP_VERSION//.}"
    # eval $ENABLE_REPO
    yum-config-manager --enable remi-php72
    
    yum install -y php mod_php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql
    
    if [ ! -f /etc/httpd/modules/libphp7.2.so ]; then
        ln -s /usr/lib64/httpd/modules/libphp7.so /etc/httpd/modules/libphp7.2.so
    fi
else
	apt-get update -y
fi
