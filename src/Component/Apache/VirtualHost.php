<?php namespace App\Component\Apache;

class VirtualHost
{
    /**
     * @var string
     */
    protected $host;
    
    /**
     * @var string
     */
    protected $documentRoot;
    
    /**
     * @var string
     */
    protected $serverAdmin;
    
    /**
     * @var string
     */
    protected $apacheLogDir;
    
    /**
     * @var string
     */
    protected $phpVersion;
    
    /**
     * @var int
     */
    protected $phpStatus;
    
    /**
     * @var string
     */
    protected $phpStatusLabel;
    
    public function __construct( $vhostConfig )
    {
        $this->host             = $vhostConfig['ServerName'];
        $this->documentRoot     = $vhostConfig['DocumentRoot'];
        $this->serverAdmin      = isset( $vhostConfig['ServerAdmin'] ) ? $vhostConfig['ServerAdmin'] : 'webmaster@' . $this->host;
        $this->apacheLogDir     = $vhostConfig['LogDir'];
        
        $this->phpVersion       = $vhostConfig['PhpVersion'];
        $this->phpStatus        = $vhostConfig['PhpStatus'];
        $this->phpStatusLabel   = $vhostConfig['PhpStatusLabel'];
    }
    
    public function generateVirtualHost( $host )
    {
        $apache = $this->container->get( 'vs_app.apache_service' );
        
        $vhostConfFile	= '/etc/httpd/conf.d/' . $host . '.conf';
        $apacheLogDir   = '/var/log/httpd/';
        
        $vhost  = $this->getContainer()->get('templating')->render( $template, [
            'host' => $host,
            'documentRoot'  => $documentRoot,
            'serverAdmin'   => $serverAdmin,
            'apacheLogDir'  => $apacheLogDir,
            'fpmSocket'     => $fpmSocket
        ]);
        
        if ( $withSsl )
        {
            $vhost  .= "\n\n" . $this->twig->render( 'templates/mkvhost/ssl.twig', [
                'host' => $host,
                'documentRoot'  => $documentRoot,
                'serverAdmin'   => $serverAdmin,
                'apacheLogDir'  =>$apacheLogDir
            ]);
        }
        file_put_contents( $vhostConfFile, $vhost );
        
        // Reload Apache
        $output->writeln( 'Restarting apache service...' );
        exec( "service httpd restart" );
    }
    
    public function getHost()
    {
        return $this->host;
    }
    
    public function getDocumentRoot()
    {
        return $this->documentRoot;
    }
    
    public function getServerAdmin()
    {
        return $this->serverAdmin;
    }
    
    public function getApacheLogDir()
    {
        return $this->apacheLogDir;
    }
    
    public function getPhpVersion()
    {
        return $this->phpVersion;
    }
    
    public function getPhpStatus()
    {
        return $this->phpStatus;
    }
    
    public function getPhpStatusLabel()
    {
        return $this->phpStatusLabel;
    }
}
