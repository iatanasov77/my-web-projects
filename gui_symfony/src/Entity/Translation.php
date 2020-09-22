<?php namespace App\Entity;
/**
namespace Gedmo\Translatable\Entity;

@E TVA E: Taa pederastiq parvo iska gorniq namespace i kato dade gre6ka si sloji namespace App\Entity; i vsi4ko po4va da raboti
    
*/

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Translatable\Entity\MappedSuperclass\AbstractTranslation;

/**
 * @ORM\Table(name="VSAPP_Translations", indexes={
 *      @ORM\Index(name="article_translation_idx", columns={"locale", "object_class", "field", "foreign_key"})
 * })
 * @ORM\Entity(repositoryClass="Gedmo\Translatable\Entity\Repository\TranslationRepository")
 */
class Translation extends AbstractTranslation
{
     
}
