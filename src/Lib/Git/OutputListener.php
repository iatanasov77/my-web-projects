<?php namespace VankoSoft\MyProjects\Lib\Git;

use GitWrapper\Event\GitOutputListenerInterface;
use GitWrapper\Event\GitOutputEvent;

/**
 * @brief       Git command real-time output
 * @author      Ivan Atanasov
 */
class OutputListener implements GitOutputListenerInterface
{
    /**
     * @brief   Handle output
     * @param \GitWrapper\Event\GitOutputEventGitOutputEvent $event
     */
    public function handleOutput( GitOutputEvent $event )
    {
        $pr = $event->getProcess();
        
        $pr->setIdleTimeout( null );
        $pr->setTimeout( null );
        
        foreach( $pr as $output )
        {
            echo "<br />" . $output;
            echo '<script> $( \'html, body\' ).animate( { scrollTop: $(document).height() }, \'slow\' ); </script>';
            
            ob_flush();
            flush();
        }
    }
}
