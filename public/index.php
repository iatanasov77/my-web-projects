<?php
error_reporting( E_ALL );
ini_set( 'display_errors', 1);

define( "APP_ROOT", realpath( __DIR__ . "/../" ) );

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();

/**
 * Services
 */
$app->register( new Silex\Provider\DoctrineServiceProvider(), array(
	'db.options'	=> array(
		'driver'	=> 'pdo_sqlite',
		'path'		=> __DIR__ . '/../app.db',
	),
));

$app->register( new Silex\Provider\TwigServiceProvider(), array(
	'twig.path'	=> __DIR__ . '/../resources/views',
));

$app->register( new Silex\Provider\AssetServiceProvider(), array(
	'assets.version' => 'v1',
	'assets.version_format' => '%s?version=%s',
	'assets.named_packages' => array(
		'css' => array('version' => 'css2', 'base_path' => '/whatever-makes-sense'),
		'images' => array('base_urls' => array('https://img.example.com')),
	),
));

/**
 * Twig Extensions
 */
$app->extend('twig', function( $twig, $app ) {
	$twig->addExtension(new \VankoSoft\MyProjects\Twig\ExtensionProject( $app ) );
	return $twig;
});

$app->extend('twig', function( $twig, $app ) {
	$twig->addExtension(new \VankoSoft\MyProjects\Twig\ExtensionTool( $app ) );
	return $twig;
});

/**
 * Controllers
 */
$app->mount('/', 		new VankoSoft\MyProjects\Controller\Dashboard() );
$app->mount('/tool', 	new VankoSoft\MyProjects\Controller\Tools() );
$app->mount('/project',	new VankoSoft\MyProjects\Controller\Projects() );

include APP_ROOT . '/config/app.php';

$app->run();