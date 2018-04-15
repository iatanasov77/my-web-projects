
# Install and setup an Apache server with mod_php
class { 'apache':
    default_vhost 	=> false,
    default_mods	=> false,
    mpm_module 		=> 'prefork',
}

class { '::php::globals':
	php_version	=> '7.1',
	config_root	=> '/etc/php/7.1',
}->
class { '::php':
	manage_repos	=> true,
	fpm        		=> true,
	dev         	=> true,
	composer    	=> true,
	pear        	=> true,
	phpunit     	=> true,
	settings		=> {
		'PHP/max_execution_time'  => '90',
		'PHP/max_input_time'      => '300',
		'PHP/memory_limit'        => '64M',
		'PHP/post_max_size'       => '32M',
		'PHP/upload_max_filesize' => '32M',
		'Date/date.timezone'      => 'Europe/Sofia',
    },
	extensions		=> {
		sqlite	=> { },
    },
}

apache::fastcgi::server { 'php':
	host       => '127.0.0.1:9000',
	timeout    => 15,
	flush      => false,
	faux_path  => '/var/www/php.fcgi',
	fcgi_alias => '/php.fcgi',
	file_type  => 'application/x-httpd-php'
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

# Install PhpMyAdmin
class { 'phpmyadmin': }
phpmyadmin::server{ 'default': }

# Setup default main virtual host
apache::vhost { 'myprojects.lh':
    port    		=> '80',
    docroot 		=> '/vagrant/web',
	override		=> 'all',
	
	aliases			=> [
		{
			alias => '/phpMyAdmin',
			path  => '/usr/share/phpMyAdmin'
		}, {
		  alias => '/phpmyadmin',
		  path  => '/usr/share/phpMyAdmin'
		}
	],
}
