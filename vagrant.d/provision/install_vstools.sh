#!/bin/sh
##########################################################################
# VankoSoft Tools
#########################################################################

# Install VankoSoft PhpDevTools - bumpversion
wget https://raw.github.com/iatanasov77/php-dev-tools/develop/bumpversion.php
chmod +x bumpversion.php
mv bumpversion.php /usr/local/bin/bumpversion

# Install VankoSoft PhpDevTools - mkphar
wget https://raw.github.com/iatanasov77/php-dev-tools/develop/mkphar.php
chmod +x mkphar.php
mv mkphar.php /usr/local/bin/mkphar

# Install VankoSoft PhpDevTools - mkvhost
git clone https://github.com/iatanasov77/php-dev-tools.git -b develop /usr/local/src/php-dev-tools
php -d phar.readonly=0 /usr/local/bin/mkphar /usr/local/src/php-dev-tools/mkvhost /usr/local/bin/mkvhost.phar main.php
chmod +x /usr/local/bin/mkvhost.phar
mv /usr/local/bin/mkvhost.phar /usr/local/bin/mkvhost
