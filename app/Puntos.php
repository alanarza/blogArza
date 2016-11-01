<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Puntos extends Model
{
    public function usuario()
    {
    	return $this->belongsTo('App\User','id_usuario');
    }

    public function post()
    {
    	return $this->belongsTo('App\Post','id_post');
    }
}
