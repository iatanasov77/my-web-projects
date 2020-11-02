<?php namespace App\Component\Installer;

class SyliusInstaller
{
    
    
    /**
     * Steps for Instalation
     * =======================
     * # composer create-project sylius/sylius-standard MyFirstShop
     * # bin/console sylius:install
     * # yarn install
     * # yarn build
     * =======================
     * Enjoy :)
     * 
     */
    public function install()
    {
        // Create the Command
        $options            = [];
        $variantsDefaults   = $this->container->getParameter( 'phpbrew_variants_default' );
        $command            = ['sudo', 'phpbrew', 'install'];
        
        
        
        $currentCommand = array_merge( $command, $options, [$version], $variantsDefaults, $variants );
        
        if ( PHP_INT_SIZE === 8 ) {
            $currentCommand[] = '--';
            $currentCommand[] = '--with-libdir=lib64';
        }
        
        $this->setCurrentCommand( $currentCommand );
        
        // Run the Command
        $process    = new Process( $currentCommand );
        
        // Run The process
        ob_implicit_flush( 1 );
        ob_end_flush();
        
        $process->setTimeout( null );
        $process->start();
        
        return $process;
    }
}
