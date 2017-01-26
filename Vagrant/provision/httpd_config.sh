#!/bin/bash

echo "Provsioning guest with httpd config..."

## Create Apache Virtual hosts

/usr/bin/php /usr/local/bin/mkvhost -smyprojects.dev -d/vagrant/web -tsimple -f
