<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Project;

class ProjectsController extends Controller
{
    
    /**
     * @Route("/projects", name="projects")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository( Project::class );
        $projects   =  $repository->findAll();
        
        return $this->render('pages/dashboard.html.twig', [
            'projects' => $projects
        ]);
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
}
