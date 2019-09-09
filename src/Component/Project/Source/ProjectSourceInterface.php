<?php namespace App\Component\Project\Source;

interface ProjectSourceInterface
{
    public function fetch( $projectRoot );
}
