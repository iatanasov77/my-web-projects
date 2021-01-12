#!/bin/bash
source /vagrant/vagrant.d/provision/detect_linux.sh

if [ $ID == "ubuntu" ]; then
    # FIX SESSION READ/WRITE FOR PHP ON UBUNTO
    chmod 777 /var/lib/php/sessions

    #################################################################
    # Workaround for a fucking bug:
    # Created from puppet virtual host has "AllowOverride None"
    # and Laravel rewrite rules not working
    # The next is a hard fix for this.
    echo "Workaround for: Created from puppet virtual host has 'AllowOverride None'"
    sed "$(grep -n -m1 "AllowOverride None" /etc/apache2/sites-available/25-${HOSTNAME}.conf |cut -f1 -d:)s/.*/AllowOverride All/" /etc/apache2/sites-available/25-${HOSTNAME}.conf > /etc/apache2/sites-available/25-${HOSTNAME}.conf.FIXED
    cp -f /etc/apache2/sites-available/25-${HOSTNAME}.conf.FIXED /etc/apache2/sites-available/25-${HOSTNAME}.conf
    rm /etc/apache2/sites-available/25-${HOSTNAME}.conf.FIXED
    service apache2 restart
fi
