@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Editar Perfil</div>
                <div class="panel-body">
                    
                    @if (count($errors) > 0)
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/guardar-perfil') }}" enctype="multipart/form-data">

                        {!! csrf_field() !!}

                        <div class="col-md-4 col-md-offset-4">
                        <a href="#" class="thumbnail">
                        <img style="max-width: 200px; max-heigth: 200px;" src="/storage/{{ $usuario->foto_perfil }}" alt="...">
                        </a>
                        </div>
                        
                        <div class="col-md-10 col-md-offset-1">

                        <div class="form-group">
                            <label for="perf" class="col-md-4 control-label">Foto de Perfil</label>

                            <div class="col-md-6">
                                <input type="file" accept-charset="UTF-8" class="form-control" name="file" id="perf">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="nombre" class="col-md-4 control-label">Nombre</label>

                            <div class="col-md-6">
                                <input id="nombre" type="text" class="form-control" name="nombre" value="{{ $usuario->nombre }}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="apellido" class="col-md-4 control-label">Apellido</label>

                            <div class="col-md-6">
                                <input id="apellido" type="text" class="form-control" name="apellido" value="{{ $usuario->apellido }}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fech_nacimiento" class="col-md-4 control-label">Fecha de Nacimiento</label>

                            <div class="col-md-6">
                                <input id="fech_nacimiento" type="date" class="form-control" name="fecha_nacimiento" value="{{ $usuario->fecha_nacimiento }}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="sobremi" class="col-md-4 control-label">Sobre mi</label>

                            <div class="col-md-6">
                                <textarea id="sobremi" type="text" class="form-control" name="descripcion">{{ $usuario->descripcion }}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                
                                <a class="btn btn-danger" href="/perfil">
                                   <span class="glyphicon glyphicon-chevron-left"></span> Cancelar
                               </a>

                                <button type="submit" class="btn btn-primary">
                                    Guardar Cambios
                                </button>
                            </div>
                        </div>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection