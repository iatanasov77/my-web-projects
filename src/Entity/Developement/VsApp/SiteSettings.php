<?php namespace App\Entity\Developement\VsApp;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\SiteSettings as BaseSiteSettings;

/**
 * @ORM\Table(name="DEVEL_VSAPP_SiteSettings")
 * @ORM\Entity
 */
class SiteSettings extends BaseSiteSettings
{
}
