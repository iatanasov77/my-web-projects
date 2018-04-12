#!/bin/bash

echo "Provsioning guest with httpd config..."

## Create Apache Virtual hosts

/usr/bin/php /usr/local/bin/mkvhost -smyprojects.lh -d/vagrant/web -tsimple -f

## Add an phpMyAdmin alias
sudo cp -f /vagrant/Vagrant/provision/etc/httpd/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf
## Disable autoindex config because it has aliases that conflict with my public directories
sudo mv /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/autoindex.conf.BACK
