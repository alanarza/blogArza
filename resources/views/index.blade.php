@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Ultimas Posts

                    @if(!Auth::guest())
                    <a href="/nuevo_post" class="btn btn-success btn-xs pull-right">Crear Post <span class="glyphicon glyphicon-plus"></span></a>
                    @endif
                </div>

                <div class="panel-body">
                    
                    <ul class="list-group">
                    @foreach( $posts as $post )
                
                        <div class="list-group">
                          <a href="{{ url('post/'.$post->id.'/'.$post->slug) }}" class="list-group-item">
                            <h4 class="list-group-item-heading">{{ $post->titulo }}</h4>
                            <p class="list-group-item-text">{{ str_limit($post->descripcion,195) }}</p>
                          </a>
                        </div>
                    
                    @endforeach

                    <div class="col-md-offset-4">{{ $posts->render() }}</div>
                    </ul>

                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">Entradas Destacadas</div>

                <div class="panel-body">
                    
                    Hola 

                </div>
            </div>
        </div>
    </div>
</div>

@endsection