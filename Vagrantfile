# -*- mode: ruby -*-
# vi: set ft=ruby :

###########################################################
# Plugins:
# vagrant plugin install vagrant-hostmanager
# vagrant plugin install vagrant-librarian-puppet
###########################################################

# Config Variables
##################################################################################################

VAGRANTFILE_API_VERSION	= '2' 
#VAGRANT_BOX				= "Gigasavvy/centos7-LAMP"
VAGRANT_BOX       		= "ubuntu/artful64"
#VAGRANT_BOX				= "icalvete/ubuntu-16.04-64-puppet"

MASHINE_NAME			= "MyProjects"
HOSTNAME				= "myprojects.lh"
PUBLIC_IP				= '10.3.3.2'
VBOX_MACHINE_MEMORY		= '2048'
HOSTS_CONFIG			= 'installed_hosts.json'

##################################################################################################

def fail_with_message(msg)
  fail Vagrant::Errors::VagrantError.new, msg
end

# Run Config
Vagrant.configure( VAGRANTFILE_API_VERSION ) do |vagrant_config|
	
  if ! File.exists?( HOSTS_CONFIG )
    fail_with_message "#{HOSTS_CONFIG} file not exists"
	end
	
	if ! Vagrant.has_plugin? 'vagrant-hostmanager'
	  fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:\nvagrant plugin install vagrant-hostmanager"
	end
	
	vagrant_config.hostmanager.enabled           	= true
    vagrant_config.hostmanager.manage_host       	= true
	vagrant_config.hostmanager.manage_guest 		= false
    vagrant_config.hostmanager.ignore_private_ip 	= false
    vagrant_config.hostmanager.include_offline   	= true
	vagrant_config.hostmanager.aliases				= []
	
	vsHosts		= JSON.parse( File.read( HOSTS_CONFIG ) ).values
	vsHosts.each do |host|
		vagrant_config.hostmanager.aliases.push( "#{host['hostName']} www.#{host['hostName']}" )
    end
	
	# Config vagrant machine
	vagrant_config.vm.define MASHINE_NAME do |config|
	  
	  config.vm.box                        = VAGRANT_BOX
	  config.vm.box_check_update           = true
		
		config.vm.hostname 						       = HOSTNAME
		config.vm.network :private_network, ip: PUBLIC_IP
    #config.vm.network :forwarded_port, guest: 80, host: 8080
    #config.vm.network :forwarded_port, guest: 443, host: 8443
		
    
		
		# Virtual Box Configuration
		#config.vm.provider :virtualbox do |vb, override|
		#	vb.gui	= true
		#	vb.name	= MASHINE_NAME
		#	vb.customize ["modifyvm", :id, "--memory", VBOX_MACHINE_MEMORY]
	  #end
	  	
	  # Run provision scripts
		#config.vm.provision "shell", path: "Vagrant/provision/packages.sh"
		#config.vm.provision "shell", path: "Vagrant/provision/settings.sh"
		#config.vm.provision "shell", path: "Vagrant/provision/httpd_config.sh"
    #config.vm.provision "shell", path: "Vagrant/provision/install_docker.sh"
    #config.vm.provision "shell", path: "Vagrant/provision/install_phpbrew.sh"
		#config.vm.provision "shell", path: "Vagrant/provision/install_projects.php"

		#config.vm.provision "shell", path: "Vagrant/provision/puppet.sh"
	config.vm.provision "shell", path: "Vagrant/provision/make_swap.sh"
    config.vm.provision "shell", path: "Vagrant/provision/puppet-ubuntu.sh"
    config.vm.provision "shell", path: "Vagrant/provision/puppet-modules.sh"
    
		# With plugin: vagrant-librarian-puppet
    #config.librarian_puppet.puppetfile_dir        = "Vagrant/puppet"
    #config.librarian_puppet.placeholder_filename  = ".MYPLACEHOLDER"
    #config.librarian_puppet.use_v1_api            = '1' # Check https://github.com/voxpupuli/librarian-puppet#how-to-use
    #config.librarian_puppet.destructive           = false # Check https://github.com/voxpupuli/librarian-puppet#how-to-use
    
    # Run puppet
    config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'Vagrant/puppet/manifests'
      puppet.module_path    = 'Vagrant/puppet/modules'
      puppet.options        = [
								'--verbose',
								'--debug',
							]
      
      puppet.manifest_file  = "default.pp"
    end
        
    # Shared Folders
    config.vm.synced_folder "../Projects", "/projects"
	end
end
