<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Puntos;
use App\Post;
use App\User;

use Auth;

class PuntosController extends Controller
{
    public function puntuar_post(Request $request)
    { 
    	$punto = $request->all();
    	$nuevo_punto = new Puntos();
    	$puedepuntuar = new Puntos();

        $post = Post::find($punto['id_post']);
        $autor = User::find($punto['id_autor']);

    	if($puedepuntuar->puede_puntuar($punto['id_post']) == false)
    	{
    		return back();
    	}

    	if( $punto['action'] == "positivo" )
    	{
    		$nuevo_punto->id_post = $punto['id_post'];
    		$nuevo_punto->id_usuario = Auth::user()->id;
            $nuevo_punto->id_autor = $punto['id_autor'];
    		$nuevo_punto->punto = 1;

            $post->puntuacion = $post->puntuacion + 1;
            $autor->puntuacion = $autor->puntuacion + 1;

    		$nuevo_punto->save();
            $post->save();
            $autor->save();

    	}
    	elseif( $punto['action'] == 'negativo' )
    	{
			$nuevo_punto->id_post = $punto['id_post'];
    		$nuevo_punto->id_usuario = Auth::user()->id;
            $nuevo_punto->id_autor = $punto['id_autor'];
    		$nuevo_punto->punto = -1;

            $post->puntuacion = $post->puntuacion - 1;
            $autor->puntuacion = $autor->puntuacion - 1;

    		$nuevo_punto->save();
            $post->save();
            $autor->save();
    	}
    	else
    	{
    		return back();
    	}
    	
    	return back();
    }
}
