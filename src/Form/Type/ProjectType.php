<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use App\Entity\Project;

class ProjectType extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'name', TextType::class )
            ->add( 'sourceType', ChoiceType::class, [
                'choices'  => [
                    'wget' => 1,
                    'git' => 2,
                    'svn' => 3,
                ],
            ])
            ->add( 'repository', TextType::class )
            ->add( 'branch', TextType::class )
            ->add( 'projectRoot', TextType::class )
            ->add( 'documentRoot', TextType::class )
            ->add( 'host', TextType::class )
            ->add( 'withSsl', CheckboxType::class )
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver )
    {
        $resolver->setDefaults([
            'data_class' => Project::class,
        ]);
    }
}
