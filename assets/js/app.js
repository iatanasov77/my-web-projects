/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

require( 'bootstrap' );

// Install plugins
require( 'datatables.net' )( window, $ )
require( 'datatables.net-bs4' )( window, $ );
//require('webpack-jquery-ui');
require('webpack-jquery-ui/autocomplete');

const imagesContext = require.context('../images', true, /\.(png|jpg|jpeg|gif|ico|svg|webp)$/);
imagesContext.keys().forEach( imagesContext );

require( './icons' );
