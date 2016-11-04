<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', 'IndexController@index');

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::get('/nuevo_post', 'PostController@nuevo_post');

Route::post('/guardar_post', 'PostController@guardar_post');

Route::get('/post/{id}/{slug}', 'PostController@ver_post');