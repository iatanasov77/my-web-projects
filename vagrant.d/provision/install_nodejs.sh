#!/bin/bash

# Install Node.js v6.13.1
echo "=============================="
echo "== Install Node.js v6.13.1"
echo "=============================="
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash
export NVM_DIR="/home/vagrant/.nvm" && . "$NVM_DIR/nvm.sh"
nvm install 6.13.1
