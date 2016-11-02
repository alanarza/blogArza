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
        'name', 'email', 'password',
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
        return $this->hasMany('App\Post');
    }

    // El usuario tiene un perfil personal
    public function datos_usuario()
    {
        return $this->hasOne('App\DatosUsuario');
    }

    // El usuario tiene muchos logros
    public function logros()
    {
        return $this->belongsToMany('App\Logros', 'usuario_logro', 'id_usuario', 'id_logro');
    }

    // muchos usuarios tienen muchos puntos en muchos posts
    public function puntos()
    {
        return $this->hasOne('App\Puntos');
    }

    // El usuario posee un rol
    public function rol()
    {
        return $this->belongsTo('App\Rol','rol');
    }

    // El usuario posee un rango calculado en base a los puntos que posee
    public function rango()
    {
        return $this->belongsTo('App\Rangos','rango');
    }


    // MIS FUNCIONES!!

    // Pregunta si se posee el permiso, retorna V o F
    public function tengo_permiso($permiso)
    {
        
    }

}
