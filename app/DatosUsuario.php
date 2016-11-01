<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DatosUsuario extends Model
{
    // Tiene un usuario
    public function usuario()
    {
    	return $this->belongsTo('App\User', 'usuario');
    }
}
