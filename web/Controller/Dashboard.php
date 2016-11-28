<?php

namespace VankoSoft\MyProjects\Controller;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

class Dashboard implements ControllerProviderInterface
{
	private $app;

	public function connect( Application $app )
	{
		$controllers = $app['controllers_factory'];
		
		$controllers->get('/', array( $this, 'indexAction' ) );
		
		return $controllers;
	}
	
	public function indexAction()
	{
		$projects	= $this->app['db']->fetchAll( 'SELECT * FROM projects' );
		$tools		= $this->app['db']->fetchAll( 'SELECT * FROM tools' );
		
		return $this->app['twig']->render( 'dashboard/index.twig', array(
				'projects'	=> $projects,
				'tools'		=> $tools
		));
	}
	
}
