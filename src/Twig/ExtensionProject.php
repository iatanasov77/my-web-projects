<?php namespace VankoSoft\MyProjects\Twig;

use Silex\Application;

class ExtensionProject extends \Twig_Extension
{
	private $app;
	
	public function __construct( Application $app )
	{
		$this->app		= $app;
	}	
	
	public function getFunctions()
	{
		return array(
				new \Twig_SimpleFunction( 'vs_project_exists', array( $this, 'exists' ) ),
		);
	}
	
	public function exists( $project )
	{
		return is_dir( $this->app ['projects_path'] . $project['project_root'] );
	}
}
