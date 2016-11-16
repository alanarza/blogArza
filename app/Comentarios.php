<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comentarios extends Model
{
	protected $fillable = [
        'comentario', 'created_at', 'updated_at',
    ];

    public function usuario()
    {
    	return $this->belongsTo('App\User','id_usuario');
    }

    public function post()
    {
    	return $this->belongsTo('App\Post','id_post');
    }
}
