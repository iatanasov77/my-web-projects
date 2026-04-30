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
