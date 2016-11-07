@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
		
		<legend>{{ $post->titulo }} @if(!Auth::guest() && ($post->id_autor == Auth::user()->id || Auth::user()->es_admin())) <a href="/editar-post" class="btn btn-primary btn-xs pull-right">Editar</a> @endif </legend>

		<h4>{{ $post->descripcion }}</h4>

		{!! $post->cuerpo !!}

	</div>
</div>

@endsection