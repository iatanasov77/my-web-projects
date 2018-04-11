<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use VankoSoft\MyProjects\Component\Shell;

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
	
		$rootPath		= $app['tools_path'] . $tool['root_dir'];
		mkdir( $rootPath, 2775, true );
		
		$cmdGitClone	= sprintf(
			"git clone --branch %s --single-branch https://%s %s",
				$tool['git_tag'],
				$tool['git_url'],
				$rootPath
		);
		
		Shell::exec( $cmdGitClone );
		
		Shell::exec( 'mkvhost' );
		
		die("EHO");
		
		return $this->app->redirect( '/' );
	}
	
}
