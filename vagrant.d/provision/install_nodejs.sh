#!/bin/bash

# Install nodejs
##################
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs
sudo npm install -g gulp gulp-cli
# sudo npm install babel-code-frame acorn-jsx node-sass@3.4.2

# Install Node.js v6.13.1
echo "=============================="
echo "== Install Node.js v6.13.1"
echo "=============================="
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash
export NVM_DIR="/home/vagrant/.nvm" && . "$NVM_DIR/nvm.sh"
nvm install 6.13.1
nvm use 6.13.1

# Install yarn
###############
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt-get -y install yarn
