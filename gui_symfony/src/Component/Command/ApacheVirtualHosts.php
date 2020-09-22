<?php namespace App\Component\Command;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;

class ApacheVirtualHosts implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    const PHP_STATUS_INSTALLED              = 1;
    const PHP_STATUS_INSTALLED_NOT_STARTED  = 2;
    const PHP_STATUS_NOT_INSTALLED          = 3;
    
    protected $phpStatuses          = [
        1   => 'Installed and Started',
        2   => 'Installed but Not Started',
        3   => 'Not Installed',
    ];
    
    protected $vhosts;
    
    public function getVirtualHosts()
    {
        if ( ! $this->vhosts ) {
            $this->vhosts   = [];
            
            $dir        = $this->container->getParameter( 'virtual_hosts_dir' );
            
            $handle = is_dir( $dir ) ? opendir( $dir ) : null;
            if ( $handle ) {
                
                while ( false !== ( $entry = readdir( $handle ) ) ) {
                    if ( $entry != "." && $entry != ".." ) {
                        $this->vhosts[] = $this->parseVhost( $dir . '/' . $entry );
                        
                    }
                }
                
                closedir( $handle );
            }
        }
        
        return $this->vhosts;
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
    
    protected function parseVhost( $confFile )
    {
        $vhost  = [
            'config'        => $confFile,
            'PhpVersion'    => 'default',
            'PhpStatus'     => $this->phpStatuses[self::PHP_STATUS_INSTALLED],
        ];
        
        $handle = fopen( $confFile, 'r' ) or die( 'No open directory ..' );
        while( ! feof( $handle ) ) {
            $line = fgets( $handle );
            $line = trim( $line );
            
            $this->parseLine( $line, $vhost );
            
        }
        fclose( $handle );
        
        //if( isset( $vhost['ServerName'] ) ) var_dump($vhost); die;
        return $vhost;
    }
    
    protected function parseLine( $line, &$vhost )
    {
        $tokens = explode( ' ',$line );
        
        // CHECK IF STRING BEGINS WITH ServerAlias
        if( ! empty( $tokens ) ) {
            
            switch ( strtolower( $tokens[0] ) ) {
                case 'documentroot':
                    $vhost['DocumentRoot']    = $tokens[1];
                    break;
                case 'servername':
                    $vhost['ServerName']    = $tokens[1];
                    break;
            }
            
            if( $tokens[0] == '<Proxy' ) {
                if ( isset( $tokens[1] ) ) {
                    $phpBrew                = $this->container->get( 'vs_app.php_brew' );
                    $proxyParts             = explode( '/', $tokens[1] );
                    
                    $vhost['PhpVersion']    = substr( $proxyParts[4], 4 );
                    
                    $phpStatus              = $phpBrew->getPhpStatus( $vhost['PhpVersion'] );
                    $vhost['PhpStatus']     = $this->phpStatuses[$phpStatus];
                }
            }
            
        } else {
            echo "Puked...";
        }
    }
}
