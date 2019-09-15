<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use App\Component\Globals;
use App\Entity\Project;
use App\Form\Type\ProjectType;

class ProjectsController extends Controller
{
    
    /**
     * @Route("/projects", name="projects")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $projects   =  $repository->findAll();
        
        return $this->render('pages/projects.html.twig', [
            'projects'          => $projects,
            'createProjectForm' => $this->_projectForm( new Project() )->createView()
        ]);
    }
    
    /**
     * @Route("/projects/create", name="projects_create")
     */
    public function create( Request $request )
    {
        $status     = Globals::STATUS_ERROR;
        $project    = new Project();
        $form       = $this->_projectForm( $project );
        $em         = $this->getDoctrine()->getManager();
        $repository = $this->getDoctrine()->getRepository( Project::class );
        
        $form->handleRequest( $request );
        if ( $form->isValid() ) {
            $project    = $form->getData();
            
            $em->persist( $project );
            $em->flush();
            
            $status     = Globals::STATUS_OK;
            $errors     = [];
        } else {
            foreach ( $form->getErrors( true, false ) as $error ) {
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
    public function install( $id )
    {
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $project    = new Project( $repository->find( $id ) );
        $source     = $project->source();
        if ( ! $source ) {
            throw new \Exception( 'Project source type cannot instantiated' );
        }
        
        $source->fetch();
        
        // return new RedirectResponse( $this->generateUrl( 'homepage' ) );
        //return $this->redirectToRoute( 'homepage', [], 301 ); // does a permanent - 301 redirect
        return $this->redirectToRoute( 'projects' );
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
    
    private function _projectForm( Project $project )
    {
        $form   = $this->createForm( ProjectType::class, null, [
            'action' => $this->generateUrl( 'projects_create' ),
            'method' => 'POST'
        ]);
        
        return $form;
    }
}
