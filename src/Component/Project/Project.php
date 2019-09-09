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
}
