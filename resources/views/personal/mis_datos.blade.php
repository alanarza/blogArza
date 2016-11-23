@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">Mis Datos</div>
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

                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/guardar-datos') }}">

                        {!! csrf_field() !!}

                        <div class="col-md-10 col-md-offset-1">


                            <div class="form-group">
                            <label for="name" class="col-md-4 control-label">Nombre de Usuario</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control" name="name" value="{{ $usuario->name }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-md-4 control-label">E-Mail</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control" name="email" value="{{ $usuario->email }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-md-4 control-label">Contraseña Anterior</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" name="old_password">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-md-4 control-label">Nueva Contraseña</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" name="new_password">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password-confirm" class="col-md-4 control-label">Confirmar Contraseña</label>

                                <div class="col-md-6">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation">
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

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">Desactivar cuenta</div>
                <div class="panel-body">

                <p>Si usted desactiva su cuenta, sus publicaciones tambien se
                   desactivaran, no se podra visitar su perfil, debera pedir 
                   ayuda a un Administrador para volver a activarla.</p>

                <div class="col-md-4 col-md-offset-2">
                    <div class="btn-group">
                    <form method="post" action="{{ url('/desactivar_cuenta') }}">
                        {!! csrf_field() !!}
                        <button type="submit" class="btn btn-default btn-md btn-danger">
                            <span class="glyphicon glyphicon-exclamation-sign"></span>Desactivar Cuenta
                        </button>
                    </form>
                </div>

                </div>

                </div>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection