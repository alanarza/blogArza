@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
		
    	<div class="col-lg-9">

			<legend>{{ $post->titulo }}

				@if(!Auth::guest() && $post->id_autor != Auth::user()->id)
				<div class="btn-group pull-right">
					<a href="/puntuar" class="btn btn-default btn-xs btn-success" value="1">+1</a>
					<a href="/puntuar" class="btn btn-default btn-xs btn-danger" value="-1">-1</a>
				</div>
				@endif

				@if(!Auth::guest() && ($post->id_autor == Auth::user()->id || Auth::user()->es_admin()))
					<a href="/editar-post" class="btn btn-primary btn-xs pull-right">Editar</a> 
				@endif

			</legend>

			<h4>{{ $post->descripcion }}</h4>

			{!! $post->cuerpo !!}

			<hr>

			<h4>Comentarios:</h4>

			<div class="panel panel-default">
				
					
					@if($comentarios->isEmpty())
						<div class="panel-body">
							Este post no tiene comentarios
						</div>
					@else

						
						@foreach($comentarios as $usrcoment)

							<a href="/perfil/{{ $usrcoment->usuario->name}}" class="list-group-item">
								<h4 class="list-group-item-heading" > 
									{{ $usrcoment->usuario->name }}
								</h4>

								<p class="list-group-item-text">{{ $usrcoment->comentario }}</p>
							</a>

						@endforeach
						

					@endif

			</div>

			<div class="panel panel-default">
				<div class="panel-body">

				<form class="form-horizontal" role="form" method="POST" action="{{ url('/guardar_comentario') }}">
                {!! csrf_field() !!}

					<div class="form-group">
                        <div class="col-md-12">
                            <textarea id="sobremi" type="text" class="form-control" name="comentario" placeholder="Deja tu comentario"></textarea>
                        </div>
                    </div>

                    <input type="hidden" name="id_usuario" value="{{ Auth::user()->id }}"></input>
                    <input type="hidden" name="id_post" value="{{ $post->id }}"></input>

                    <button type="submit" class="btn btn-success btn-xs pull-right">
                        Enviar Comentario
                    </button>

                </form>
				</div>
			</div>

		</div>

		<div class="col-lg-3">
            <a href="#" class="thumbnail">
            <img style="max-width: 200px; max-heigth: 200px;" src="/storage/{{ $post->usuario->foto_perfil }}" alt="...">
            </a>

            <div class="well">

                <legend>Creador: <a href="/perfil/{{ $post->usuario->name }}"> {{ $post->usuario->name }} </a></legend>
				
				<h5>Rango del creador: {{ $post->usuario->rango->nombre_rango }}</h5>

                <h5>Creado: {{ $post->fecha_creacion }} </h5>

                <h5>Editado: {{ $post->fecha_ultima_modificacion }}</h5>

                <h5>Categoria: {{ $post->categoria->nombre_categoria }}</h5>

            </div>
        </div>

	</div>
</div>

@endsection