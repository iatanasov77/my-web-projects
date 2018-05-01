class php
{
	class { 'vsprojects::php': }
}
	
class vsprojects::lamp
{
	# Install and setup an Apache server with mod_php
	class { 'apache':
		default_vhost 	=> false,
		default_mods	=> false,
		mpm_module 		=> 'prefork',
	}

	# Apache modules
	class { 'apache::mod::expires': }
	class { 'apache::mod::headers': }
	class { 'apache::mod::rewrite': }
	class { 'apache::mod::vhost_alias': }

	class { 'php': }
	
	# include xdebug
	class { 'xdebug':
		remote_enable 		=> 1,
		remote_connect_back => 1
	}
	
	class { 'apache::mod::php': 
		php_version	=> '7.1',
	}

	# Install and setup MySql server
	exec { 'mkdir -p /var/log/mariadb':
		path     => '/usr/bin:/usr/sbin:/bin',
		provider => shell
	}
	class { 'mysql::server':
		create_root_user	=> true,
		root_password		=> 'vagrant',
	}

	# Install Sqlite server
	class { 'sqlite': }
	exec { 'apt-get install -y php-sqlite3':
		provider => shell
	}


	# Install PhpMyAdmin
	class { 'phpmyadmin': }
	phpmyadmin::server{ 'default': }

	# Setup default main virtual host
	apache::vhost { 'myprojects.lh':
		port    	=> '80',
		docroot 	=> '/vagrant/web',
		override	=> 'all',
		php_values 		=> ['memory_limit 1024M'],
		
		directories => [
			{
				'path'		=> '/usr/share/phpmyadmin',
				'Require'	=> 'all granted' ,
			},
		],
		
		aliases		=> [
			{
				alias => '/phpMyAdmin',
				path  => '/usr/share/phpmyadmin'
			}, 
			{
				alias => '/phpmyadmin',
				path  => '/usr/share/phpmyadmin'
			}
		],
	}
}
