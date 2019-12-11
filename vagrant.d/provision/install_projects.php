#!/usr/bin/php
<?php
chdir( '/vagrant' );

$installedHosts = json_decode( file_get_contents( 'installed_hosts.json' ) );
foreach( $installedHosts as $host ) {
    //var_dump( $host ); die;
    exec( sprintf( "bin/console vs:mkvhost -s%s -d%s", $host->hostName, $host->documentRoot ) );
    
    // Create storage dir out of shared folder
    if ( $host->createStorageDir ) {
        exec( sprintf( 'mkdir /var/www/%s', $host->hostName ) );
        exec( sprintf( 'chmod -R 0777 /var/www/%s', $host->hostName ) );
    }
}
