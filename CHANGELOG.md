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
	

