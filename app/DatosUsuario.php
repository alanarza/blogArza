<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DatosUsuario extends Model
{

	protected $table = 'datos_usuario';

    // Tiene un usuario
    public function usuario()
    {
    	return $this->belongsTo('App\User', 'id_usuario');
    }
}
