<?php namespace VankoSoft\MyProjects;

use Davigs\Silex\YamlConfigServiceProvider;

use Silex\Application;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\TwigServiceProvider;
use Silex\Provider\AssetServiceProvider;

class Bootstrap extends Application
{
    public function runApplication()
    {
        $this->registerServices();
        $this->registerExtensions();
        $this->registerRoutes();

        $this->run();
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    protected function registerRoutes()
    {
        /**
         * Controllers
         */
        $this->mount('/',           new Controller\Dashboard() );
        $this->mount('/tool',       new Controller\Tools() );
        $this->mount('/project',    new Controller\Projects() );
    }

    protected function registerServices()
    {
        /**
         * YamlConfig
         */
        $this->register( new YamlConfigServiceProvider( APP_ROOT . '/config/app.yml' ) );

        /**
         * Doctrine
         */
        $this->register( new DoctrineServiceProvider(), array(
            'db.options'	=> array(
                'driver'	=> 'pdo_sqlite',
                'path'		=> APP_ROOT . '/storage/app.db',
            ),
        ));

        /**
         * Twig
         */
        $this->register( new TwigServiceProvider(), array(
            'twig.path'	=> APP_ROOT . '/resources/views',
        ));

        /**
         * Asset
         */
        $this->register( new AssetServiceProvider(), array(
            'assets.version' => 'v1',
            'assets.version_format' => '%s?version=%s',
            'assets.named_packages' => array(
                'css' => array('version' => 'css2', 'base_path' => '/whatever-makes-sense'),
                'images' => array('base_urls' => array('https://img.example.com')),
            ),
        ));
        
        if ( class_exists( '\WhoopsSilex\WhoopsServiceProvider' ) )
        {
            $this->register( new \WhoopsSilex\WhoopsServiceProvider );
        }

        /**
         * .ENV
         * use Ivoba\Silex\EnvProvider;
         */
//         $envOptions = ['env.options' => ['var_config' => [
//             'hoo' => [EnvProvider::CONFIG_KEY_ALLOWED => 'this'],
//             'zack' => [EnvProvider::CONFIG_KEY_REQUIRED => true],
//             'dong' => [EnvProvider::CONFIG_KEY_CAST => EnvProvider::CAST_TYPE_BOOLEAN],
//             'zip' => [EnvProvider::CONFIG_KEY_DEFAULT => 'zippi']]
//         ]];
//         $this->register( new EnvProvider(), $envOptions );
    }

    protected function registerExtensions()
    {
        /**
         * Twig Extensions
         */
        $this->extend( 'twig', function( $twig, $app )
        {
            $twig->addExtension(new Twig\ExtensionProject( $app ) );
            return $twig;
        });

        $this->extend( 'twig', function( $twig, $app )
        {
            $twig->addExtension(new Twig\ExtensionTool( $app ) );
            return $twig;
        });
    }
}
