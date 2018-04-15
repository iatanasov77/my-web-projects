<?php

if ( ! file_exists( "../../installed_hosts.json" ) )
{
	exit( 0 );
}

$json	= file_get_contents( "../../installed_hosts.json" );
$hosts 	= json_decode( $json, true );

foreach( $hosts as $h )
{
	shell_exec( "/usr/bin/php /usr/local/bin/mkvhost -smyprojects.lh -d/vagrant/web -tsimple -f" );
}

?>
