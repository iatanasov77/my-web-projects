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
	if $::operatingsystem == 'centos' and $::operatingsystemmajrelease == '8' {
	   	package { 'dnf-plugins-core':
	        ensure => present,
	    }

		yumrepo { 'PowerTools':
			ensure      => 'present',
			mirrorlist 	=> 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=PowerTools&infra=$infra',
			enabled     => 1,
			gpgcheck 	=> 0,
			require		=> Package['dnf-plugins-core'],
		}
	}
	
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
        
        phpVersion                  => "${vsConfig['lamp']['phpVersion']}",
        apacheModules               => $vsConfig['lamp']['apacheModules'],
        
        phpModules                  => $vsConfig['lamp']['phpModules'],
        phpunit                     => $vsConfig['lamp']['phpunit'],
        
        phpSettings                 => {
            'PHP/memory_limit'        => '-1',
            'PHP/max_execution_time'  => '300',
            'PHP/post_max_size'       => '64M',
            'PHP/upload_max_filesize' => '64M',
            'Date/date.timezone'      => 'Europe/Sofia',
            'PHAR/phar.readonly'      => 'Off',
        },
        
        phpMyAdmin					=> $vsConfig['lamp']['phpMyAdmin'],
        
        frontendtools               => $vsConfig['frontendtools'],
        vstools                     => $vsConfig['vstools'],
        
        forcePhp7Repo              	=> $vsConfig['lamp']['forcePhp7Repo'],
    	
    	mySqlProvider				=> $vsConfig['lamp']['mysql']['provider'],
    	databases					=> $vsConfig['lamp']['mysql']['databases'],
    	
    	ansibleConfig               => $vsConfig['ansible'],
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
