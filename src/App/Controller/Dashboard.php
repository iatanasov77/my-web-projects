<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

class Dashboard implements ControllerProviderInterface
{
	private $app;

	public function connect( Application $app )
	{
		$this->app		= $app;
		$controllers	= $this->app['controllers_factory'];
		
		$controllers->get('/', array( $this, 'indexAction' ) );
		
		return $controllers;
	}
	
	public function indexAction()
	{
		$projectsCli	= $this->app['db']->fetchAll( 'SELECT * FROM projects_cli' );
		$projects		= $this->app['db']->fetchAll( 'SELECT * FROM projects' );
		$tools			= $this->app['db']->fetchAll( 'SELECT * FROM tools' );
		
		return $this->app['twig']->render( 'dashboard/index.twig', array(
			'projectsCli'	=> $projectsCli,
			'projects'		=> $projects,
			'tools'			=> $tools
		));
	}
	
}
