<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categorias extends Model
{
    public function post()
    {
    	return $this->hasOne('App\Post');
    }
}
