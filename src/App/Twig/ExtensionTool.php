<?php

namespace VankoSoft\MyProjects\Twig;

class ExtensionTool extends \Twig_Extension
{
	
	public function getFunctions()
	{
		return array(
				new \Twig_SimpleFunction( 'vs_tool_exists', array( $this, 'exists' ) ),
		);
	}
	
	public function exists( $tool )
	{
		return is_dir( APP_ROOT . '/dir/tools' . $tool['root_dir'] );
	}
}
