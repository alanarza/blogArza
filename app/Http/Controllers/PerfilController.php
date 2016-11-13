<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;

use App\Post;

class PerfilController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($perf)
    {
        $user_perfil = User::where('name', $perf)->first();

        return view('perfil', compact('user_perfil'));
    }

    public function FormEditar()
    {
        return view('editar_perfil');
    }

}
