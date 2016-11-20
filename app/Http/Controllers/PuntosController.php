<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Puntos;

use Auth;

class PuntosController extends Controller
{
    public function puntuar_comentario(Request $request)
    { 
    	$punto = $request->all();
    	$nuevo_punto = new Puntos();
    	$puedepuntuar = new Puntos();

    	if($puedepuntuar->puede_puntuar($punto['id_post']) == false)
    	{
    		return back();
    	}

    	if( $punto['action'] == "positivo" )
    	{
    		$nuevo_punto->id_post = $punto['id_post'];
    		$nuevo_punto->id_usuario = Auth::user()->id;
    		$nuevo_punto->punto = 1;

    		$nuevo_punto->save();
    	}
    	elseif( $punto['action'] == 'negativo' )
    	{
			$nuevo_punto->id_post = $punto['id_post'];
    		$nuevo_punto->id_usuario = Auth::user()->id;
    		$nuevo_punto->punto = -1;

    		$nuevo_punto->save();
    	}
    	else
    	{
    		return back();
    	}
    	
    	return back();
    }
}
