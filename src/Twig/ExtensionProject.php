<?php namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

use App\Component\Project\Source\Source as Project;

class ExtensionProject extends AbstractExtension
{
	public function getFunctions()
	{
		return [
		    new TwigFunction( 'vs_project_exists', [$this, 'exists'] ),
		    new TwigFunction( 'vs_project_installed', [$this, 'installed'] ),
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
