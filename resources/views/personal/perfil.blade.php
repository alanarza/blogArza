@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">

        <div class="col-lg-3">
            <a href="#" class="thumbnail">
            <img style="max-width: 200px; max-heigth: 200px;" src="/storage/{{ $user_perfil->foto_perfil }}" alt="...">
            </a>

            <div class="well">

                <legend> {{ $user_perfil->nombre }} {{ $user_perfil->apellido }} @if(!Auth::guest() && ($user_perfil->id == Auth::user()->id || Auth::user()->es_admin()))<a href="/editar-perfil" class="btn btn-info btn-xs pull-right">Editar Perfil</a> @endif</legend>

                <h5>Fecha de nacimiento: {{ $user_perfil->fecha_nacimiento }}</h5>

                <h5>Rango: {{ $user_perfil->rango->nombre_rango }}</h5>

                <h5>Sobre mi: {{ $user_perfil->descripcion }}</h5>

            </div>
        </div>

        <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-body">

            <legend>Post de {{ $user_perfil->name }} @if(!Auth::guest() && ($user_perfil->id == Auth::user()->id || Auth::user()->es_admin())) <a href="/nuevo_post" class="btn btn-success btn-xs pull-right">Crear Post <span class="glyphicon glyphicon-plus"></span></a> @endif</legend>
   

                <ul class="list-group">
                    @foreach( $user_perfil->posts as $post )
                
                        <div class="list-group">
                          <a href="{{ url('post/'.$post->id.'/'.$post->slug) }}" class="list-group-item">
                            <h4 class="list-group-item-heading">{{ $post->titulo }}</h4>
                            <p class="list-group-item-text">{{ str_limit($post->descripcion,195) }}</p>
                          </a>
                        </div>
                    
                    @endforeach
                    <div class="col-md-offset-4"></div>
                </ul>
            
            </div>
        </div>
        </div>

        <div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-body">
                
            <legend>Ultima actividad</legend>

            </div>
        </div>
        </div>

    
    </div>
</div>
@endsection