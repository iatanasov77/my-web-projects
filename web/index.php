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

$app->register(new Silex\Provider\TwigServiceProvider(), array(
	'twig.path'	=> __DIR__ . '/views',
));

$app->register(new Silex\Provider\AssetServiceProvider(), array(
		'assets.version' => 'v1',
		'assets.version_format' => '%s?version=%s',
		'assets.named_packages' => array(
			'css' => array('version' => 'css2', 'base_path' => '/whatever-makes-sense'),
			'images' => array('base_urls' => array('https://img.example.com')),
		),
));

/**
 * Routes
 */
$app->get('/', function () use ( $app )
{
	$projects	= $app['db']->fetchAll( 'SELECT * FROM projects' );
	$tools		= $app['db']->fetchAll( 'SELECT * FROM tools' );
	
	return $app['twig']->render( 'dashboard/index.twig', array(
		'projects'	=> $projects,
		'tools'		=> $tools
	));
});

$app->get('/project/install', function ( $id ) use ( $app )
{
	$project	= $app['db']->fetchOne( sprintf( 'SELECT * FROM projects WHERE id=%d', $id ) );

	return $app['twig']->render( 'dashboard/index.twig', array(
			'projects' => $projects,
	));
});

$app->get('/tool/install', function ( $id ) use ( $app )
{
	$tool	= $app['db']->fetchOne( sprintf( 'SELECT * FROM tools WHERE id=%d', $id ) );

	return $app['twig']->render( 'dashboard/index.twig', array(
			'projects' => $projects,
	));
});

$app['debug'] = true;
$app->run();
