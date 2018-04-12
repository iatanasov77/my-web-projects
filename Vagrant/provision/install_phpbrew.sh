#!/bin/bash

curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
sudo mv phpbrew /usr/local/bin/phpbrew

phpbrew init

echo "export PHPBREW_SET_PROMPT=1" >> ~/.bashrc
echo "source ~/.phpbrew/bashrc" >> ~/.bashrc

mkdir /home/vagrant/.phpbrew
chown vagrant:vagrant /home/vagrant/.phpbrew

# Quick start
# http://enzolutions.com/articles/2014/10/17/manage-php-versions-with-phpbrew/
