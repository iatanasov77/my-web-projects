4.2.1	|	Release date: **31.10.2022**
============================================
* New Features and Improvements:
  - Add to Docs - Third Party Projects.
  - Add to Docs - Mysql Log Queries..
  - Update Puppet Module vs_core.
  - Enable Docker in Config.


4.2.0	|	Release date: **03.06.2022**
============================================
* New Features:
  - Add Technical Manual For ISP Project Config.
  - Add Soap in PHP Extensions Example. Php-Soap is Needed for Magento.
  - Update Submodule vs-devenv
  - Update Docker Configuration.
  - Update VS Puppet Modules.


4.1.0	|	Release date: **10.04.2022**
============================================
* New Features:
  - Update Vagrant Machine Name.
  - Upgrade Vagrant Machine Configuration and Initialization.
  - Add MailCatcher Subsystem.
  - Update GUI Database Dump and Config.
* Bug-Fixes:
  - Fix Configuration and Puppet Modules.


4.0.2	|	Release date: **03.03.2022**
============================================
* New Features and Improvements:
  - New Version of vs_tools/bumpversion
  - Upgrade Config Example.
  - Add to Vagrantfile to use configurable mount type for shared folders.
  - Update VsDevEnv puppet module.
  - Disable CSRF Protection in All Forms.


4.0.1	|	Release date: **11.11.2021**
============================================
* New Features and Improvements:
  - Add Git Global Credentials.
  - Update Vagrant Config.
  - Add Latest Version of NodeJs in config.yaml.examples
  - Add Puppet Module Vcsrepo and Change Some Configurations About InsGit Instalation and Configuration.


4.0.0	|	Release date: **15.09.2021**
============================================
* New Features and Many Refactoring And Improvements:
  - Update README with new url of this repository.
  - Add to Documentation.
  - Add Symfony SubSystem into SubSytems Config.
  - Using NFS for Mounting Shared Folders.
  - Add dependencies config.
  - Configuration and Puppet Modules Update.
  - Add puppet module 'bashrc'.
  - Subsystem Cassandra approvements.
  - Adding package 'lsof' for ports monitoring in the config packages.


3.2.0	|	Release date: **09.05.2021**
============================================
* New Features:
  - Add Subsystem Cassandra
* Bug-Fixes:
  - Fixing Submodules


3.1.0	|	Release date: **12.04.2021**
============================================
* New Features:
  - Add Devops hosts in the /etc/hosts
  - Remove Puppet module Hashicorp
  - Add phing in the subsystems config examples.
  - Add public network of the vagrant machine.
  - Add Java Spring Example.
  - Updates of Puppet Modules.


3.0.0	|	Release date: **23.02.2021**
============================================
* BIG REFACTORING:
  Remove Symfony GUI and add it in the separate repository.

* New Features:
  - Add Example of RubyOnRails Application.
  - Add Django Example.
  - [Vagrant] Add Puppet module RVM.
  - [Vagrant] Add Composer to subsystems config to can install older versions if needed.
  - [Vagrant] Python installation with venvs
  - [Vagrant] Add Python and Ruby Opportunities.
  - [VAGRANT] New Modules.
  - [Vagrant] Add Django puppet module.
  - [Gui] Create Django Virtual Host.
  - [Gui] Separate ProjectsHost Entity from host options.

* Bug-Fixes:
  - [GUI] Fix Category Create Form.
  - [Gui] PhpBrew fpm service setup and start after installation process.
  - [Gui] PhpVersions table -  refactoring actions icons.
  - [GUI] Change HostOptions relation to json field instead another related entity.
  - [Gui] Sync configs and db structure according to new changes of vankosoft bundles.


2.1.1	|	Release date: **19.01.2021**
==============================================
* Improvements:
  - Structured Changes.
  - Fix XDebug to version 2.9.8 because latest versions has different config vars.


2.1.0	|	Release date: **18.01.2021**
============================================
* New Features:
  - [GUI] Creating SSL Virtual Hosts.
  - [GUI] Delete VirtualHost functionality.
  - [GUI] Create new Virtual Host. PhpFpm service commands: start,stop,restart
        Star/Stop Php Fpm.
  - [GUI] Project Installer.
  - [GUI] Installation of predefined projects.
  - [GUI] Extend 'mkvhost' command to add FastCGI directives
  - [Vagrant] Add Drush(Drupal CLI) into subsystems.
  - [Vagrant] Add puppet module hashicorp and install vault.
  - [Vagrant] Add Subsystem Tomcat.
  - [Vagrant] Load puppet facts from yaml.
  - [Vagrant] Creating SSL Hosts.

* Improvements:
  - [GUI] Separate Host fields from Project Entity in diferent Entity.
  - [Vagrant] Refactoring and On CentOs8 using mysql instead of mariadb.
  - [Vagrant] Run All on CentOs 8.
  - [Vagrant] Fix How Vagrantfile iterate hosts to add it to hostmanager plugin.
  - [Vagrant] Add frontend tools Hash to Devenv params.
  - [Vagrant] Change Puppet Version to 6.*. 
  - [Vagrant] Adding config var for switch off phpunit instalation.
  - [Vagrant] ENV VARS EXAMPLE .env.dist
	

