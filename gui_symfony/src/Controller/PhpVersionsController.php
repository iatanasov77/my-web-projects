<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Process\Process;
use Symfony\Component\HttpFoundation\StreamedResponse;

class PhpVersionsController extends Controller
{
    protected $phpBrew;
    
    /**
     * @Route("/php-versions", name="php-versions")
     */
    public function index( Request $request )
    {
        $this->phpBrew          = $this->container->get( 'vs_app.php_brew' );
        $installedVersions      = $this->phpBrew->getInstalledVersions();
        $availableVersions      = $this->phpBrew->getAvailableVersions();
        
        $phpbrewVariants        = $this->container->getParameter( 'phpbrew_variants' );
        $phpbrewVariantsDefault = $this->container->getParameter( 'phpbrew_variants_default' );
        //var_dump( json_encode( $phpbrewVariantsDefault ) ); die;
        
        return $this->render('pages/php_versions.html.twig', [
            'versions_installed'        => $installedVersions,
            'versions_available'        => $availableVersions,
            'phpbrew_variants'          => array_diff( $phpbrewVariants, $phpbrewVariantsDefault ),
            'phpbrew_variants_default'  => $phpbrewVariantsDefault,
        ]);
    }
    
    /**
     * @Route("/php-versions/available-gtree", name="php-versions-available-gtree")
     */
    public function gtreeTableSource( Request $request ): Response
    {
        $this->phpBrew  = $this->container->get( 'vs_app.php_brew' );
        $versions       = $this->phpBrew->getAvailableVersions();
        
        $parent         = $request->query->get( 'version' );
        $level          = $parent ? 2 : 1;
        
        $gtreeTableData = $this->buildGtreeTableData( $parent ? $versions[$parent] : $versions, $level );
        
        return new JsonResponse( ['nodes' => $gtreeTableData, 'readonly' => true] );
    }
    
    /**
     * @Route("/php-versions/install", name="php-versions-install")
     * 
     * 
     * See Build Log:  tail -F '/opt/phpbrew/build/php-7.4.1/build.log'
     */
    public function installPhpVersion( Request $request ): Response
    {
        if ( $request->isMethod( 'post' ) ) {
            
            $version            = $request->request->get( 'version' );
            $phpBrewVariants    = $request->request->get( 'phpBrewVariants' ) ?? [];
            $phpBrewCustomName  = $request->request->get( 'phpBrewCustomName' );
            $displayBuildOutput = $request->request->get( 'displayBuildOutput' ) ? true : false; 
            
            $this->phpBrew  = $this->container->get( 'vs_app.php_brew' );
            $process        = $this->phpBrew->install( $version, $phpBrewVariants, $displayBuildOutput, $phpBrewCustomName );
    
            return new StreamedResponse( function() use ( $process ) {
                echo '<span style="font-weight: bold;">Running command:</span> ' . $this->phpBrew->getCurrentCommand();
                
                foreach ( $process as $type => $data ) {
                    if ( Process::ERR === $type ) {
                        echo '[ ERR ] '. nl2br( $data ) . '<br />';
                    } else {
                        echo nl2br( $data ); 
                    }
                }
            });
            
        }
    }
    
    /**
     * EXAMPLES:   /php-versions/7.4.2/start-fpm
     *              /php-versions/7.4.2-CustomName/start-fpm
     * 
     * @Route("/php-versions/{version}/start-fpm", name="php-versions-start-fpm")
     */
    public function startPhpFpm( Request $request ): Response
    {
        $requestedVersion   = $request->attributes->get( 'version' );
        $parts              = explode( '-', $requestedVersion );
        
        /*
         * Good bundle: https://github.com/cocur/background-process
         */
        $command    = [
            '/bin/sudo',
            '/vagrant/bin/console',
            'vs:phpfpm',
            'start',
            '-p',
            $parts[0]
        ];
        
        if ( isset( $parts[1] ) ) {
            $command[]  = '-c';
            $command[]  = $parts[1];
        }
        
        $process    = new Process( $command );
        $process->start();
        
        $referer    = $request->headers->get( 'referer' ); // get the referer, it can be empty!
        
        return $this->redirect( $referer );
    }
    
    protected function buildGtreeTableData( $availableVersions, $level )
    {
        $installedVersions  = $this->phpBrew->getInstalledVersions();
        $data               = [];
        foreach ( $availableVersions as $k => $av ) {
            $version = [
                'id'        => $k,
                'name'      => $k,
                'level'     => $level,
                'type'      => in_array( 'php-' . $k, $installedVersions ) ? "installed" : "not_installed",
                'children'  => []
            ];
                
            $data[] = $version;
        }
        
        return $data;
    }
}