<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Post;

class IndexController extends Controller
{
    public function index()
    {
    	$posts = Post::paginate(10);

    	return view('welcome', compact('posts'));
    }
}