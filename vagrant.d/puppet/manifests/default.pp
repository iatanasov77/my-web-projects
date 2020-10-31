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

node default
{
	include stdlib
	
	# In Puppetfile:
    # mod 'ghoneycutt-ssh', '3.57.0' 
    class { 'ssh':
        sshd_password_authentication    => 'yes'
    }
    
	######################################################
    # Setup DevEnv
    ######################################################
	$vsConfig  = parseyaml( $facts['vs_config'] )
	
	class { '::vs_devenv':
        defaultHost                 => "${hostname}",
        defaultDocumentRoot         => '/vagrant/gui_symfony/public',
        installedProjects           => parsejson( file( '/vagrant/installed_projects.json' ) ),
        
        subsystems                  => $vsConfig['subsystems'],
    
        packages                    => $vsConfig['packages'],
        gitUserName                 => $vsConfig['git']['userName'],
        gitUserEmail                => $vsConfig['git']['userEmail'],
        
        phpVersion                  => "${vsConfig['phpVersion']}",
        apacheModules               => $vsConfig['apacheModules'],
        
        phpModules                  => $vsConfig['phpModules'],
        phpunit                     => $vsConfig['phpunit'],
        
        phpSettings                 => {
            'PHP/memory_limit'        => '-1',
            'Date/date.timezone'      => 'Europe/Sofia',
            'PHP/post_max_size'       => '64M',
            'PHP/upload_max_filesize' => '64M',
            'PHAR/phar.readonly'      => 'Off',
        },
        
        phpMyAdmin					=> $vsConfig['phpMyAdmin'],
        
        frontendtools               => $vsConfig['frontendtools'],
        vstools                     => $vsConfig['vstools'],
        
        forcePhp7Repo              	=> $vsConfig['forcePhp7Repo'],
    	forceMySqlComunityRepo     	=> $vsConfig['forceMySqlComunityRepo'],
    	
    	mysqlPackageName			=> $vsConfig['mysqlPackageName'],
    	databases					=> $vsConfig['databases'],
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
