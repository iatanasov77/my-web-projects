<?php namespace VankoSoft\MyProjects\Helper;

class HttpHost
{
	public static function exists( $url ) 
	{
		$agent	= "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; pt-pt) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27";
		
		$ch		= curl_init();
		curl_setopt( $ch, CURLOPT_URL, $url );
		curl_setopt( $ch, CURLOPT_USERAGENT, $agent );		// sets the content of the User-Agent header
		curl_setopt( $ch, CURLOPT_NOBODY, true );			// make sure you only check the header - taken from the answer above
		curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true );	// follow "Location: " redirects
		curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );		// return the transfer as a string
		curl_setopt( $ch, CURLOPT_VERBOSE, false );			// disable output verbose information
		curl_setopt( $ch, CURLOPT_TIMEOUT, 5 );				// max number of seconds to allow cURL function to execute
		curl_exec( $ch );
		$httpcode = curl_getinfo( $ch, CURLINFO_HTTP_CODE );
		curl_close( $ch );
	
		return $httpcode != 404 ? true : false;
	}
	
	public function create( $url, $documentRoot )
	{
		$cmdMkVhost	= sprintf(
			"sudo /usr/bin/php /usr/local/bin/mkvhost -t simple -s %s -d %s -f",
			$this->project['dev_url'],
			$documentRoot
		);
		Shell::exec( $cmdMkVhost );
	}
}