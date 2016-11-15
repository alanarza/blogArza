<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Post;
use App\Categorias;
use Carbon\Carbon;

class PostController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth');
    }

    // Crear nuevo post
    public function nuevo_post()
    {
        $categorias = Categorias::all();

    	return view('post.crear_post',compact('categorias'));
    }

    // Guardar post

    public function guardar_post(Request $request)
    {
    	$post = new Post();
    	$date = Carbon::now();
        $date->toDateTimeString();

        $post->titulo = $request->get('titulo');
        $post->descripcion = $request->get('descripcion');
        $post->cuerpo = $request->get('cuerpo');
        $post->tags = $request->get('tags');
        $post->fecha_creacion = $date;
        $post->fecha_ultima_modificacion = $date;
        $post->estado = '1';
        $post->id_categoria = $request->get('id_categoria');
        $post->id_autor = $request->user()->id;
        $post->slug = str_slug($post->titulo);

        $post->save();

        return redirect('/');
    }

    public function ver_post($id, $slug)
    {
        $post = Post::where('id',$id)->where('slug',$slug)->first();

        return view('post.ver_post', compact('post'));
    }

}
