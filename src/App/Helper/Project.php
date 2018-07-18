<?php namespace VankoSoft\MyProjects\Helper;


class Project
{

    public static function exists( $project )
    {
        global $app;

        return is_dir( $app['projects_path'] . $project['project_root'] );
    }

    public static function installed( $project )
    {
        global $app;

        $hosts  = [];
        if ( file_exists( $app['installed_hosts'] ) )
        {
            $json		= file_get_contents( $app['installed_hosts'] );
            $hosts 		= json_decode( $json, true );
        }

        return isset( $hosts[$project['id']] );
    }
}
