<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class AdminAuthenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        $uri = $request->path();
        $auth = Auth::guard($guard);
        if (Auth::guard($guard)->guest() && $uri !='admin/login') {
            if ($request->ajax() || $request->wantsJson()) {
                return response('Unauthorized.', 401);
            } else {
                return redirect()->guest('/admin/login');
            }
        }
        if ($auth->check() && !$auth->user()->is_admin() && $uri !='admin/login') {
            return redirect()->guest('/admin/login');
        }
        return $next($request);
    }
}
