<?php namespace App\Component\Project;

use App\Component\Project\PredefinedProject\PredefinedProjectInterface;
use App\Component\Project\PredefinedProject\Sylius;
use App\Component\Project\PredefinedProject\Magento;

class PredefinedProject
{
    const SYMFONY   = 'symfony';
    const LARAVEL   = 'laravel';
    const SYLIUS    = 'sylius';
    const MAGENTO   = 'magento';
    
    public static function json()
    {
        return \json_encode([
            self::SYLIUS    => Sylius::data(),
            self::MAGENTO   => Magento::data(),
        ], JSON_FORCE_OBJECT);    
    }
    
    public static function choices()
    {
        return [
            'Symfony'   => self::SYMFONY,
            'Laravel'   => self::LARAVEL,
            'Sylius'    => self::SYLIUS,
            'Magento'   => self::MAGENTO,
        ];
    }
    
    public static function populate( &$project, $predefinedType )
    {
        self::instance( $predefinedType )->populate( $project );
    }
    
    public static function instance( $predefinedType ): PredefinedProjectInterface
    {
        switch ( $predefinedType ) {
            case PredefinedProject::SYLIUS:
                return new Sylius();
                break;
            default:
                throw new \Exception( 'Not Implemented' );
        }
    }
}
