<?php namespace App\Entity\Developement\VsCms;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\Page as BasePage;

/**
 * Page
 *
 * @Gedmo\TranslationEntity(class="App\Entity\Translation")
 * @ORM\Table(name="DEV_VSCMS_Pages")
 * @ORM\Entity
 */
class Page extends BasePage
{
    
}
