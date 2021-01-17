<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

//use App\Component\Project\Project as ProjectTypes;
use App\Component\Project\Host as HostTypes;
use App\Component\Command\PhpBrew;
use App\Entity\ProjectHost;
use App\Entity\Project;

class ProjectHostType extends AbstractType
{
    public function __construct( PhpBrew $phpBrew )
    {
        $this->phpVersions  = ['default' => 'default'];
        $installedVersions  = $phpBrew->getInstalledVersions();
        foreach( array_keys( $installedVersions ) as $choice ) {
            $version                        = ltrim( $choice, 'php-' );
            $this->phpVersions[$version]    = $version;
        }
        
        $this->hostTypes    = [
            HostTypes::TYPE_LAMP            => HostTypes::TYPE_LAMP,
            HostTypes::TYPE_ASPNET_REVERSE  => HostTypes::TYPE_ASPNET_REVERSE,
            HostTypes::TYPE_JSP             => HostTypes::TYPE_JSP,
            HostTypes::TYPE_JSP_REVERSE     => HostTypes::TYPE_JSP_REVERSE,
        ];
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'project', EntityType::class, [
                'class'         => Project::class,
                'placeholder'   => '-- Choose a project --',
                'choice_label'  => 'name',
            ])
            ->add( 'hostType', ChoiceType::class, [ 'choices' => $this->hostTypes ] )
            
            ->add( 'host', TextType::class, [ 'label' => 'Host name'] )
            ->add( 'documentRoot', TextType::class )
            ->add( 'reverseProxy', TextType::class, [ 'required' => false ] )
            ->add( 'phpVersion', ChoiceType::class, [ 'choices' => $this->phpVersions ] )
            ->add( 'withSsl', CheckboxType::class, [ 'required' => false ] )
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
            'data_class' => ProjectHost::class,
        ]);
    }
}
