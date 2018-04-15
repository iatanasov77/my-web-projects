
class vsprojects::tools
{
	# package install list
	$packages = [
		"mc", 
		"git",
		"curl",
		"vim",
		"htop",
	]

	# install packages
	package { $packages:
		ensure => present,
	}
}
