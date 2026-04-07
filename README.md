# Vagrant Machine for Developement

## Installation and Setup
  - [**Installation and Setup**](/doc/installation-and-setup.md)

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
