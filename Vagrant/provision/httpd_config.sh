#!/bin/bash

echo "Provsioning guest with httpd config..."

## Create Apache Virtual hosts

mkvhost -smyprojects.dev -d/vagrant/MyProjects -tsimple -f
