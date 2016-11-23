<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use Auth;

use App\User;

class UsuarioController extends Controller
{
    public function desactivar_cuenta()
    {
    	$usuarioid = Auth::user();

        $user = User::find($usuarioid->id);

    	$user->estado = '0';

    	$user->save();

    	Auth::logout();

    	return redirect('/');
    }
}
