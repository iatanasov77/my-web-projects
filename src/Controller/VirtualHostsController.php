<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

class VirtualHostsController extends Controller
{   
    /**
     * @Route("/hosts", name="virtual-hosts")
     */
    public function index( Request $request )
    {
        
        return $this->render('pages/virtual_hosts.html.twig', [
            'hosts'  => $this->virtualHosts()
        ]);
    }
    
    protected function virtualHosts()
    {
        $hosts   = [];
        $dir        = $this->container->getParameter( 'virtual_hosts_dir' );
        
        $handle = is_dir( $dir ) ? opendir( $dir ) : null;
        if ( $handle ) {
            
            while ( false !== ( $entry = readdir( $handle ) ) ) {
                if ( $entry != "." && $entry != ".." ) {
                    $hosts[] = $this->parseVhost( $dir . '/' . $entry );
                }
            }
            
            closedir( $handle );
        }
        
        return $hosts;
    }
    
    protected function parseVhost( $confFile )
    {
        $handle = fopen( $confFile, 'r' )or die( 'No open ups..' );
        
        $vhost  = [];
        while( ! feof( $handle ) ) {
            $line = fgets( $handle );
            $line = trim( $line );
            
            // CHECK IF STRING BEGINS WITH ServerAlias
            $tokens = explode( ' ',$line );
            
            if( ! empty( $tokens ) ) {
                if( strtolower( $tokens[0] ) == 'servername' ) {
                    $vhost['ServerName'] = $tokens[1];
                    $vhost['PhpVersion'] = 'default';
                }
                if( $tokens[0] == '<Proxy' ) {
                    if ( isset( $tokens[1] ) ) {
                        $proxyParts = explode( '/', $tokens[1] );
                        $vhost['PhpVersion'] = substr( $proxyParts[4], 4 );
                    }
                }
                
            } else {
                echo "Puked...";
            }
        }
        
        fclose( $handle );
        
        return $vhost;
    }
}
