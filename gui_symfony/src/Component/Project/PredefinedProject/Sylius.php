<?php namespace App\Component\Project\PredefinedProject;

class Sylius implements PredefinedProjectInterface
{
    public static function populate( &$project )
    {
        $project->setSourceType( 'git' );
        $project->setRepository( 'https://github.com/Sylius/Sylius-Standard.git' );
        $project->setBranch( '1.8' );
    }
}