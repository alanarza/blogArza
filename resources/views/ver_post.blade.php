@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
		
		<legend>{{ $post->titulo }}</legend>

		<h4>{{ $post->descripcion }}</h4>

		{!! $post->cuerpo !!}

	</div>
</div>

@endsection