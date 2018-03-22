# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Config Variables
##################################################################################################

VAGRANTFILE_API_VERSION	= '2' 
VAGRANT_BOX				= "Gigasavvy/centos7-LAMP"

MASHINE_NAME			= "MyProjects"
HOSTNAME				= "myprojects.dev"
PUBLIC_IP				= '10.3.3.2'
VBOX_MACHINE_MEMORY		= '1024'
HOSTS_CONFIG			= 'hosts.yml'

##################################################################################################

def fail_with_message(msg)
  fail Vagrant::Errors::VagrantError.new, msg
end

# Run Config
Vagrant.configure( VAGRANTFILE_API_VERSION ) do |vagrant_config|
	
  	# Check dependencieshttp://marketplace.eclipse.org/marketplace-client-intro?mpc_install=507775
	if ! File.exists?( HOSTS_CONFIG )
		fail_with_message "'hosts.yml' file not exists"
	end
	if ! Vagrant.has_plugin? 'vagrant-hostmanager'
		fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:\nvagrant plugin install vagrant-hostmanager"
	end
	
	# Parse hosts config
	hostsConfig	= YAML.load_file( HOSTS_CONFIG )
	vsHosts = hostsConfig ? hostsConfig['hosts'] : []
	# puts vsHosts.inspect
	# exit
	wwwAliases = vsHosts.map { |host| "www.#{host}" }
	
	# Config vagrant machine
	vagrant_config.vm.define MASHINE_NAME do |config|
		config.vm.box 							= VAGRANT_BOX
	  	config.vm.box_check_update 				= true
		config.hostmanager.enabled 				= true
	 	config.hostmanager.manage_host 			= true
		config.hostmanager.ignore_private_ip 	= false
		config.hostmanager.include_offline 		= true
		
		config.vm.hostname 						= HOSTNAME
		config.vm.network :private_network, ip: PUBLIC_IP
		config.hostmanager.aliases				= vsHosts + wwwAliases
		#config.vm.network :forwarded_port, guest: 80, host: 8080
		#config.vm.network :forwarded_port, guest: 443, host: 8443
		
		# Virtual Box Configuration
		#config.vm.provider :virtualbox do |vb, override|
		#	vb.gui	= true
		#	vb.name	= MASHINE_NAME
		#	vb.customize ["modifyvm", :id, "--memory", VBOX_MACHINE_MEMORY]
	  	#end
	  	
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
end
