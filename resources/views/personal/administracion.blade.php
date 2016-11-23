@extends('layouts.app')

@section('content')
<div class="container">
<div class="row">
<div class="col-md-8 col-md-offset-2">



<table class="table table-striped table-hover " id="myTable">
  <thead>
    <tr>
      <th>#</th>
      
      <th>Usuario</th>
      <th>Email</th>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Nacimiento</th>
      <th>Estado</th>
    </tr>
  </thead>

  @foreach($usuarios as $usuario)

  <tbody>
    <tr>
      <td>1</td>
      
      <td>{{ $usuario->name }}</td>
      <td>{{ $usuario->email }}</td>
      <td>{{ $usuario->nombre }}</td>
      <td>{{ $usuario->apellido }}</td>
      <td>{{ $usuario->fecha_nacimiento }}</td>
      <td>{{ $usuario->estado }}</td>
    </tr>
  </tbody>

  @endforeach

</table> 



</div>
</div>
</div>

@endsection