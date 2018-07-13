1. Install Oracle's Virtual Box - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - https://www.vagrantup.com/downloads.html
3. Install needed Vagrant Plugins:
	```
		# vagrant plugin install vagrant-env
		# vagrant plugin install vagrant-hostmanager
	```
4. Fetch VsProjects sources into the current dirctory ( "c:/MyPlaces/VsProjects" ).
	```
		# git clone https://gitlab.com/iatanasov77/my-projects.git .
		# git submodule init
		# git submodule update
	```
5. Start the machine
	```
    	# cd C:/VsProjects/Dir
    	# Vagrant up
    ```
