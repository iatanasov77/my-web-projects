<?php namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ProjectRepository")
 * @ORM\Table(name="projects_hosts")
 */
class ProjectHost
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    protected $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Project", inversedBy="hosts")
     */
    protected $project;
    
    /**
     * @ORM\Column(name="host_type", type="string", length=32)
     * @Assert\NotBlank
     */
    protected $hostType;
    
    /**
     * @ORM\Column(type="string", length=32)
     * @Assert\NotBlank
     */
    protected $host;
    
    /**
     * @ORM\Column(name="document_root", type="string", length=128)
     * @Assert\NotBlank
     */
    protected $documentRoot;
    
    /**
     * @ORM\Column(name="reverseProxy", type="string", length=128)
     */
    protected $reverseProxy;
    
    /**
     * @ORM\Column(name="phpVersion", type="string", length=32)
     */
    protected $phpVersion;
    
    /**
     * @ORM\Column(name="with_ssl", type="boolean")
     */
    protected $withSsl;
    
    public function getId(): ?int
    {
        return $this->id;
    }
    
    public function getProject(): ?Project
    {
        return $this->project;
    }
    
    public function setProject(?Project $project): self
    {
        $this->project = $project;
        
        return $this;
    }
    
    public function getHostType(): ?string
    {
        return $this->hostType;
    }
    
    public function setHostType(string $hostType): self
    {
        $this->hostType = $hostType;
        
        return $this;
    }
    
    public function getHost(): ?string
    {
        return $this->host;
    }
    
    public function setHost(string $host): self
    {
        $this->host = $host;
        
        return $this;
    }
    
    public function getDocumentRoot(): ?string
    {
        return $this->documentRoot;
    }
    
    public function setDocumentRoot(string $documentRoot): self
    {
        $this->documentRoot = $documentRoot;
        
        return $this;
    }
    
    public function getReverseProxy(): ?string
    {
        return $this->reverseProxy;
    }
    
    public function setReverseProxy(string $reverseProxy): self
    {
        $this->reverseProxy = $reverseProxy;
        
        return $this;
    }
    
    public function getPhpVersion(): ?string
    {
        return $this->phpVersion;
    }
    
    public function setPhpVersion(string $phpVersion): self
    {
        $this->phpVersion = $phpVersion;
        
        return $this;
    }
    
    public function getWithSsl(): ?bool
    {
        return $this->withSsl;
    }
    
    public function setWithSsl(bool $withSsl): self
    {
        $this->withSsl = $withSsl;
        
        return $this;
    }
}
    