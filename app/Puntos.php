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
