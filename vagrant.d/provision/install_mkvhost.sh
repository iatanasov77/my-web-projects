#!/bin/sh
##########################################################################
# Install VankoSooft MkVhost 
#########################################################################

# Install VankoSoft PhpDevTools - mkvhost
git clone https://github.com/iatanasov77/php-dev-tools.git -b develop /usr/local/src/php-dev-tools
dos2unix /usr/local/src/php-dev-tools/*

#php -d phar.readonly=0 /usr/local/bin/mkphar /usr/local/src/php-dev-tools/mkvhost /usr/local/bin/mkvhost.phar main.php
mkphar /usr/local/src/php-dev-tools/mkvhost /usr/local/bin/mkvhost.phar main.php
chmod +x /usr/local/bin/mkvhost.phar
mv /usr/local/bin/mkvhost.phar /usr/local/bin/mkvhost
