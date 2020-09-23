#!/bin/bash

echo "installing Puppet"

if [ $ID == "centos" ]; then
    sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
    #sudo rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
    #sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    sudo yum -y install puppet
    
    sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet
    
    echo "ensure puppet service is running"
    sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'

else
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    sudo dpkg -i puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get -y install puppet
    
    echo "ensure puppet service is running"
    sudo puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
fi
