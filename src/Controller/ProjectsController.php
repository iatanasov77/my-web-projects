<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use App\Component\Globals;
use App\Entity\Project;
use App\Form\Type\ProjectType;
use App\Form\Type\ProjectDeleteType;

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
            'createProjectForm' => $this->_projectForm( new Project() )->createView(),
            'deleteProjectForm' => $this->createForm( ProjectDeleteType::class, null, [
                'action' => $this->generateUrl( 'projects_delete' ),
                'method' => 'POST'
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
    
    private function _projectForm( Project $project )
    {
        
        $form   = $this->createForm( ProjectType::class, $project, [
            'action' => $this->generateUrl( 'projects_create', ['id' => (int)$project->getId()] ),
            'method' => 'POST'
        ]);
        
        return $form;
    }
}
