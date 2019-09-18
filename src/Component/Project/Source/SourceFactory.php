<?php namespace App\Component\Project\Source;

class SourceFactory {
    
    public static function source( $project )
    {
        $source;
        switch ( $project->getSourceType() ) {
            case 'git':
                $source = new GitSource( $project );
                break;
        }
        
        return $source;
    }
}
