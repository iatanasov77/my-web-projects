<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use VankoSoft\MyProjects\Component\Shell;

class Projects implements ControllerProviderInterface
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
		$project 		= $this->app ['db']->fetchAssoc( sprintf ( 'SELECT * FROM projects WHERE id=%d', $id ) );
		
		$projectRoot	= APP_ROOT . '/dir/projects/' . $project['project_root'];
		mkdir( $projectRoot, 2775, true );
		
		if ( $project['git_username'] && $project['git_password'] )
		{
			$cmdGitClone	= sprintf(
				"git clone https://%s:%s@%s %s",
				$project['git_username'],
				$project['git_password'],
				$project['git_url'],
				$projectRoot
			);
		}
		else
		{
			$cmdGitClone	= sprintf(
				"git clone https://%s %s",
				$project['git_url'],
				$projectRoot
			);
		}
		
		Shell::exec( $cmdGitClone );
		
		Shell::exec( 'mkvhost' );
		
		die("EHO");
		
		return $this->app->redirect( '/' );
	}
}
