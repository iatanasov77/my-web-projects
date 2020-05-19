<?php namespace App\Entity\Developement\VsCms;

use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\PageCategory as BasePageCategory;

/**
 * @ORM\Entity
 * @ORM\Table(name="IACMS_PageCategories")
 */
class PageCategory extends BasePageCategory
{
    const TAXONOMY_ID = 3;
}
