<?php
error_reporting( E_ALL );
ini_set( 'display_errors', 1);

define( "APP_ROOT", realpath( __DIR__ . "/../" ) );

require_once __DIR__ . '/../vendor/autoload.php';

$bootstrap  = new \VankoSoft\MyProjects\Bootstrap();

$bootstrap->runApplication();
