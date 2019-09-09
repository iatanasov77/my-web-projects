# Setup VsProjects Environement

## I. Clone GIT Repository with Submodules
```
	# git clone https://gitlab.com/iatanasov77/my-projects.git .
	# git submodule init
	
	# git submodule update
	; OR
	# git submodule update --remote # to fetch the HEAD of submodules
```
	NOTE: To add a new git submodule run:
```
	# git submodule add -f https://github.com/puppetlabs/puppetlabs-docker vagrant.d/puppet/modules/docker
```

## II. Setup the vagrant machine

1. Install Oracle's Virtual Box - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - https://www.vagrantup.com/downloads.html
3. Install needed Vagrant Plugins:
	```
		# Vagrant plugin install vagrant-env
		# Vagrant plugin install vagrant-hostmanager
	```
5. Start the machine
	```
		# copy .env.dist .env
	```
	Edit .env file if needed
	```
    	# Vagrant up
    ```

## III. Setup the web interface

1. SSH login to the vagrant machine
2. Run `composer install` from the /vagrant directory
3. Set a database.
    
	Create database:
	```
	   php bin/console doctrine:database:create
	 ```
	 
	 Run the migrations:
	 ``` 
	   php bin/console doctrine:migrations:migrate
	 ```
	 
	 Make new migration
	 ```
	   php bin/console doctrine:migrations:diff
	 ```
4. Open the web interface in a browser: http://myprojects.lh

## IV. Configure a SSL Virtual Host (HTTPS)

	Using this manual: https://switchcaseblog.wordpress.com/2016/02/22/creating-a-self-signed-ssl-for-local-development-with-vagrant-nginx/
	
1. Generating a necessary key files
	```
		sudo openssl genrsa -out "/vagrant/SSL_CERTS/myprojects.lh.key" 2048
		sudo openssl req -new -key "/vagrant/SSL_CERTS/myprojects.lh.key" -out "/vagrant/SSL_CERTS/myprojects.lh.csr"
		sudo openssl x509 -req -days 365 -in "/vagrant/SSL_CERTS/myprojects.lh.csr" -signkey "/vagrant/SSL_CERTS/myprojects.lh.key" -out "/vagrant/SSL_CERTS/myprojects.lh.crt"
	```
2. Set virtual host
	```
	<IfModule mod_ssl.c>
		Listen 443
		<VirtualHost *:443>
		    ServerAdmin webmaster@myprojects.lh
		    ServerName myprojects.lh
		    DocumentRoot "/vagrant/public"
		
		    SSLEngine on
		    SSLCertificateFile "/vagrant/SSL_CERTS/myprojects.lh.crt"
		    SSLCertificateKeyFile "/vagrant/SSL_CERTS/myprojects.lh.key"
		</VirtualHost>
	</IfModule>
	```

3. Enable appache for ssl
	```
		sudo a2enmod ssl
		sudo service apache2 restart
	```
	 
4. Checking evan port 443 is open in listened
	```
		sudo lsof -iTCP -sTCP:LISTEN -P
		- or -
		netstat -ntlp | grep LISTEN
	```
