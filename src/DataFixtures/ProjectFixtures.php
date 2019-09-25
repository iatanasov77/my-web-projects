<?php namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Yaml\Yaml;

use App\Entity\Project;

class ProjectFixtures extends Fixture
{
    public function load( ObjectManager $manager )
    {
        $projects   = Yaml::parseFile( __DIR__ . '/../../config/fixtures/projects.yaml' );
        
        foreach ( $projects as $pr )
        {
            $project = new Project();
            $project->setName( $pr['name'] );
            $project->setSourceType( $pr['source_type'] );
            $project->setRepository( $pr['repository'] );
            $project->setBranch( $pr['branch'] );
            $project->setProjectRoot( $pr['project_root'] );
            $project->setDocumentRoot( $pr['document_root'] );
            $project->setHost( $pr['host'] );
            $project->setWithSsl( $pr['with_ssl'] );
            
            $manager->persist( $project );
        }
        
        $manager->flush();
    }
}
