<?php namespace App\Twig;

use App\Helper\Project;

class ExtensionProject extends \Twig_Extension
{
	public function getFunctions()
	{
		return [
			new \Twig_SimpleFunction( 'vs_project_exists', [$this, 'exists'] ),
		    new \Twig_SimpleFunction( 'vs_project_installed', [$this, 'installed'] ),
		];
	}

	public function exists( $project )
	{
		return Project::exists( $project );
	}

	public function installed( $project )
	{
	    return Project::installed( $project );
	}
}
