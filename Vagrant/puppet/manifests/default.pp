#######################################################################################################################
# Main Manifest
#
# For reference how to organize manifests, Use:
# https://www.adayinthelifeof.nl/2012/06/29/using-vagrant-and-puppet-to-setup-your-symfony2-environment/
#######################################################################################################################

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin/' ]
}

node default
{
	include vsprojects::tools 
	include vsprojects::lamp
	#include vsprojects::webpack
	include vsprojects::vsprojects
}
