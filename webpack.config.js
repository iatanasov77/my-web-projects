var Encore = require('@symfony/webpack-encore');
Encore
// the project directory where compiled assets will be stored
    .setOutputPath('public/build/')

    // the public path used by the web server to access the previous directory
    .setPublicPath('/build/')

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
    
     .autoProvideVariables({
        "Routing": "Router" 
     })
     
     .addLoader({
        test: /jsrouting-bundle\/Resources\/public\/js\/router.js$/,
        loader: "exports-loader?router=window.Routing"
    })
    
    
     

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
    .addEntry( 'sb-admin', './assets/js/sb-admin.js' )
    
    //.addEntry('js/datepicker', './assets/js/datepicker.js')
    
    .addEntry( 'js/jquery.formautofill', './assets/js/jquery.formautofill.js' )
    
    .addStyleEntry('css/global', './assets/scss/app.scss')
    
    // Page Specific Scripts
    .addEntry( 'js/page_scripts/users', './assets/js/page_scripts/users.js' )
    .addEntry( 'js/page_scripts/models', './assets/js/page_scripts/models.js' )
    .addEntry( 'js/page_scripts/models_operations', './assets/js/page_scripts/models_operations.js' )
    .addEntry( 'js/page_scripts/model_operations_work', './assets/js/page_scripts/model_operations_work.js' )
    .addEntry( 'js/page_scripts/model_operations_work_add', './assets/js/page_scripts/model_operations_work_add.js' )
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
//var CopyWebpackPlugin = require('copy-webpack-plugin');
//config.plugins.push(
//    new CopyWebpackPlugin([
//    	{ from: 'node_modules/gijgo/fonts', to: 'fonts' } 
//    ]) 
//);


module.exports = config;
