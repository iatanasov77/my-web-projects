<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use App\Entity\Project;
use App\Entity\Category;

class PredefinedProjectType extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'name', TextType::class )
            ->add( 'category', EntityType::class, [
                'class'         => Category::class,
                'placeholder'   => '-- Choose a category --',
                'choice_label'  => 'name',
            ])
            ->add( 'predefinedType', ChoiceType::class, [
                'placeholder'   => '-- Select Predefined Project --',
                'choices'       => [
                    'Symfony'   => 'symfony',
                    'Laravel'   => 'laravel',
                    'Sylius'    => 'sylius',
                    'Magento'   => 'magento',
                ],
            ])
            
            ->add( 'projectRoot', TextType::class )
            ->add( 'documentRoot', TextType::class )
            ->add( 'host', TextType::class )
            ->add( 'withSsl', CheckboxType::class )
            
            ->add( 'phpFpmSocket', TextType::class )
            ->add( 'reverseProxy', TextType::class )
        ;
            
        $builder->get( 'withSsl' )
            ->addModelTransformer( new CallbackTransformer(
                function ( $withSsl ) {
                    // transform the array to a string
                    return (boolean)$withSsl;
                },
                function (  $withSsl ) {
                    // transform the string back to an array
                    return (boolean)$withSsl;
                }
            ));
    }
    
    public function configureOptions( OptionsResolver $resolver )
    {
        $resolver->setDefaults([
            'data_class' => Project::class,
        ]);
    }
}
