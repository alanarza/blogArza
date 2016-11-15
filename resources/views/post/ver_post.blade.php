@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
		
    	<div class="col-lg-9">

			<legend>{{ $post->titulo }}

				@if($post->id_autor != Auth::user()->id)
				<div class="btn-group pull-right">
					<a href="#" class="btn btn-default btn-xs btn-success">+1</a>
					<a href="#" class="btn btn-default btn-xs btn-danger">-1</a>
				</div>
				@endif

				@if(!Auth::guest() && ($post->id_autor == Auth::user()->id || Auth::user()->es_admin())) <a href="/editar-post" class="btn btn-primary btn-xs pull-right">Editar</a> @endif </legend>

			<h4>{{ $post->descripcion }}</h4>

			{!! $post->cuerpo !!}

			<div class="btn-toolbar">
			
			</div>

			<div class="panel panel-default">
			  <div class="panel-body">
			    Panel de comentarios
			  </div>
			</div>

		</div>

		<div class="col-lg-3">
            <a href="#" class="thumbnail">
            <img style="max-width: 200px; max-heigth: 200px;" src="/storage/{{ $post->usuario->foto_perfil }}" alt="...">
            </a>

            <div class="well">

                <legend>Perfil de: <a href="/perfil/{{ $post->usuario->name }}"> {{ $post->usuario->name }} </a></legend>

                <h3>{{ $post->usuario->nombre }} {{ $post->usuario->apellido }}</h3>

                <h5>Fecha de nacimiento: {{ $post->usuario->fecha_nacimiento }}</h5>

                <h5>Rango: {{ $post->usuario->rango->nombre_rango }}</h5>

                <h5>Sobre mi: {{ $post->usuario->descripcion }}</h5>

            </div>
        </div>

	</div>
</div>

@endsection