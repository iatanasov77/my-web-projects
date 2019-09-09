<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ProjectRepository")
 * @ORM\Table(name="projects")
 */
class Project
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;
    
    /**
     * @ORM\Column(type="string", length=128)
     */
    private $name;
    
    /**
     * @ORM\Column(name="source_type", type="string", columnDefinition="enum('wget', 'git', 'svn')")
     */
    private $sourceType;
    
    
    /**
     * @ORM\Column(type="string", length=128)
     */
    private $repository;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    private $branch;
    
    /**
     * @ORM\Column(name="project_root", type="string", length=128)
     */
    private $projectRoot;
    
    /**
     * @ORM\Column(name="document_root", type="string", length=32)
     */
    private $documentRoot;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    private $host;
    
    /**
     * @ORM\Column(name="with_ssl", type="string", length=32)
     */
    private $withSsl;
}
