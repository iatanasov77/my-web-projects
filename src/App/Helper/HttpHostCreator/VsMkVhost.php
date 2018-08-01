<?php namespace VankoSoft\MyProjects\Helper\HttpHostCreator;

use Symfony\Component\Process\Process;

class VsMkVhost extends AbstractHttpHostCreator
{
    
    /**
     * 
     * {@inheritDoc}
     * @see \VankoSoft\MyProjects\Helper\HttpHostCreator\AbstractHttpHostCreator::run()
     */
    public function run()
    {
        //$puppetCommand     = sprintf( 'echo "vagrant" | su vagrant -c "sudo php /usr/local/bin/mkvhost -t simple -s %s -d %s"', $this->host, $this->documentRoot );
        $puppetCommand     = sprintf( 'sudo php /usr/local/bin/mkvhost -t simple -a %s -s %s -d %s', $this->addr, $this->host, $this->documentRoot ); // This works but require user 'www-data' to be in sudoers
        $puppetProcesss    = new Process( $puppetCommand );
        //var_dump($puppetCommand); die;
        //$puppetProcesss->setTty( true );
        $puppetProcesss->run();
        
        echo nl2br( $puppetProcesss->getErrorOutput() );
        echo nl2br( $puppetProcesss->getOutput() );
        ob_flush();
        flush();
        
        return $puppetProcesss->isSuccessful();
    }
}
