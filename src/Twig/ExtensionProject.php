<?php

namespace VankoSoft\MyProjects\Twig;

class ExtensionProject extends \Twig_Extension
{
	
	public function getFunctions()
	{
		return array(
				new \Twig_SimpleFunction( 'vs_project_exists', array( $this, 'exists' ) ),
		);
	}
	
	public function exists( $project )
	{
		return is_dir( APP_ROOT . '/dir/projects/' . $project['project_root'] );
	}
}
