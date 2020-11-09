<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use App\Component\Apache\VirtualHost;
use App\Component\Apache\Php;

class VirtualHostsController extends Controller
{   
    /**
     * @Route("/hosts", name="virtual-hosts")
     */
    public function index( Request $request )
    {
        $virtualHosts   = $this->container->get( 'vs_app.apache_virtual_hosts' );
        $phpBrew        = $this->container->get( 'vs_app.php_brew' );
        
        return $this->render('pages/virtual_hosts.html.twig', [
            'hosts'                 => $virtualHosts->virtualHosts(),
            'installedPhpVersions'  => $phpBrew->getInstalledVersions()
        ]);
    }
    
    /**
     * @Route("/hosts/create", name="virtual-hosts-create")
     */
    public function create( Request $request )
    {
        if ( $request->isMethod( 'post' ) ) {
            $vhosts     = $this->container->get( 'vs_app.apache_virtual_hosts' );
            
            $host           = $request->request->get( 'hostName' );
            $documentRoot   = $request->request->get( 'documentRoot' );
            $serverAdmin    = $request->request->get( 'serverAdmin' );
            $phpVersion     = $request->request->get( 'phpVersion' );
            
            if ( $phpVersion != 'default' ) {
                $fpmSocket  = '/opt/phpbrew/php/' . $phpVersion . '/var/run/php-fpm.sock';
                $template   = 'simple-fpm';
            } else {
                $fpmSocket  = false;
                $template   = 'simple';
            }
            
            $vhost  = new VirtualHost([
                'PhpVersion'        => ltrim( $phpVersion, 'php-' ),
                'PhpStatus'         => Php::STATUS_INSTALLED,
                'PhpStatusLabel'    => Php::phpStatus( Php::STATUS_INSTALLED ),
                
                'ServerName'        => $host,
                'DocumentRoot'      => $documentRoot,
                'ServerAdmin'       => $serverAdmin,
                'LogDir'            => '/var/log/httpd/',
            ]);
            
            $vhosts->generateVirtualhost( $vhost, $template );
            
            return $this->redirectToRoute( 'virtual-hosts' );
        }
    }
    
    /**
     * @Route("/hosts/{host}/php-version", name="virtual-hosts-set-php-version")
     */
    public function setPhpVersion( Request $request )
    {
        if ( $request->isMethod( 'post' ) ) {
            $vhosts     = $this->container->get( 'vs_app.apache_virtual_hosts' );
     
            $host       = $request->attributes->get( 'host' );
            $phpVersion = ltrim( $request->request->get( 'php_version' ), 'php-' );
            
            $vhosts->setVirtualhost( $host, $phpVersion );

            return $this->redirectToRoute( 'virtual-hosts' );
        }
    }
}
