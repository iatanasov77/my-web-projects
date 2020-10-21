<?php namespace App\Component\Installer;

class PredefinedProject
{
    const SYMFONY   = 'symfony';
    const LARAVEL   = 'laravel';
    const SYLIUS    = 'sylius';
    const MAGENTO   = 'magento';
    
    public static function choices()
    {
        return [
            'Symfony'   => self::SYMFONY,
            'Laravel'   => self::LARAVEL,
            'Sylius'    => self::SYLIUS,
            'Magento'   => self::MAGENTO,
        ];
    }
}
