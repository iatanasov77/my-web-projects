# Setup VsWebProjects Environement

## I. Clone GIT Repository with Submodules
```
    # git clone https://github.com/iatanasov77/my-web-projects.git .
    # git submodule init
    
    # git submodule update
    ; OR
    # git submodule update --init --force --remote # to fetch the HEAD of submodules
```
    The big problem when submodule update that says: 
            fatal: unable to connect to github.com:
            github.com[0: 140.82.118.3]: errno=Connection timed out
            Unable to fetch in submodule path 'vagrant.d/puppet/modules/composer'
            
    I solve the problem with this command:
```
    git config --global url."https://".insteadOf git://
```

    NOTE: To add a new git submodule run:
```
    # git submodule add -f https://github.com/puppetlabs/puppetlabs-docker vagrant.d/puppet/modules/docker
```
    If you use the Puppet librarian for puppet modules add vagrant plugin for this. See: https://github.com/voxpupuli/vagrant-librarian-puppet
```
    # vagrant plugin install vagrant-librarian-puppet
```

## II. Setup the vagrant machine

1. Install Oracle's Virtual Box - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - https://www.vagrantup.com/downloads.html
3. Install needed Vagrant Plugins:
	```
		# Vagrant plugin install vagrant-env
		# Vagrant plugin install vagrant-hostmanager
	```
4. Fetch VsProjects sources into the current dirctory ( "c:/MySpace/VsProjects" ).
    ```
        # git clone https://gitlab.com/iatanasov77/my-web-projects.git .
        # git submodule init
        
        # git submodule update
        ; OR
        # git submodule update --remote # to fetch the HEAD of submodules
    ```
5. To add new puppet module:
	```
		# git submodule add https://github.com/puppetlabs/puppetlabs-docker vagrant.d\puppet\modules\docker -f
	```
6. Start the machine
    ```
        cp .env.dist .env
        cp vagrant.d/config.yaml.examples vagrant.d/config.yaml
        cp vagrant.d/installed_projects.json.examples vagrant.d/installed_projects.json
    ```
    Edit .env file and vagrant.d/config.yaml and vagrant.d/installed_projects.json if needed and than:
    ```
        vagrant up
    ```

## III. Setup the web interface

1. SSH login to the vagrant machine
2. Run `composer install` from the ROOT Directory of The Installed GUI
    if the composer install exit with error to install ocramius/package-versions use option `... --prefer-source` i don't know why:
    ```
        composer install --prefer-source
    ```
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
     
     Run Fixtures
     ```
       php bin/console doctrine:fixtures:load
     ```
     Generate Fixtures from Database
     ```
       php bin/console doctrine:generate:fixture --entity=Project --ids="1 2 3" --name="Test"
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
