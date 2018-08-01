# Setup VsProjects Environement

## I. Setup the vagrant machine

1. Install Oracle's Virtual Box - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - https://www.vagrantup.com/downloads.html
3. Install needed Vagrant Plugins:
	```
		# Vagrant plugin install vagrant-env
		# Vagrant plugin install vagrant-hostmanager
	```
4. Fetch VsProjects sources into the current dirctory ( "c:/MySpace/VsProjects" ).
	```
		# git clone https://gitlab.com/iatanasov77/my-projects.git .
		# git submodule init
		# git submodule update
	```
5. Start the machine
	```
    	# Vagrant up
    ```

## II. Setup the web interface

1. SSH login to the vagrant machine
2. Run `composer install` from the /vagrant directory
3. Open the web interface in a browser: http://myprojects.lh
