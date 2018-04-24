
class vsprojects::vstools
{
	notice( "Install VsTools ..." )

	exec{ "install_vstools":
		command		=> "/vagrant/Vagrant/provision/install_vstools.sh",
		logoutput	=> true,
	}
}
