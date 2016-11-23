@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-7">
            <div class="panel panel-default">
                <div class="panel-body">

                    <legend>Ultimos Posts @if(!Auth::guest()) <a href="/nuevo_post" class="btn btn-success btn-xs pull-right">Crear Post <span class="glyphicon glyphicon-plus"></span></a> @endif</legend>

                    <div class="list-group">
                    @foreach( $posts as $post )
                        <a href="{{ url('post/'.$post->id.'/'.$post->slug) }}" style="text-decoration:none" class="list-group-item">
                        
                            <div class="media">
                              <div class="media-left media-top">
                                
                                  <img class="media-object" style="max-width: 70px; max-heigth: 50px; border-radius: 5px;"  src="/storage/{{ $post->usuario->foto_perfil }}" alt="...">
                                
                              </div>
                              <div class="media-body">
                                    <h4 class="media-heading">{{ $post->titulo }}</h4>

                                    <p>{{ $post->descripcion }}</p>

                                    <h5>    {{ $post->usuario->name }} </h5>
                              </div>
                              
                            </div>

                        </a>
                    @endforeach
                    {!! $posts->render() !!}
                    </div>

                </div>
            </div>
        </div>


        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">Entradas Destacadas</div>

                <div class="panel-body">
                    
                    <div class="list-group">
                    @foreach( $destacados as $destacado )
                        <a href="{{ url('post/'.$destacado->id.'/'.$destacado->slug) }}" style="text-decoration:none" class="list-group-item">
                        
                            <div class="media">
                              <div class="media-left media-top">
                                
                                  <img class="media-object" style="max-width: 70px; max-heigth: 50px; border-radius: 5px;"  src="/storage/{{ $destacado->usuario->foto_perfil }}" alt="...">
                                
                              </div>
                              <div class="media-body">
                                    <h4 class="media-heading">{{ $destacado->titulo }}</h4>

                                    <p>{{ $destacado->descripcion }}</p>

                                    <h5>    {{ $destacado->usuario->name }} </h5>
                              </div>
                              
                            </div>

                        </a>
                    @endforeach
                    </div>

                </div>
            </div>

            <div class="panel panel-default">
            <div class="panel-heading">Usuario Destacado</div>
            <div class="panel-body">

            <div class="media">
              <div class="media-left media-top">
                <a href="#">
                  <img class="media-object" style="max-width: 100px; max-heigth: 100px; border-radius: 5px;"  src="/storage/{{ $usuario->foto_perfil }}" alt="...">
                </a>
              </div>
              <div class="media-body">
                  <h4 class="media-heading"><legend>Usuario: <a href="/perfil/{{ $usuario->name }}"> {{ $usuario->name }} </a></legend></h4>

                  <h5><b>Nombre:</b> {{ $usuario->nombre }} {{ $usuario->apellido }} </h5>
                  <h5><b>Email:</b> {{ $usuario->email }}</h5>
                  <h5><b>Nacimiento:</b> {{ $usuario->fecha_nacimiento }}</h5>
                  <h5>
                    
                    @if ( $usuario->puntuacion  >= 0 )
                        <h5> <b>Puntuacion:</b> <span class="label label-success label-lg">{{ $usuario->puntuacion }}</span></h5>
                    @else
                        <h5> <b>Puntuacion:</b> <span class="label label-danger label-lg">{{ $usuario->puntuacion }}</span></h5>
                    @endif

                  </h5> 

              </div>
            </div>

            </div>
            </div>
            </div>
        
        </div>

    </div>
</div>

@endsection