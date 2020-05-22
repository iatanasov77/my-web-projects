<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

class PhpVersionsController extends Controller
{
    /**
     * @Route("/php-versions", name="php-versions")
     */
    public function index( Request $request )
    {
        
        return $this->render('pages/php_versions.html.twig', [
            'versions'  => $this->installedVersions()
        ]);
    }
    
    protected function installedVersions()
    {
        $versions   = [];
        $dir        = $this->container->getParameter( 'php_versions_dir' );
        
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
