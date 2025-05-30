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
    # Disable Selinux
    ######################################################
	class { selinux:
        mode => 'disabled',
    }
    
	######################################################
    # Setup DevEnv
    ######################################################
    $hostIp             = $facts['host_ip']
	$vsConfig  			= parseyaml( $facts['vs_config'] )
	$installedProjects	= parsejson( $facts['installed_projects'] )
	$devopsHosts        = parsejson( $facts['devops_hosts'] )
	$gitCredentials     = parsejson( $facts['git_credentials'] )
	
	class { '::vs_devenv':
		dependencies				=> $vsConfig['dependencies'],
		hostIp                      => "${hostIp}",
		
        defaultHost                 => "${hostname}",
        guiUrl                      => "${vsConfig['gui']['guiUrl']}",
        guiRoot                     => "${vsConfig['gui']['guiRoot']}",
        
        installedProjects           => $installedProjects,
        subsystems                  => $vsConfig['subsystems'],
    
        packages                    => $vsConfig['packages'],
        gitUserName                 => $vsConfig['git']['userName'],
        gitUserEmail                => $vsConfig['git']['userEmail'],
        gitCredentials				=> $gitCredentials,
        
        apacheVersion               => "${vsConfig['lamp']['apacheVersion']}",
        phpVersion                  => "${vsConfig['lamp']['phpVersion']}",
        apacheModules               => $vsConfig['lamp']['apacheModules'],
        
        phpModules                  => $vsConfig['lamp']['phpModules'],
        removePhpIniFiles           => $vsConfig['lamp']['removePhpIniFiles'],
        phpunit                     => $vsConfig['lamp']['phpunit'],
        
        phpSettings                 => $vsConfig['lamp']['phpSettings'],
        
        phpMyAdmin					=> $vsConfig['lamp']['phpMyAdmin'],
        
        frontendtools               => $vsConfig['frontendtools'],
        npmCredentials              => $vsConfig['npmLogin'],
        vstools                     => $vsConfig['vstools'],
        
        forcePhp7Repo              	=> $vsConfig['lamp']['forcePhp7Repo'],
    	
    	mySqlProvider				=> $vsConfig['lamp']['mysql']['provider'],
    	databases                   => $vsConfig['lamp']['mysql']['databases'],
    	
    	ansibleConfig               => $vsConfig['ansible'],
    	
    	customLampExtensions        => $vsConfig['lamp']['customExtensions'],
        finalFixes                  => $vsConfig['finalFixes'],
        caTrustNotify               => $vsConfig['caTrustNotify'],
    }
  
    ######################################################
    # Config
    ######################################################
	
	# Config DevOps Hosts
	$devopsHosts.each |String $key, Hash $hostConfig| {
	   vs_devenv::system_host{ "${hostConfig['host_fqdn']}":
            hostIp      => $hostConfig['host_ip'],
            hostName    => $hostConfig['host_fqdn'],
        }
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
    sudo::conf { "wsworker":
        ensure          => "present",
        content         => "wsworker ALL=(ALL) NOPASSWD: ALL",
        sudo_file_name  => "wsworker",
    }
	
	# create composer cache directory with write permissions to all users
	file { '/home/vagrant/.composer':
		ensure	=> 'directory',
		mode	=> '0777'
	}
}
