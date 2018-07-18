<?php
$jsonFile	= __DIR__ . "/../../installed_hosts.json";

if ( ! file_exists( $jsonFile ) )
{
	exit( 0 );
}

$json	= file_get_contents( $jsonFile );
$hosts 	= json_decode( $json, true );

foreach( $hosts as $h )
{
	$cmd	= sprintf( "/usr/bin/php /usr/local/bin/mkvhost -s%s -d%s -tsimple -f", $h['hostName'], $h['documentRoot'] );
	shell_exec( $cmd );
}

?>
