<?php namespace App\Component\Apache;

class VirtualHost
{
    /**
     * @var string
     */
    protected $host;
    
    /**
     * @var string
     */
    protected $documentRoot;
    
    /**
     * @var string
     */
    protected $serverAdmin;
    
    /**
     * @var string
     */
    protected $apacheLogDir;
    
    /**
     * @var string
     */
    protected $phpVersion;
    
    /**
     * @var int
     */
    protected $phpStatus;
    
    /**
     * @var string
     */
    protected $phpStatusLabel;
    
    /**
     * @var bool
     */
    protected $withSsl;
    
    public function __construct( $vhostConfig )
    {
        $this->host             = $vhostConfig['ServerName'];
        $this->documentRoot     = $vhostConfig['DocumentRoot'];
        $this->serverAdmin      = isset( $vhostConfig['ServerAdmin'] ) ? $vhostConfig['ServerAdmin'] : 'webmaster@' . $this->host;
        $this->apacheLogDir     = $vhostConfig['LogDir'];
        
        $this->phpVersion       = $vhostConfig['PhpVersion'];
        $this->phpStatus        = $vhostConfig['PhpStatus'];
        $this->phpStatusLabel   = $vhostConfig['PhpStatusLabel'];
        $this->withSsl          = $vhostConfig['WithSsl'];
    }
    
    public function getHost()
    {
        return $this->host;
    }
    
    public function setHost( $host )
    {
        $this->host = $host;
        
        return $this;
    }
    
    public function getDocumentRoot()
    {
        return $this->documentRoot;
    }
    
    public function setDocumentRoot( $documentRoot )
    {
        $this->documentRoot = $documentRoot;
        
        return $this;
    }
    
    public function getServerAdmin()
    {
        return $this->serverAdmin;
    }
    
    public function setServerAdmin( $serverAdmin )
    {
        $this->serverAdmin = $serverAdmin;
        
        return $this;
    }
    
    public function getApacheLogDir()
    {
        return $this->apacheLogDir;
    }
    
    public function setApacheLogDir( $apacheLogDir )
    {
        $this->apacheLogDir = $apacheLogDir;
        
        return $this;
    }
    
    public function getPhpVersion()
    {
        return $this->phpVersion;
    }
    
    public function setPhpVersion( $phpVersion )
    {
        $this->phpVersion = $phpVersion;
        
        return $this;
    }
    
    public function getPhpStatus()
    {
        return $this->phpStatus;
    }
    
    public function setPhpStatus( $phpStatus )
    {
        $this->phpStatus = $phpStatus;
        
        return $this;
    }
    
    public function getPhpStatusLabel()
    {
        return $this->phpStatusLabel;
    }
    
    public function setPhpStatusLabel( $phpStatusLabel )
    {
        $this->phpStatusLabel = $phpStatusLabel;
        
        return $this;
    }

    public function getWithSsl()
    {
        return $this->withSsl;
    }
    
    public function setWithSsl( $withSsl )
    {
        $this->withSsl  = $withSsl;
        
        return $this;
    }
}
