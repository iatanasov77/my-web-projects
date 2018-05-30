#!/bin/bash

echo "========================================================="
echo "== Install Webpack + Laravel-mix and its dependencies"
echo "========================================================="
echo "This will take several minutes. Please wait ..."

npm install -g axios
npm install -g bootstrap-sass
npm install -g cross-env
npm install -g fs
npm install -g ajv@6.2.1
npm install -g laravel-mix --dev --save
npm install -g lodash
npm install -g velocity
npm install -g vue

# Laravel Mix is not compatible with Webpack 4 yet. See: https://github.com/JeffreyWay/laravel-mix/issues/1601
npm install -g webpack@^3.0
#npm install -g webpack-cli

npm install -g browser-sync
#npm install -g uglifyjs-webpack-plugin
npm install -g browser-sync-webpack-plugin
npm install -g webpack-dev-server
npm install -g minimist

# Babel
#npm install -g babel
npm install -g babel-cli
#npm install -g babili-webpack-plugin
npm install -g babel-plugin-transform-object-rest-spread --save-dev
npm install -g babel-plugin-transform-runtime --save-dev
npm install -g babel-preset-env --save-dev

# I dont know even this works but i create a symlink from vagrant home 
# to the global node's directory bellow that definitely works
export NODE_PATH=/usr/local/lib/node_modules
# declare -r NODE_PATH=/usr/local/lib/node_modules

ln -s /usr/local/lib/node_modules /home/vagrant/.node_modules
