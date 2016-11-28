<?php
error_reporting( E_ALL );
ini_set( 'display_errors', 1);

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
	'twig.path'	=> __DIR__ . '/View',
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
 * Controllers
 */
$app->mount('/', 			new VankoSoft\MyProjects\Controller\Dashboard() );
$app->mount('/tools', 		new VankoSoft\MyProjects\Controller\Tools() );
$app->mount('/projects',	new VankoSoft\MyProjects\Controller\Projects() );

$app['debug'] = true;
$app->run();
