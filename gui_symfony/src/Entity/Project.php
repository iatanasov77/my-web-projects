<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

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
    protected $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="Category", inversedBy="projects")
     */
    protected $category;
    
    /**
     * @ORM\Column(type="string", length=128)
     * @Assert\NotBlank
     */
    protected $name;
    
    /**
     * @ORM\Column(type="text")
     */
    protected $description;
    
    /**
     * @ORM\Column(name="source_type", type="string", columnDefinition="enum('wget', 'git', 'svn', 'install_manual')")
     */
    protected $sourceType;
    
    
    /**
     * @ORM\Column(type="string", length=128)
     */
    protected $repository;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    protected $branch;
    
    /**
     * @ORM\Column(name="project_root", type="string", length=128)
     * @Assert\NotBlank
     */
    protected $projectRoot;
    
    /**
     * @ORM\Column(name="document_root", type="string", length=128)
     * @Assert\NotBlank
     */
    protected $documentRoot;
    
    /**
     * @ORM\Column(type="string", length=32)
     * @Assert\NotBlank
     */
    protected $host;
    
    /**
     * @ORM\Column(name="with_ssl", type="boolean")
     */
    protected $withSsl;
    
    /**
     * @ORM\Column(name="install_manual", type="string")
     */
    protected $installManual;
    
    /**
     * @ORM\Column(name="phpFpmSocket", type="string", length=128)
     */
    protected $phpFpmSocket;
    
    /**
     * @ORM\Column(name="reverseProxy", type="string", length=128)
     */
    protected $reverseProxy;
    
    /**
     * @ORM\Column(name="predefinedType", type="string", length=64)
     */
    protected $predefinedType;
    
    /**
     * @ORM\Column(name="predefinedTypeParams", type="json")
     */
    protected $predefinedTypeParams;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }
    
    public function setCategory(?Category $category): self
    {
        $this->category = $category;
        
        return $this;
    }
    
    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
    
    public function getDescription(): ?string
    {
        return $this->description;
    }
    
    public function setDescription(string $description): self
    {
        $this->description = $description;
        
        return $this;
    }

    public function getSourceType(): ?string
    {
        return $this->sourceType;
    }

    public function setSourceType(string $sourceType): self
    {
        $this->sourceType = $sourceType;

        return $this;
    }

    public function getRepository(): ?string
    {
        return $this->repository;
    }

    public function setRepository(string $repository): self
    {
        $this->repository = $repository;

        return $this;
    }

    public function getBranch(): ?string
    {
        return $this->branch;
    }

    public function setBranch(string $branch): self
    {
        $this->branch = $branch;

        return $this;
    }

    public function getProjectRoot(): ?string
    {
        return $this->projectRoot;
    }

    public function setProjectRoot(string $projectRoot): self
    {
        $this->projectRoot = $projectRoot;

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

    public function getHost(): ?string
    {
        return $this->host;
    }

    public function setHost(string $host): self
    {
        $this->host = $host;

        return $this;
    }

    public function getWithSsl(): ?string
    {
        return $this->withSsl;
    }

    public function setWithSsl(string $withSsl): self
    {
        $this->withSsl = $withSsl;

        return $this;
    }
    
    public function getInstallManual(): ?string
    {
        return $this->installManual;
    }
    
    public function setInstallManual(string $installManual): self
    {
        $this->installManual = $installManual;
        
        return $this;
    }
    
    public function getPhpFpmSocket(): ?string
    {
        return $this->phpFpmSocket;
    }
    
    public function setPhpFpmSocket(string $phpFpmSocket): self
    {
        $this->phpFpmSocket = $phpFpmSocket;
        
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
    
    public function getPredefinedType(): ?string
    {
        return $this->predefinedType;
    }
    
    public function setPredefinedType(string $predefinedType): self
    {
        $this->predefinedType = $predefinedType;
        
        return $this;
    }
    
    public function getPredefinedTypeParams(): ?array
    {
        return $this->predefinedTypeParams;
    }
    
    public function setPredefinedTypeParams(?array $predefinedTypeParams): self
    {
        $this->predefinedTypeParams = $predefinedTypeParams;
        
        return $this;
    }
}
