@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-8">
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


        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">Entradas Destacadas</div>

                <div class="panel-body">
                    
                    

                </div>
            </div>
        </div>


    </div>
</div>

@endsection