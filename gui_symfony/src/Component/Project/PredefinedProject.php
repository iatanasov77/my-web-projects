<?php namespace App\Component\Project;

use App\Component\Project\PredefinedProject\Sylius;

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
        switch ( $predefinedType ) {
            case PredefinedProject::SYLIUS:
                Sylius::populate( $project );
                break;
            default:
                throw new \Exception( 'Not Implemented' );
        }
    }
}
