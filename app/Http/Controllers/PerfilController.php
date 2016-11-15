<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;

use App\Post;

use Auth;

use Illuminate\Support\Facades\Hash;

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

            return view('personal.perfil', compact('user_perfil'));
        }

        $user_perfil = User::where('name', $perf)->first();

        return view('personal.perfil', compact('user_perfil'));
    }

    public function formEditar()
    {
        $usuario = User::find( Auth::user()->id );

        return view('personal.editar_perfil', compact('usuario'));
    }

    protected function guardar(Request $request)
    {
        $this->validate($request, [
            'nombre' => 'required|alpha|max:255',
            'apellido' => 'required|alpha|max:255',
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

        return redirect('/perfil');
    }

    public function editarDatos()
    {
        $usuario = User::find( Auth::user()->id );

        return view('personal.mis_datos', compact('usuario'));
    }

    protected function guardarDatos(Request $request)
    {   

        $usuarioid = Auth::user();

        $user = User::find($usuarioid->id);

        $data = $request->all();

        if($data['name'] != $user->name)
        {
            $this->validate($request, [
                'name' => 'max:255|unique:users',
            ]);
        }

        if($data['email'] != $user->email )
        {
            $this->validate($request, [
                'email' => 'email|max:255|unique:users',
            ]);
        }

        $this->validate($request, [
            'old_password' => 'min:6',
            'new_password' => 'min:6',
            'password_confirmation' => 'min:6|same:new_password',
        ]);

        if($data['name'] != "")
        {
            $user->name = $data['name'];
        }

        if($data['email'] != "")
        {
            $user->email = $data['email'];
        }

        if($data['new_password'] != "")
        {   
            if(!Hash::check($data['old_password'], $user->password)){

              
                $mb->add("form", "same data already exists");

                return back()->withErrors($mb)->withInput();
            }

            $user->password = Hash::make($data['new_password']);
        }

        $user->save();

        return redirect('/perfil');
    }

}
