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
        $versions   = [];
        $dir        = $this->container->getParameter( 'virtual_hosts_dir' );
        
        $handle = is_dir( $dir ) ? opendir( $dir ) : null;
        if ( $handle ) {
            
            while (false !== ($entry = readdir($handle))) {
                if ( $entry != "." && $entry != ".." ) {
                    $versions[] = $entry;
                }
            }
            
            closedir( $handle );
        }
        
        return $versions;
    }
}
