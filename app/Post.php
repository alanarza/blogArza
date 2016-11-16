<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{

    public $timestamps = false;

    // El post tiene un usuario
    public function usuario()
    {
    	return $this->belongsTo('App\User', 'id_autor');
    }

    // El post tiene muchos puntos en distintos usuarios
    public function puntos()
    {
        return $this->hasOne('App\Puntos');
    }

    public function categoria()
    {
        return $this->belongsTo('App\Categorias','id_categoria');
    }

    public function comentarios()
    {
        return $this->hasOne('App\Comentarios','id_post');
    }

}
