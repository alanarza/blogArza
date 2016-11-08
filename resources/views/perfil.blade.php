@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">

        <div class="col-lg-3">
            <a href="#" class="thumbnail">
            <img style="max-width: 200px; max-heigth: 200px;" src="/storage/{{ $user_perfil->foto_perfil }}" alt="...">
            </a>

            <div class="well">

                <legend> {{ $user_perfil->nombre }} {{ $user_perfil->apellido }} </legend>

                <h5>Fecha de nacimiento: {{ $user_perfil->fecha_nacimiento }}</h5>

                <h5>Rango: {{ $user_perfil->rango->nombre_rango }}</h5>

                <h5>Sobre mi: {{ $user_perfil->descripcion }}</h5>

            </div>
        </div>

        <div class="col-lg-8">
        <div class="panel panel-default">
          <div class="panel-body">

            <legend>Perfil de {{ $user_perfil->name }} @if(!Auth::guest() && ($user_perfil->id == Auth::user()->id || Auth::user()->es_admin()))<a href="#" class="btn btn-info btn-xs pull-right">Editar Perfil</a> @endif</legend>


        </div>
        </div>
        </div>

    
    </div>
</div>
@endsection