#!/usr/bin/php
<?php
chdir( '/vagrant' );

exec( "mysqladmin -uroot -pvagrant create VsMyProjects" );
exec( "mysql -uroot -pvagrant VsMyProjects < /vagrant/doc/sql/VsMyProjects-20191206.sql" );

$installedHosts = json_decode( file_get_contents( 'installed_hosts.json' ), true );
foreach( $installedHosts as $host ) {
    //var_dump( $host ); die;
    exec( sprintf( "bin/console vs:mkvhost -s%s -d%s", $host['hostName'], $host['documentRoot'] ) );
    
    // Create storage dir out of shared folder
    if ( isset( $host['storageDir'] ) ) {
        exec( sprintf( "mkdir %s", $host['storageDir'] ) );
        exec( sprintf( "chmod -R 0777 %s", $host['storageDir'] ) );
    }
    
    // Create database
    if ( isset( $host['database'] ) ) {
        exec( sprintf( "mysqladmin -uroot -pvagrant create %s", $host['database'] ) );
    }
}
