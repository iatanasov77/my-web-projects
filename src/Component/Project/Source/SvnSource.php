<?php namespace App\Component\Project\Source;

class SvnSource implements ProjectSourceInterface
{
    
    private $repository;
    
    private $branch;
    
    public function __construct( $repository, $branch )
    {
        $this->repository   = $repository;
        $this->branch       = $branch;
    }
    
    public function fetch( $projectRoot )
    {
        
    }
}

