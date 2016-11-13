@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Editar Perfil</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/editar') }}">
                        {{ csrf_field() }}

                        <div class="form-group">
                            <label for="nombre" class="col-md-4 control-label">Nombre</label>

                            <div class="col-md-6">
                                <input id="nombre" type="text" class="form-control" name="nombre" placeholder="Nombre" required autofocus>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="apellido" class="col-md-4 control-label">Apellido</label>

                            <div class="col-md-6">
                                <input id="apellido" type="text" class="form-control" name="apellido" placeholder="Apellido" required autofocus>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fech_nacimiento" class="col-md-4 control-label">Fecha de Nacimiento</label>

                            <div class="col-md-6">
                                <input id="fech_nacimiento" type="date" class="form-control" name="fecha_nacimiento" required autofocus>
                            </div>
                        </div>

                        

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection