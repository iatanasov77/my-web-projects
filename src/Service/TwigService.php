<?php namespace App\Service;

use Symfony\Component\HttpKernel\KernelInterface;

class TwigService { // extends \Twig_Environment

    public function __construct( KernelInterface $kernel )
    {
        $loader = new \Twig_Loader_Filesystem( $kernel->getProjectDir() );
        
        parent::__construct( $loader );
    }
}
