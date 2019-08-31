#######################################################################################################################
# Main Manifest
#
# For reference how to organize manifests, Use:
# http://blog.servergrove.com/2013/01/11/creating-development-environments-with-vagrant-and-puppet/
# https://www.adayinthelifeof.nl/2012/06/29/using-vagrant-and-puppet-to-setup-your-symfony2-environment/
#######################################################################################################################

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin/' ]
}

$phpVersion = "7.2"

node default
{ 	
	include devenv::system
	include devenv::tools
	#include devenv::vstools
	include devenv::lamp
	include devenv::docker
	include devenv::frontendtools
	
	if ( 'intl' in $facts['devenv_modules'] )
	{
		package { "php${phpVersion}-intl":
			ensure 	=> installed,
			require => Package["php${phpVersion}"],
			notify  => Service['apache2'],
		}
	}
	
	if ( 'sqlite' in $facts['devenv_modules'] )
	{
		package { "php${phpVersion}-sqlite3":
			ensure 	=> installed,
			require => Package["php${phpVersion}"],
			notify  => Service['apache2'],
		}
	}
	
	if ( 'xdebug' in $facts['devenv_modules'] )
	{
		class { 'devenv::xdebug':
			default_enable       => '1',
			remote_enable        => '1',
			remote_handler       => 'dbgp',
			remote_host          => 'localhost',
			remote_port          => '9000',
			remote_autostart     => '1',
		}
	}
	
	if ( 'apc' in $facts['devenv_modules'] )
	{
		class { 'devenv::phpapc':
			config	=> {
				enable_opcode_cache => 1,
				shm_size            => '512M',
				stat                => 0
			}
		}
	}
	
	if ( 'bower' in $facts['devenv_modules'] )
	{
		include devenv::bower
	}

	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
	sudo::conf { "www-data":
	    ensure			=> "present",
	    content			=> "www-data ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "www-data",
	}
	
	
	# create composer cache directory with write permissions to all users
	file { '/home/vagrant/.composer':
		ensure	=> 'directory',
		mode	=> '0777'
	}
}
