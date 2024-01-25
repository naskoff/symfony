<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\KernelInterface;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'app_default')]
    public function index(KernelInterface $kernel): Response
    {
        return $this->render('default/index.html.twig', [
            'hostname' => gethostname(),
            'project_dir' => $kernel->getProjectDir(),
        ]);
    }
}
