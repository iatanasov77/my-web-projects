<?php
error_reporting( E_ALL );
ini_set( 'display_errors', 1);

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();

$app->register( new Silex\Provider\DoctrineServiceProvider(), array(
	'db.options'	=> array(
		'driver'	=> 'pdo_sqlite',
		'path'		=> __DIR__ . '/../app.db',
	),
));

$app->register(new Silex\Provider\TwigServiceProvider(), array(
	'twig.path'	=> __DIR__ . '/views',
));

//$app['db']->executeUpdate($sql, array('newValue', (int) $id));

$app->get('/', function ( $name ) use ( $app ) {
	$projects	= $app['db']->fetchAll( 'SELECT * FROM projects' );
	
	return $app['twig']->render( 'dashboard/index.twig', array(
		'projects' => $projects,
	));
});

$app->run();
