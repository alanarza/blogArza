<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Post;

class PostController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth');
    }

    // Crear nuevo post
    public function nuevo_post()
    {
    	return view('crear_post');
    }

    // Guardar post

    public function guardar_post(Request $request)
    {
    	$post = new Post();
    	
    }

}
