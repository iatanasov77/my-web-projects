
class vsprojects::webpack
{
	class { '::nodejs':
		version 	=> 'v6.13.1',
		node_path	=> '/usr/share/nodejs',
	}

	package { 'axios':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}

	package { 'bootstrap-sass':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'cross-env':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'fs':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'ajv':
		#version		=> '6.2.1',
		provider	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'laravel-mix':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'lodash':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'velocity':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'vue':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
	package { 'browser-sync browser-sync-webpack-plugin webpack-dev-server':
		provider 	=> 'npm',
		require  	=> Class['nodejs']
	}
}
