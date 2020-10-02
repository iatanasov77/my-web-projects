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

case $operatingsystem 
{
    'RedHat', 'CentOS', 'Fedora': 
    {
        $apachename     = 'httpd'
    }
    'Debian', 'Ubuntu':
    {
        $apachename     = 'apache2'
    }
}

$vsConfig		= parseyaml( $facts['vs_config'] )

class dependencies
{
	if ( $operatingsystem == 'CentOS' )
    {
    	###########################################
		# PhpBrew build php require libzip >= 0.11
		###########################################
		exec { 'remove older libzip':
			command     => 'yum remove -y libzip'
		}
		
		package { 'libzip':
		    provider  => 'rpm',
		    ensure    => installed,
		    source    => "http://packages.psychotic.ninja/7/plus/x86_64/RPMS//libzip-0.11.2-6.el7.psychotic.x86_64.rpm",
		    require   => Exec['remove older libzip'],
		}
	
		package { 'libzip-devel':
		    provider  => 'rpm',
		    ensure    => installed,
		    source    => "http://packages.psychotic.ninja/7/plus/x86_64/RPMS//libzip-devel-0.11.2-6.el7.psychotic.x86_64.rpm",
		    require   => Exec['remove older libzip'],
		}
	}
}

node default
{
	include stdlib
	
	######################################################
    # Setup
    ######################################################
    
	#include devenv::dependencies
	include dependencies
	
	include devenv::system
	include devenv::packages
	include devenv::vstools
	
	include devenv::lamp
	include devenv::subsystems
	include devenv::docker
	include devenv::frontendtools
    
    # Create MyProjects Database
    mysql::db { $vsConfig['database']['name']:
        user     => 'root',
        password => 'vagrant',
        host     => 'myprojects.lh',
        sql      => $vsConfig['database']['dump'],
    }
  
    ######################################################
    # Config
    ######################################################
    
	# Config sudo users
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
	sudo::conf { "apache":
        ensure          => "present",
        content         => "apache ALL=(ALL) NOPASSWD: ALL",
        sudo_file_name  => "apache",
    }
	
	
	# create composer cache directory with write permissions to all users
	file { '/home/vagrant/.composer':
		ensure	=> 'directory',
		mode	=> '0777'
	}
}
