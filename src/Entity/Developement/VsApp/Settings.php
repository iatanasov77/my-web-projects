<?php namespace App\Entity\Developement\VsApp;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Settings as BaseSettings;

/**
 * @ORM\Table(name="DEVEL_VSAPP_Settings")
 * @ORM\Entity
 */
class Settings extends BaseSettings
{
}
