<?php namespace App\Component;

use Symfony\Component\Security\Core\Authorization\AuthorizationChecker;
use Symfony\Component\Routing\RouterInterface;

use VS\ApplicationBundle\Component\Menu\MenuBuilder;
use Knp\Menu\FactoryInterface;

class Developement extends MenuBuilder
{
    public function __construct( string $config_file, AuthorizationChecker $security, RouterInterface $router )
    {
        parent::__construct( $config_file, $security, $router );
    }
    
    public function devMenu( FactoryInterface $factory )
    {
        $menu   = $factory->createItem( 'root' );
        
        if ( ! isset( $this->menuConfig['devMenu'] ) ) {
            throw new \Exception( '"devMenu" node must be provided at "vs_application.yaml" config file.' );
        }
        $this->build( $menu, $this->menuConfig['devMenu'] );
        //var_dump($this->menuConfig['devMenu']['cmsBundle']['childs']); die;
        return $menu;
    }
}
