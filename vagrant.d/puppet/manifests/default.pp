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
	include devenv::tools
	include devenv::lamp
	
	if ( 'sqlite' in $facts['devenv_modules'] )
	{
		package { 'php7.1-sqlite3':
			ensure 	=> installed,
			require => Package['php7.1'],
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
	
	
	

}
