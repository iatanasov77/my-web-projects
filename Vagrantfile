# -*- mode: ruby -*-
# vi: set ft=ruby :

# Config Variables
##################################################################################################

VAGRANTFILE_API_VERSION	= '2' 
VAGRANT_BOX				= "Gigasavvy/centos7-LAMP"

HOSTNAME				= "myprojects.dev"
PUBLIC_IP				= '10.3.3.2'
VBOX_MACHINE_MEMORY		= '1024'

##################################################################################################

# Run Config
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
	# Every Vagrant virtual environment requires a box to build off of.
	config.vm.box 		= VAGRANT_BOX
	config.vm.hostname 	= HOSTNAME
  
	# Virtual Box Configuration
	config.vm.provider "virtualbox" do |v|
		v.name = "MyProjects"
		v.customize ["modifyvm", :id, "--memory", VBOX_MACHINE_MEMORY]
	end
  
	config.ssh.forward_agent = true

	config.vm.network "private_network", ip: PUBLIC_IP
	config.vm.network "forwarded_port", guest: 80, host: 8080,
		auto_correct: true

	# Run provision scripts
	config.vm.provision "shell", path: "Vagrant/provision/packages.sh"
	config.vm.provision "shell", path: "Vagrant/provision/settings.sh"
	config.vm.provision "shell", path: "Vagrant/provision/httpd_config.sh"

	# Running Chefs
	config.vm.provision "chef_solo" do |chef|
		#chef.cookbooks_path = "Vagrant/cookbooks"
		#chef.add_recipe "virtual_hosts"
	end
end
