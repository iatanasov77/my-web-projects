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

#puts JSON.parse( File.read( ENV['HOSTS_CONFIG'] ) )
#Kernel.exit( 1 )

	vsHosts		= JSON.parse( File.read( ENV['HOSTS_CONFIG'] ) )
	vsHosts.each do |key, host|
		vagrant_config.hostmanager.aliases.push( "#{host['hostName']} www.#{host['hostName']}" )
    end

	# Config vagrant machine
	vagrant_config.vm.define ENV['MASHINE_NAME'] do |config|

	  	config.vm.box				= ENV['VAGRANT_BOX']
	  	#config.vm.box_version
		config.vm.box_check_update	= true

		config.vm.hostname 			= ENV['HOSTNAME']
		config.vm.network :private_network, ip: ENV['PUBLIC_IP']

		# Virtual Box Configuration
		config.vm.provider :virtualbox do |vb, override|
			vb.gui		= false
			vb.name		= ENV['MASHINE_NAME']
			vb.memory	= ENV['VBOX_MACHINE_MEMORY']
			vb.cpus		= 1
		end

	  	# Shared Folders
    	config.vm.synced_folder ENV['FOLDER_PROJECTS'], "/projects" #owner: "root", group: "root"
    	#config.vm.synced_folder ENV['FOLDER_PROJECTS_DEPLOY'], "/projects_deploy"

		# Run provision bash scripts to setup puppet environement
		config.vm.provision "shell", path: "vagrant.d/provision/init.sh"
		config.vm.provision "shell", path: "vagrant.d/provision/make_swap.sh", env: {"SWAP_SIZE" => ENV['VBOX_MACHINE_SWAP_SIZE']}
		config.vm.provision "shell", path: "vagrant.d/provision/install_ruby.sh"
		config.vm.provision "shell", path: "vagrant.d/provision/install_puppet.sh"
		config.vm.provision "shell", path: "vagrant.d/provision/install_puppet_modules.sh"
		
	    # Run puppet provisioner
	    config.vm.provision :puppet do |puppet|
			puppet.manifests_path = 'vagrant.d/puppet/manifests'
			puppet.module_path    = 'vagrant.d/puppet/modules'
			puppet.options        = ['--verbose', '--debug']

			puppet.manifest_file  = "default.pp"
			puppet.facter			= {
				'devenv_modules'	=> ENV['DEVENV_MODULES'],
				'hostname'			=> ENV['HOSTNAME'],
				'documentroot'		=> ENV['DOCUMENT_ROOT'],
				'mysqlhost'			=> ENV['PUBLIC_IP']
				#'mysqldump'		=> '/vagrant/resources/sql/dump.sql'
			}
	    end

		#config.vm.provision "shell", path: "vagrant.d/provision/install_projects.php"

		# FIX SESSION READ/WRITE FOR PHP ON UBUNTO
		config.vm.provision "shell", inline: "chmod 777 /var/lib/php/sessions"

		#################################################################
		# Workaround for a fucking bug:
		# Created from puppet virtual host has "AllowOverride None"
		# and Laravel rewrite rules not working
		# The next is a hard fix for this.
		$workaround = <<-SCRIPT
echo "Workaround for: Created from puppet virtual host has 'AllowOverride None'"
sed "$(grep -n -m1 "AllowOverride None" /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf |cut -f1 -d:)s/.*/AllowOverride All/" /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf > /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf.FIXED
cp -f /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf.FIXED /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf
rm /etc/apache2/sites-available/25-#{ENV['HOSTNAME']}.conf.FIXED
service apache2 restart
SCRIPT
		config.vm.provision "shell", inline: $workaround



		$done = <<-SCRIPT
echo ""
echo ""
echo "####################################################################"
echo "# DONE!!!"
echo "# -------"
echo "# Now you can open http://#{ENV['HOSTNAME']} in your browser"
echo "#"
echo "# You have PHP Info at http://#{ENV['HOSTNAME']}/info.php"
echo "# You have a PhpMyAdmin  at http://#{ENV['HOSTNAME']}/phpMyAdmin/"
echo "#"
echo "# Support at: https://github.com/iatanasov77/"
echo "####################################################################"
SCRIPT
		config.vm.provision "shell", inline: $done

	end
end
