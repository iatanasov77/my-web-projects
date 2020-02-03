# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION	= '2'

def fail_with_message( msg )
	fail Vagrant::Errors::VagrantError.new, msg
end

if ! Vagrant.has_plugin? 'vagrant-env'
	fail_with_message "vagrant-env missing, please install the plugin with this command:
			vagrant plugin install vagrant-env"
end

Vagrant.configure( VAGRANTFILE_API_VERSION ) do |vagrant_config|
	vagrant_config.env.enable
	
	if ! File.exists?( ENV['HOSTS_CONFIG'] )
		File.open( ENV['HOSTS_CONFIG'], "w") do |f|
			f.write( "{}" )
		end
	end

	if ! Vagrant.has_plugin? 'vagrant-hostmanager'
		fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:
			vagrant plugin install vagrant-hostmanager"
	end

	vagrant_config.hostmanager.enabled           	= true
    vagrant_config.hostmanager.manage_host       	= true
	vagrant_config.hostmanager.manage_guest 		= false
    vagrant_config.hostmanager.ignore_private_ip 	= false
    vagrant_config.hostmanager.include_offline   	= true
	vagrant_config.hostmanager.aliases				= []

	vagrant_config.hostmanager.aliases.push( "#{ENV['HOST_NAME']} www.#{ENV['HOST_NAME']}" )
	
	vsHosts		= JSON.parse( File.read( ENV['HOSTS_CONFIG'] ) )
	vsHosts.each do |key, host|
		vagrant_config.hostmanager.aliases.push( "#{host['hostName']} www.#{host['hostName']}" )
    end

	# Config vagrant machine
	vagrant_config.vm.define ENV['MASHINE_NAME'] do |config|

	  	config.vm.box				= ENV['VAGRANT_BOX']
	  	#config.vm.box_version
		config.vm.box_check_update	= true

		config.vm.hostname 			= ENV['HOST_NAME']
		config.vm.network :private_network, ip: ENV['PUBLIC_IP']

		# Virtual Box Configuration
		config.vm.provider :virtualbox do |vb, override|
			vb.gui		= false
			vb.name		= ENV['MASHINE_NAME']
			vb.memory	= ENV['VBOX_MACHINE_MEMORY']
			#vb.cpus		= 1
			#vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
		end

	  	# Shared Folders
	  	#config.vm.synced_folder "../VS_MyProjects", "/vagrant" #owner: "root", group: "root"
	  	config.vm.synced_folder "./", "/vagrant" #owner: "root", group: "root"
    	config.vm.synced_folder ENV['FOLDER_PROJECTS'], "/projects" #owner: "root", group: "root"
    	#config.vm.synced_folder ENV['FOLDER_PROJECTS_DEPLOY'], "/projects_deploy"

        require 'yaml'
        provisionConfig  = YAML.load_file( ENV['PROVISION_CONFIG'] )
        
		# Run provision bash scripts to setup puppet environement
		config.vm.provision "shell", path: "vagrant.d/provision/main.sh", env: {
		  "SWAP_SIZE"     => ENV['VBOX_MACHINE_SWAP_SIZE'],
		  "PHP_VERSION"   => provisionConfig['phpVersion']
		}
		
		# INIT LIBRARIAN
		#config.librarian_puppet.enabled = false
        #config.librarian_puppet.puppetfile_dir          = "vagrant.d/puppet"
        # placeholder_filename defaults to .PLACEHOLDER
        #config.librarian_puppet.placeholder_filename    = ".MYPLACEHOLDER"
        #config.librarian_puppet.use_v1_api              = '1' # Check https://github.com/voxpupuli/librarian-puppet#how-to-use
        #config.librarian_puppet.destructive             = false # Check https://github.com/voxpupuli/librarian-puppet#how-to-use
    
	    # Run puppet provisioner
	    
	    #puts provisionConfig.inspect
	    
	    config.vm.provision :puppet do |puppet|
			puppet.manifests_path = 'vagrant.d/puppet/manifests'
			puppet.module_path    = 'vagrant.d/puppet/modules'
			puppet.options        = ['--verbose', '--debug']

			puppet.manifest_file  = "default.pp"
			puppet.facter			= {
				'vs_config'			=> provisionConfig.to_yaml,
				'hostname'			=> ENV['HOST_NAME'],
				'mysqlhost'			=> ENV['PUBLIC_IP'],
				#'mysqldump'		=> '/vagrant/resources/sql/dump.sql',
			}
	    end

        #config.vm.provision "shell", path: "vagrant.d/provision/install_projects.php"
		#config.vm.provision "shell", path: "vagrant.d/provision/workaround.sh", env: {"HOST_NAME" => ENV['HOST_NAME'] }

		$done = <<-SCRIPT
echo ""
echo ""
echo "####################################################################"
echo "# DONE!!!"
echo "# -------"
echo "# Now you can open http://#{ENV['HOST_NAME']} in your browser"
echo "#"
echo "# You have PHP Info at http://#{ENV['HOST_NAME']}/info.php"
echo "# You have a PhpMyAdmin  at http://#{ENV['HOST_NAME']}/phpMyAdmin/"
echo "#"
echo "# Support at: https://github.com/iatanasov77/my-projects"
echo "####################################################################"
SCRIPT
		config.vm.provision "shell", inline: $done

	end
end
