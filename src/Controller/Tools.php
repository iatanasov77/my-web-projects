<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use VankoSoft\MyProjects\Component\Helper\ProjectSetup;

class Tools implements ControllerProviderInterface
{
	private $app;

	public function connect( Application $app )
	{
		$this->app		= $app;
		$controllers	= $this->app['controllers_factory'];
		
		$controllers->get( '/{id}/install', array( $this, 'installAction' ) );
		
		return $controllers;
	}
	
	public function installAction()
	{
		$id				= $this->app['request_stack']->getCurrentRequest()->get( 'id', null );
		$tool			= $this->app['db']->fetchAssoc( sprintf( 'SELECT * FROM tools WHERE id=%d', $id ) );
	
		$projectSetup	= new ProjectSetup( $tool, $this->app ['tools_path'] );
		$projectSetup->setup();
		
		//return $this->app->redirect( '/' );
	}
	
}
