<?php namespace App\Entity\UserManagement;

use Doctrine\ORM\Mapping as ORM;
use VS\UsersBundle\Model\UserInfo as BaseUserInfo;

/**
 * @ORM\Entity
 * @ORM\Table(name="IAUM_UsersInfo")
 */
class UserInfo extends BaseUserInfo
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    
}
