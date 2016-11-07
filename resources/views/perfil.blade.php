@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Perfil <a href="#" class="btn btn-info btn-xs pull-right">Editar Perfil</a></div>

                <div class="panel-body">
                    
                    <img class="media-object" style="max-width: 160px; max-heigth: 160px;"  src="/storage/{{ $user_perfil->datos_usuario->foto_perfil }}" alt="...">

                </div>
            </div>
        </div>
    </div>
</div>
@endsection