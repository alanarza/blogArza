<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Puntos;

class Rangos extends Model
{
    public function user()
    {
    	return $this->hasOne('App\User','id_rango');
    }


    public function obtener_rango($id_usuario)
    {
	    $punto = new Puntos();

	    $puntaje =  $punto->puntos_usuario($id_usuario);

	    $minimo_puntaje = -10;

	    $maximo_puntaje = 40;


	    if($puntaje <= $minimo_puntaje)
	    {
			$rango = $this->where('valor',$minimo_puntaje)->first();

	    	return $rango->nombre_rango;
	    }

	    if($puntaje >= $maximo_puntaje)
	    {
			$rango = $this->where('valor',$maximo_puntaje)->first();

	    	return $rango->nombre_rango;
	    }

	    for ( $i = -10; $i < 50; $i+= 10 )
	    {
	    	
	    	if ( $i == $puntaje )
	    	{
	    		
	    		$rango = $this->where('valor',$i)->first();

	    		return $rango->nombre_rango;
	    	}

	    	if ( $i > $puntaje )
	    	{
	    		$rango = $this->where('valor',$i-10)->first();

	    		return $rango->nombre_rango;
	    	}

			if ( 0 > $puntaje )
	    	{
	    		$rango = $this->where('valor',0)->first();

	    		return $rango->nombre_rango;
	    	}	    	

	    }

	    return "error";
	}
   

}
