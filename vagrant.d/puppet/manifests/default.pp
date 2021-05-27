#######################################################################################################################
# Main Manifest
#
# For reference how to organize manifests, Use:
# http://blog.servergrove.com/2013/01/11/creating-development-environments-with-vagrant-and-puppet/
# https://www.adayinthelifeof.nl/2012/06/29/using-vagrant-and-puppet-to-setup-your-symfony2-environment/
#######################################################################################################################

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/', '/usr/local/sbin/' ]
}

node default
{
	include stdlib
	
	######################################################
    # Setup DevEnv
    ######################################################
	$vsConfig  			= parseyaml( $facts['vs_config'] )
	$installedProjects	= parsejson( $facts['installed_projects'] )
	$devopsHosts        = parsejson( $facts['devops_hosts'] )
	
	class { '::vs_devenv':
        defaultHost                 => "${hostname}",
        defaultDocumentRoot         => "${vsConfig['gui']['documentRoot']}",
        
        installedProjects           => $installedProjects,
        subsystems                  => $vsConfig['subsystems'],
    
        packages                    => $vsConfig['packages'],
        gitUserName                 => $vsConfig['git']['userName'],
        gitUserEmail                => $vsConfig['git']['userEmail'],
        
        phpVersion                  => "${vsConfig['lamp']['phpVersion']}",
        apacheModules               => $vsConfig['lamp']['apacheModules'],
        
        phpModules                  => $vsConfig['lamp']['phpModules'],
        phpunit                     => $vsConfig['lamp']['phpunit'],
        
        phpSettings                 => $vsConfig['lamp']['phpSettings'],
        
        phpMyAdmin					=> $vsConfig['lamp']['phpMyAdmin'],
        
        frontendtools               => $vsConfig['frontendtools'],
        vstools                     => $vsConfig['vstools'],
        
        forcePhp7Repo              	=> $vsConfig['lamp']['forcePhp7Repo'],
    	
    	mySqlProvider				=> $vsConfig['lamp']['mysql']['provider'],
    	databases					=> { guiDatabase => $vsConfig['gui']['database'] } + $vsConfig['lamp']['mysql']['databases'],
    	
    	ansibleConfig               => $vsConfig['ansible'],
    }
  
    ######################################################
    # Config
    ######################################################
    
    # Config SSH
    class { 'ssh':
        sshd_password_authentication    => 'yes'
    }
    
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
	
	######################################################
    # Add DevOps Host to /etc/hosts
    ######################################################
    class { '::hosts' : }
    $devopsHosts.each|String $id, Hash $hostConfig| {
        ::hosts::add { "${hostConfig['host_ip']}":
            fqdn    => "${hostConfig['host_fqdn']}",
            #aliases => [ 'router' ],
        }
    }
}
