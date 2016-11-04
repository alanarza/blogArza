@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Ultimas Posts

                    @if(!Auth::guest())
                    <a class="btn btn-success btn-xs pull-right">Crear Post <span class="glyphicon glyphicon-plus"></span></a>
                    @endif
                </div>

                <div class="panel-body">
                    
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