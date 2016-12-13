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
		$id		= $this->app['request_stack']->getCurrentRequest()->get( 'id', null );
		$tool	= $this->app['db']->fetchAssoc( sprintf( 'SELECT * FROM tools WHERE id=%d', $id ) );
	
		$rootPath	= APP_ROOT . '/dir/tools/' . $tool['root_dir'];
		mkdir( $projectRoot, 2775, true );
		
		$cmdGitClone	= sprintf(
									"git clone https://%s %s",
									$tool['git_url'],
									$rootPath
								);
		
		Shell::exec( $cmdGitClone );
		
		Shell::exec( 'mkvhost' );
		
		die("EHO");
		
		return $this->app->redirect( '/' );
	}
	
}
