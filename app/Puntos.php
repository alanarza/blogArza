<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Puntos extends Model
{
    
    public $timestamps = false;

	protected $fillable = [
        'punto',
    ];

    public function usuario()
    {
    	return $this->belongsTo('App\User','id_usuario');
    }

    public function post()
    {
    	return $this->belongsTo('App\Post','id_post');
    }

    public function puntos_usuario($id_usuario)
    {
        $puntos = $this->where('id_autor', $id_usuario)->get();
        $puntaje = 0;

        foreach ($puntos as $puntox) {
            
            if($puntox->punto > 0)
            {
                $puntaje = $puntaje + 1;
            }

            if($puntox->punto < 0)
            {
                $puntaje = $puntaje - 1;
            }

        }

        return $puntaje;
    }

    public function puntos_post($id_post)
    {
        $puntos = $this->where('id_post', $id_post)->get();
        $puntaje = 0;

        foreach ($puntos as $puntox) {
            
            if($puntox->punto > 0)
            {
                $puntaje = $puntaje + 1;
            }

            if($puntox->punto < 0)
            {
                $puntaje = $puntaje - 1;
            }

        }

        return $puntaje;
    }

    public function puede_puntuar($idPost)
    {
        $resultado = $this->where('id_usuario', Auth::user()->id )->where('id_post', $idPost)->first();

        if($resultado == null)
        {
            return true;
        }

        return false;
    }
}
