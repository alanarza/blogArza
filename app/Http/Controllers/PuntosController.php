<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Puntos;

class PuntosController extends Controller
{
    public function puntuar_comentario(Request $request)
    { 
    	$punto = $request->all();
    	$nuevo_punto = new Puntos();
    	
    	
    }
}
