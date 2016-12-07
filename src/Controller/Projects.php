<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use VankoSoft\MyProjects\Component\Shell;

class Projects implements ControllerProviderInterface
{
	private $app;
	
	public function connect(Application $app)
	{
		$this->app		= $app;
		$controllers	= $this->app['controllers_factory'];
		
		$controllers->get( '/{id}/install', array( $this, 'installAction' ) );
		
		return $controllers;
	}
	
	public function installAction()
	{
		$id				= $this->app['request_stack']->getCurrentRequest()->get( 'id', null );
		$project 		= $this->app ['db']->fetchAssoc( sprintf ( 'SELECT * FROM projects WHERE id=%d', $id ) );
		
		$projectRoot	= APP_ROOT . '/dir/projects/' . $project['project_root'];
		mkdir( $projectRoot, 2775, true );
		
		Shell::exec( 'git clone ' . $project['git_url'] . ' ' . $projectRoot );
		Shell::exec( 'mkvhost' );
		
		die("EHO");
		
		return $this->app->redirect( '/' );
	}
}
