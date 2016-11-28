<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

class Tools implements ControllerProviderInterface
{
	private $app;

	public function connect( Application $app )
	{
		$this->app		= $app;
		$controllers	= $this->app['controllers_factory'];
		
		$controllers->get( '/install', array( $this, 'installAction' ) );
		
		return $controllers;
	}
	
	public function installAction()
	{
		$id		= $this->app->get( 'request' )->getParam( 'id', null );
		$tool	= $this->app['db']->fetchOne( sprintf( 'SELECT * FROM tools WHERE id=%d', $id ) );
	
		return $this->app['twig']->render( 'dashboard/index.twig', array(
				'projects' => $projects,
		));
	}
	
}
