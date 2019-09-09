var Encore = require('@symfony/webpack-encore');
Encore
// the project directory where compiled assets will be stored
    .setOutputPath('public/assets/build/')

    // the public path used by the web server to access the previous directory
    .setPublicPath('/assets/build/')

    // delete old files before creating them
    .cleanupOutputBeforeBuild()
    
    // generate runtime.js that must to be loaded into the page template
    // bootstrap the environement
    .enableSingleRuntimeChunk()

    // add debug data in development
    .enableSourceMaps(!Encore.isProduction())

    // uncomment to create hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())
    
    // enable sass/scss parser
    .enableSassLoader()

    // show OS notifications when builds finish/fail
    .enableBuildNotifications()

    // empty the outputPath dir before each build
    .cleanupOutputBeforeBuild()

    // for "legacy" applications that require $/jQuery as a global variable
    .autoProvidejQuery()

    // see https://symfony.com/doc/current/frontend/encore/bootstrap.html
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })

    // add hash after file name
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    
    .addEntry( 'js/app', './assets/js/app.js' )
    
    
    .addStyleEntry('css/global', './assets/scss/app.scss')
    
    // Page Specific Scripts
    .addEntry( 'js/page_scripts/projects', './assets/js/page_scripts/projects.js' )
;

const config = Encore.getWebpackConfig();

config.watchOptions = {
    poll: true,
    ignored: /node_modules/
};

var path = require('path');
config.resolve.alias	= {
    // Force all modules to use the same jquery version.
    'jquery': path.join(__dirname, 'node_modules/jquery/src/jquery'),
    //'router': __dirname + '/assets/js/fos_js_routing.js'
};

module.exports = config;
