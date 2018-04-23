
class vsprojects::tools
{
	# package install list
	$packages = [
		"mc", 
		"git",
		"git-flow",
		"curl",
		"vim",
		"htop",
	]

	# install packages
	package { $packages:
		ensure => present,
	}
}
