<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    // El post tiene un usuario
    public function usuario()
    {
    	return $this->belongsTo('App\User', 'autor');
    }

    // El post tiene muchos puntos en distintos usuarios
    public function puntos()
    {
        return $this->hasOne('App\Puntos');
    }

}
