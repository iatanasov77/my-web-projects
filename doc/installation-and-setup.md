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
