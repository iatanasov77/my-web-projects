<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class ProjectsController extends Controller
{
    
    /**
     * @Route("/projects", name="projects")
     */
    public function index()
    {
        return $this->render('pages/dashboard.html.twig',
            ['projects' => []]
        );
    }
}
