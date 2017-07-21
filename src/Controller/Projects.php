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
		$documentRoot	= APP_ROOT . '/dir/projects/' . $project['document_root'];

		// 1. Create project folder
		mkdir( $projectRoot, 2775, true );

		// 2. Download project source
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

		// 3. Make virtual host for apache
		$cmdMkVhost	= sprintf( "sudo php /usr/local/bin/mkvhost -t simple -s %s -d %s", $project['dev_url'], $documentRoot );
		Shell::exec( $cmdMkVhost );

		// 4. Run composer
		chdir( $projectRoot );
		Shell::exec( "php -d memory_limit=-1 /usr/local/bin/composer install" );

		//return $this->app->redirect( '/' );
	}
}
