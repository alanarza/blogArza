<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Post;

use App\User;

class IndexController extends Controller
{
    public function index()
    {
    	
    	$posts = Post::whereHas('usuario', function ($query) {
		    $query->where('estado', '=', 1);
		})->where('estado',1)->orderBy('fecha_creacion', 'desc')->paginate(10);

		$destacados = Post::whereHas('usuario', function ($query) {
		    $query->where('estado', '=', 1);
		})->where('estado',1)->orderBy('puntuacion', 'desc')->paginate(3);

		$usuario = User::where('estado',1)->orderBy('puntuacion','desc')->first();

    	return view('index', compact('posts','destacados','usuario'));
    }
}
