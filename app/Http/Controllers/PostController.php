<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Post;
use App\Comentarios;
use App\Categorias;
use Carbon\Carbon;
use App\Puntos;
use App\Rangos;
use Auth;

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
        $punto = new Puntos();

        $rango = new Rangos();

        $post = Post::where('id',$id)->where('slug',$slug)->first();

        if ($post->estado == '0')
        {
            abort(404);
        }

        if ($post->usuario->estado == '0')
        {
            abort(404);
        }

        $comentarios = Comentarios::where('id_post', $post->id)->get();

        $puede_puntuar = $punto->puede_puntuar($post->id);

        $puntaje = Puntos::where('id_post',$post->id)->get();

        $puntaje_final = 0;

        $mi_rango = $rango->obtener_rango($post->id_autor);

        foreach ($puntaje as $puntoo) {
            $puntaje_final = $puntaje_final + $puntoo->punto;
        }

        return view('post.ver_post', compact('post','comentarios','puede_puntuar','puntaje_final','mi_rango'));
    }

    public function guardar_comentario(Request $request)
    {
        $contenido = $request->all();
        $comentario = new Comentarios();
        $date = Carbon::now();
        $date->toDateTimeString();

        $comentario->id_usuario = $contenido['id_usuario'];
        $comentario->id_post = $contenido['id_post'];
        $comentario->comentario = $contenido['comentario'];
        $comentario->created_at = $date;
        $comentario->updated_at = $date;

        $comentario->save();

        return back();
    }

    public function borrar_post(Request $request)
    {
        $contenido = $request->all();

        $post = Post::where('id',$contenido['id_post'])->first();

        $post->estado = '0';

        $post->save();

        return redirect('/');
    }

}
