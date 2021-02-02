<?php namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ProjectRepository")
 * @ORM\Table(name="projects_hosts_options")
 */
class ProjectHostOption
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    protected $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\ProjectHost", inversedBy="options", cascade={"persist"})
     */
    protected $host;
    
    /**
     * @ORM\Column(name="option_key", type="string", length=64)
     * @Assert\NotBlank
     */
    protected $key;
    
    /**
     * @ORM\Column(name="option_value", type="string", length=64)
     * @Assert\NotBlank
     */
    protected $value;
    
    public function getId(): ?int
    {
        return $this->id;
    }
    
    public function getHost(): ?Project
    {
        return $this->host;
    }
    
    public function setHost(?ProjectHost $host): self
    {
        $this->host = $host;
        
        return $this;
    }
    
    public function getKey(): ?string
    {
        return $this->key;
    }
    
    public function setKey(string $key): self
    {
        $this->key = $key;
        
        return $this;
    }
    
    public function getValue(): ?string
    {
        return $this->value;
    }
    
    public function setValue(string $value): self
    {
        $this->value = $value;
        
        return $this;
    }
    
    public function __toString()
    {
        return $this->value;
    }
}
    