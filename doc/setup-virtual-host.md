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
