<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;

use App\Post;

use Auth;

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
    public function index($perf = null)
    {
        if($perf == '')
        {
            $user_perfil = User::where('name', Auth::user()->name)->first();

            return view('perfil', compact('user_perfil'));
        }

        $user_perfil = User::where('name', $perf)->first();

        return view('perfil', compact('user_perfil'));
    }

    public function formEditar()
    {
        $usuario = User::find( Auth::user()->id );

        return view('editar_perfil', compact('usuario'));
    }

    protected function guardar(Request $request)
    {
        $this->validate($request, [
            'nombre' => 'required|max:255',
            'apellido' => 'required|max:255',
            'fecha_nacimiento' => 'required|date',
            'descripcion' => 'max:255',
        ]);

        $usuarioid = Auth::user();

        $user = User::find($usuarioid->id);

        if($request->file('file') != "")
        {
            //obtenemos el campo file definido en el formulario
            $file = $request->file('file');

            $extencion = substr($file->getClientOriginalName(), -4); 

            $nombre = $usuarioid->name.$extencion;

            $user->foto_perfil = $nombre;

           //indicamos que queremos guardar un nuevo archivo en el disco local
           \Storage::disk('local')->put($nombre,  \File::get($file));
        }

        if($request->input('nombre') != "")
        {
            $user->nombre = $request->input('nombre');
        }

        if($request->input('apellido') != "")
        {
            $user->apellido = $request->input('apellido');
        }

        if($request->input('fecha_nacimiento') != "")
        {
            $user->fecha_nacimiento = $request->input('fecha_nacimiento');
        }

        if($request->input('descripcion') != "")
        {
            $user->descripcion = $request->input('descripcion');
        }

        $user->save();

        return redirect('perfil');
    }

}
