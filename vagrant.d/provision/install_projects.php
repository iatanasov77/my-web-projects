#!/usr/bin/php
<?php

chdir( '/vagrant' );

$installedHosts = json_decode( file_get_contents( 'installed_hosts.json' ) );
foreach( $installedHosts as $host ) {
    //var_dump( $host ); die;
    exec( sprintf( "bin/console vs:mkvhost -s%s -d%s", $host->hostName, $host->documentRoot ) );    
}
