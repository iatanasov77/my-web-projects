<?php namespace App\Component\Project;

class Project
{
    private $project;
    
    public function __construct( $project )
    {
        $this->project  = $project;
    }
    
    public function source()
    {
        $source;
        switch ( $project->source_type ) {
            case 'git':
                $source = new GitSource( $project->repository, $project->branch );
                break;
        }
        
        return source;
    }
    
    public static function exists( $project )
    {
        global $bootstrap;
        
        return is_dir( $bootstrap['config']['projects_path'] . $project['project_root'] );
    }
    
    public static function installed( $project )
    {
        global $bootstrap;
        
        $hostsFile  = $project->getProjectRoot() . $bootstrap['config']['installed_hosts'];
        $hosts      = [];
        
        if ( file_exists( $hostsFile ) )
        {
            $json		= file_get_contents( $hostsFile );
            $hosts 		= json_decode( $json, true );
        }
        
        return isset( $hosts[$project->getId()] );
    }
}
