<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Process\Process;
use Symfony\Component\HttpFoundation\StreamedResponse;

use App\Component\Globals;
use App\Component\Project\Source\SourceFactory;
use App\Component\Installer\InstallerFactory;
use App\Component\Project\PredefinedProject;
use App\Entity\Category;
use App\Entity\Project;
use App\Form\Type\PredefinedProjectType;
use App\Form\Type\ProjectType;
use App\Form\Type\ProjectInstallManualType;
use App\Form\Type\ProjectDeleteType;
use App\Form\Type\CategoryType;

class ProjectsController extends Controller
{
    
    /**
     * @Route("/projects", name="projects")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository( Category::class );
        
        return $this->render('pages/projects.html.twig', [
            'categories'            => $repository->findAll(),
            'createCategoryForm'    => $this->_categoryForm( new Category() )->createView(),
            'createProjectForm'     => $this->_projectForm( new Project() )->createView(),
            'deleteProjectForm'     => $this->createForm( ProjectDeleteType::class, null, [
                'action'            => $this->generateUrl( 'projects_delete' ),
                'method'            => 'POST'
            ])->createView()
        ]);
    }
    
    /**
     * @Route("/projects/edit/{id}", name="projects_edit_form")
     */
    public function editForm( $id, Request $request )
    {
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $project    = $id ? $repository->find( $id ) : new Project();
        
        return $this->render( 'pages/projects/project_form.html.twig', [
            'form' => $this->_projectForm( $project )->createView(),
        ]);
    }
    
    /**
     * @Route("/projects/create/{id}", name="projects_create")
     */
    public function create( $id, Request $request )
    {
        $status     = Globals::STATUS_ERROR;
        
        $em         = $this->getDoctrine()->getManager();
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $project    = $id ? $repository->find( $id ) : new Project();
        $form       = $this->_projectForm( $project );
        
        $form->handleRequest( $request );
        if ( $form->isValid() ) {
            $project        = $form->getData();
            
            $predefinedType = $form->get('predefinedType')->getData();
            PredefinedProject::populate( $project, $predefinedType );
            
            $em->persist( $project );
            $em->flush();
            
            $status     = Globals::STATUS_OK;
            $errors     = [];
        } else {
            foreach ( $form->getErrors( true, false ) as  $error) {
                // My personnal need was to get translatable messages
                // $errors[] = $this->trans($error->current()->getMessage());
                
                $errors[$error->current()->getCause()->getPropertyPath()] = $error->current()->getMessage();
            }
        }
        
        
        $html   = $this->renderView( 'pages/projects/table_projects.html.twig', ['projects' => $repository->findAll()] );
        $response   = [
            'status'    => $status,
            'data'      => $html,
            'errors'    => $errors
        ];
        
        return new JsonResponse( $response );
    }
    
    /**
     * @Route("/projects/install/{id}", name="projects_install")
     */
    public function install( Request $request, $id )
    {
        if ( $request->isMethod( 'post' ) ) {
            $repository     = $this->getDoctrine()->getRepository( Project::class );
            $project        = $repository->find( $id );
            $form           = $this->_projectForm( $project );
            
            $predefinedType = $project->getPredefinedType();
            $installer      = InstallerFactory::installer( $predefinedType, $project );
            $process        = $installer->install();
            
            return new StreamedResponse( function() use ( $process ) {
                foreach ( $process as $type => $data ) {
                    if ( Process::ERR === $type ) {
                        echo '[ ERR ] '. nl2br( $data ) . '<br />';
                    } else {
                        echo nl2br( $data );
                    }
                }
            });
        }
    }
    
    /**
     * @Route("/projects/install_manual/{id}", name="projects_install_manual")
     */
    public function installManual( $id )
    {
        $repository     = $this->getDoctrine()->getRepository( Project::class );
        $project        = $repository->find( $id );
        
        $source         = SourceFactory::source( $project );
        if ( ! $source ) {
            throw new \Exception( 'Project source type cannot instantiated' );
        }
        
        return new Response( $source->fetch() );
    }
    
    /**
     * @Route("/projects/edit_install_manual/{id}", name="edit_install_manual")
     */
    public function editInstallManual( $id, Request $request )
    {
        $repository     = $this->getDoctrine()->getRepository( Project::class );
        $project        = $repository->find( $id );
        
        $form           = $this->createForm( ProjectInstallManualType::class, $project, [
            'action' => $this->generateUrl( 'edit_install_manual', ['id' => (int)$project->getId()] ),
            'method' => 'POST'
        ]);
        
        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) { // && $form->isValid()
            //$project->setInstallManual(  );
            $em = $this->getDoctrine()->getManager();
            $em->persist( $form->getData() );
            $em->flush();
            
            return $this->redirectToRoute( 'projects' );
        }
        
        return $this->render( 'pages/projects/project_install_manual.html.twig', [
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/projects/uninstall/{id}", name="projects_uninstall")
     */
    public function uninstall( $id )
    {
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $project   =  $repository->find( $id );
        
        return $this->redirectToRoute( 'projects' );
    }
    
    /**
     * @Route( "/projects/delete", name="projects_delete" )
     */
    public function delete( Request $request )
    {
        $status     = Globals::STATUS_ERROR;
        $em         = $this->getDoctrine()->getManager();
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $form       = $this->createForm( ProjectDeleteType::class, null, [
            'action' => $this->generateUrl( 'projects_delete' ),
            'method' => 'POST'
        ]);
        
        $form->handleRequest( $request );
        if ( $form->isValid() ) {
            $data       = $form->getData();
            $project    = $repository->find( $data['projectId'] );
            $projectRoot= $project ? $project->getProjectRoot() : null;
            
            if ( $project ) {
                $em->remove( $project );
                $em->flush();
            }
            
            if ( $data['deleteFiles'] == true && is_dir( $projectRoot ) ) {
                system( "rm -rf " . escapeshellarg( $projectRoot ) );
            }
            
            $status     = Globals::STATUS_OK;
            $errors     = [];
        } else {
            foreach ( $form->getErrors( true, false ) as $error ) {
                $errors[$error->current()->getCause()->getPropertyPath()] = $error->current()->getMessage();
            }
        }
        
        $html   = $this->renderView( 'pages/projects/table_projects.html.twig', ['projects' => $repository->findAll()] );
        $response   = [
            'status'    => $status,
            'data'      => $html,
            'errors'    => $errors
        ];
        
        return new JsonResponse( $response );
    }
    
    /**
     * @Route("/categories/create/{id}", name="category_create")
     */
    public function editCategory( $id, Request $request )
    {
        $status     = Globals::STATUS_ERROR;
        
        $em         = $this->getDoctrine()->getManager();
        $repository = $this->getDoctrine()->getRepository( Category::class );
        $category   = $id ? $repository->find( $id ) : new Category();
        $form       = $this->_categoryForm( $category );
        
        $form->handleRequest( $request );
        if ( $form->isValid() ) {
            $project    = $form->getData();
            
            $em->persist( $project );
            $em->flush();
            
            $status     = Globals::STATUS_OK;
            $errors     = [];
        } else {
            foreach ( $form->getErrors( true, false ) as  $error) {
                // My personnal need was to get translatable messages
                // $errors[] = $this->trans($error->current()->getMessage());
                
                $errors[$error->current()->getCause()->getPropertyPath()] = $error->current()->getMessage();
            }
        }
        
        $html   = $this->renderView( 'pages/projects/table_projects.html.twig', ['projects' => $repository->findAll()] );
        $response   = [
            'status'    => $status,
            'data'      => $html,
            'errors'    => $errors
        ];
        
        return new JsonResponse( $response );
    }
    
    private function _projectForm( Project $project )
    {
        
        $form   = $this->createForm( ProjectType::class, $project, [
            'action' => $this->generateUrl( 'projects_create', ['id' => (int)$project->getId()] ),
            'method' => 'POST'
        ]);
        
        return $form;
    }
    
    private function _categoryForm( Category $category )
    {
        
        $form   = $this->createForm( CategoryType::class, $category, [
            'action' => $this->generateUrl( 'category_create', ['id' => (int)$category->getId()] ),
            'method' => 'POST'
        ]);
        
        return $form;
    }
}
