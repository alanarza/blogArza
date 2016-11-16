<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categorias extends Model
{
    public function post()
    {
    	return $this->hasOne('App\Post','id_categoria');
    }

    // MIS FUNCIONES!!

    /*
    public function ver_categorias()
    {

    	$categorias = $this->all();

    	return $categorias;
    }
    */
}
