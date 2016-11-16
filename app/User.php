<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'nombre', 'apellido', 'fecha_nacimiento', 'descripcion', 'foto_perfil',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    // El usuario tiene muchos posts
    public function posts()
    {
        return $this->hasMany('App\Post','id_autor');
    }

    // El usuario tiene muchos logros
    public function logros()
    {
        return $this->belongsToMany('App\Logros', 'usuario_logro', 'id_usuario', 'id_logro');
    }

    // muchos usuarios tienen muchos puntos en muchos posts
    public function puntos()
    {
        return $this->hasOne('App\Puntos','id_usuario');
    }

    public function comentarios()
    {
        return $this->hasOne('App\Comentarios','id_usuario');
    }

    // El usuario posee un rol
    public function rol()
    {
        return $this->belongsTo('App\Roles','id_rol');
    }

    // El usuario posee un rango calculado en base a los puntos que posee
    public function rango()
    {
        return $this->belongsTo('App\Rangos','id_rango');
    }


    // MIS FUNCIONES!!

    // Pregunta si se posee el permiso, retorna T o F
    public function tengo_permiso($permiso)
    {

        $p = $this->rol->permisos()->where('permiso',$permiso)->get();

        if(!$p->isEmpty())
        {
            return true;
        }

        return false;
    }

    public function es_admin()
    {
        $role = $this->rol;

        if($role->nombre_rol == 'administrador')
        {
            return true;
        }
        return false;
    }

}