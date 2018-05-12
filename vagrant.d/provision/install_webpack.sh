#!/bin/bash

echo "========================================================="
echo "== Install Webpack + Laravel-mix and its dependencies"
echo "========================================================="
echo "This will take several minutes. Please wait ..."

npm install -g --no-bin-links --save-dev axios
npm install -g --no-bin-links --save-dev bootstrap-sass
npm install -g --no-bin-links --save-dev cross-env
npm install -g --no-bin-links --save-dev fs
npm install -g --no-bin-links --save-dev ajv@6.2.1
npm install -g --no-bin-links --save-dev laravel-mix
npm install -g --no-bin-links --save-dev lodash
npm install -g --no-bin-links --save-dev velocity
npm install -g --no-bin-links --save-dev vue
npm install -g --no-bin-links --save-dev webpack
npm install -g --no-bin-links --save-dev browser-sync browser-sync-webpack-plugin webpack-dev-server
