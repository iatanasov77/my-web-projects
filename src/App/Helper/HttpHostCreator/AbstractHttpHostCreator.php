<?php namespace VankoSoft\MyProjects\Helper\HttpHostCreator;

abstract class AbstractHttpHostCreator
{
    protected $addr;
    
    protected $host;
    
    protected $documentRoot;
    
    public function __construct( array $config = [] )
    {
        $this->addr         = isset( $config['addr'] ) ? $config['addr'] : '127.0.0.1';
        $this->host         = isset( $config['host'] ) ? $config['host'] : '';
        $this->documentRoot = isset( $config['documentRoot'] ) ? $config['documentRoot'] : '';
    }
    
    abstract public function run();
}
