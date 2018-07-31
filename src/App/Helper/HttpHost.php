<?php namespace VankoSoft\MyProjects\Helper;

use GuzzleHttp\Client as HttpClient;
use GuzzleHttp\Exception\ConnectException as HttpConnectException;
use GuzzleHttp\Exception\GuzzleException;

use VankoSoft\MyProjects\Helper\HttpHostCreator\VsMkVhost;
//use VankoSoft\MyProjects\Helper\HttpHostCreator\PuppetMkVhost;

/**
 * 
 * @author ivan.atanasov
 *
 */
class HttpHost
{
    /**
     * @brief   Check if an apache virttual host exists
     * 
     * @TODO    Use 'sudo /usr/sbin/apache2 -S'  to check your virtual host configuration.
     *          For RedHat derived distributions: 'sudo /usr/sbin/httpd -S'
     *          
     * @param   string $host
     * 
     * @return  boolean
     */
	public static function exists( $host )
	{
		$client   = new HttpClient();
		
		try {
            $res      = $client->request( 'GET', $host );
		}
		catch( HttpConnectException $e )
		{
		    //throw $e;
		    return false;
		}
		catch( GuzzleException $e )
		{
		    //throw $e;
		    return true;
		}
		
		return $res->getStatusCode() != 404;
	}
	
	/**
	 * @brief  Create an Apache Virtual Host
	 * 
	 * @TODO   Create symlink to my vagrant machine puppet modules
	 *         # sudo ln -s /vagrant/vagrant.d/puppet/modules /usr/share/puppet/modules
	 *         
	 * @param  string $host
	 * @param  string $documentRoot
	 * 
	 * @return boolean
	 */
	public static function create( $host, $documentRoot, $addr = '127.0.0.1' )
	{
	    //$VhostCreator  = new PuppetMkVhost( ['host' => $host, 'documentRoot' => $documentRoot] );
	    $VhostCreator  = new VsMkVhost( ['addr' => $addr, 'host' => $host, 'documentRoot' => $documentRoot] );
	    
	    return $VhostCreator->run();
	}
}