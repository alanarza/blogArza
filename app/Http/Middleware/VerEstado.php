<?php

namespace App\Http\Middleware;

use Closure;

use App\User;

use Auth;

class VerEstado
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $estadox = User::where('email',$request->input('email'))->value('estado');

        if($estadox == '0')
        {
            Auth::logout();
            return abort('403');
        }

        return $next($request);
    }
}
