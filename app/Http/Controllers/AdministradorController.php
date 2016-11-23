<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\User;
use Auth;

class AdministradorController extends Controller
{

	public function administracion()
    {
        if(!Auth::user()->es_admin())
        {
            abort(403);
        }

        $usuarios = User::all();

        return view('personal.administracion', compact('usuarios'));
    }

}
