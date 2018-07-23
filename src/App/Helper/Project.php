<?php namespace VankoSoft\MyProjects\Helper;


class Project
{

    public static function exists( $project )
    {
        global $bootstrap;
        
        return is_dir( $bootstrap['config']['projects_path'] . $project['project_root'] );
    }

    public static function installed( $project )
    {
        global $bootstrap;

        $hostsFile  = APP_ROOT . $bootstrap['config']['installed_hosts'];
        $hosts      = [];
        
        if ( file_exists( $hostsFile ) )
        {
            $json		= file_get_contents( $hostsFile );
            $hosts 		= json_decode( $json, true );
        }

        return isset( $hosts[$project['id']] );
    }
}
