<?php namespace App\Component\Project;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

use App\Entity\ProjectHostOption;

class Host
{
    // Project Types
    const TYPE_LAMP             = 'Lamp';
    const TYPE_ASPNET_REVERSE   = 'DotNet';
    const TYPE_JSP              = 'JspRewrite';
    const TYPE_JSP_REVERSE      = 'Jsp';
    const TYPE_PYTHON           = 'Python';
    const TYPE_RUBY             = 'Ruby';
    
    public static function optionKeys( $type ) : array
    {
        switch ( $type ) {
            case self::TYPE_LAMP:
                $keys   = ['phpVersion'];
                break;
            case self::TYPE_ASPNET_REVERSE:
                $keys   = [];
                break;
            case self::TYPE_JSP:
                $keys   = [];
                break;
            case self::TYPE_JSP_REVERSE:
                $keys   = [];
                break;
            case self::TYPE_PYTHON:
                $keys   = ['projectPath', 'venvPath', 'scriptAlias', 'user', 'group', 'processes', 'threads'];
                break;
            case self::TYPE_RUBY:
                $keys   = [];
                break;
            default:
                throw new \Exception( "Undefined Type: " . $type );
        }
        
        return $keys;
    }
}
