<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    public function user()
    {
    	return $this->hasOne('App\User');
    }

    public function permisos()
    {
        return $this->belongsToMany('App\Permisos', 'rol_permiso', 'id_rol', 'id_permiso');
    }
}
