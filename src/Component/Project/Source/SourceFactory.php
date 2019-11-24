<?php namespace App\Component\Project\Source;

class SourceFactory {
    
    public static function source( $project )
    {
        switch ( $project->getSourceType() ) {
            case 'git':
                $source = new GitSource( $project );
                break;
            case 'install_manual':
                $source = new ManualSource( $project );
                break;
            default:
                $source = null;
        }
        
        return $source;
    }
}
