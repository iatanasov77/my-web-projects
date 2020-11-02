<?php namespace App\Component\Installer;

use App\Component\Project\PredefinedProject;

class InstallerFactory {
    
    public static function installer( $predefinedType )
    {
        switch ( $predefinedType ) {
            case PredefinedProject::SYLIUS:
                $installer = new SyliusInstaller();
                break;
            default:
                throw new \Exception( 'Not Implemented' );
        }
        
        return $installer;
    }
}
