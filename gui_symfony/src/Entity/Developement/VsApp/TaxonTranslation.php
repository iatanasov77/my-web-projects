<?php namespace App\Entity\Developement\VsApp;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\TaxonTranslation as BaseTaxonTranslation;

/**
 * @ORM\Entity
 * @ORM\Table(name="DEVEL_VSAPP_TaxonTranslations")
 */
class TaxonTranslation extends BaseTaxonTranslation
{

}
