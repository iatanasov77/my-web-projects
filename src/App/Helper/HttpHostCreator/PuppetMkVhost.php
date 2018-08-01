<?php namespace VankoSoft\MyProjects\Helper\HttpHostCreator;

use Symfony\Component\Process\Process;

class PuppetMkVhost extends AbstractHttpHostCreator
{
    /**
     * @brief   Puppet manifest
     *
     * @var     string
     */
    const HOST_CONFIG   = "
    	apache::vhost { '__HOSTNAME__':
    		port    	=> '80',
    		docroot 	=> '__DOCUMENT_ROOT__',
    		override	=> 'all',
    		php_values 		=> ['memory_limit 1024M'],
        
    		directories => [
    			{
    				'path'		=> '__DOCUMENT_ROOT__',
    				'override'	=> 'All',
    				'Require'	=> 'all granted' ,
    			}
    		]
    	}
    ";
    
    public function run()
    {
        $variables         = [
            '__HOSTNAME__'         => $this->host,
            '__DOCUMENT_ROOT__'    => $this->documentRoot
        ];
        $puppetClass       = str_replace( array_keys( $variables ), array_values( $variables ), self::HOST_CONFIG );
        $puppetCommand     = sprintf( 'puppet apply -e "%s"', $puppetClass );
        $puppetProcesss    = new Process( $puppetCommand, APP_ROOT, ['HOME' => '/home/vagrant'] );
        
        $puppetProcesss->run();
        
        echo nl2br( $puppetProcesss->getErrorOutput() );
        echo nl2br( $puppetProcesss->getOutput() );
        ob_flush();
        flush();
        
        return $puppetProcesss->isSuccessful();
    }
}
