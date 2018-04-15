
class vsprojects::vsprojects
{
	notice( "Create http hosts of the installed projects ..." )

	exec{ "install_projects":
		command		=> "/usr/bin/php /vagrant/Vagrant/provision/install_projects.php",
		logoutput	=> false,
	}
}
