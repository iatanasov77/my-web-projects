<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use VankoSoft\MyProjects\Helper\ProjectSetup;

class Projects implements ControllerProviderInterface
{
	private $app;

	public function connect( Application $app )
	{
		$this->app		= $app;
		$controllers	= $this->app['controllers_factory'];

		$controllers->get( '/{id}/install', array( $this, 'installAction' ) );
		$controllers->get( '/{id}/repair', array( $this, 'repairAction' ) );

		return $controllers;
	}

	public function installAction()
	{
		$id				= $this->app['request_stack']->getCurrentRequest()->get( 'id', null );
		$project 		= $this->getProject( $id );

		$projectSetup	= new ProjectSetup( $project, $this->app['config']['projects_path'] );
		$projectSetup->setup();
		
		//return $this->app->redirect( '/' );
	}
	
	public function repairAction()
	{
		$id				= $this->app['request_stack']->getCurrentRequest()->get( 'id', null );
		$project 		= $this->getProject( $id );
		
		$projectSetup	= new ProjectSetup( $project, $this->app['projects_path'] );
		$projectSetup->setup();
		
		return $this->app->json([
			'url' => 'http://' . $project['dev_url']
		]);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function getProject( $id )
	{
		return $this->app ['db']->fetchAssoc( sprintf ( 'SELECT * FROM projects WHERE id=%d', $id ) );
	}
}
