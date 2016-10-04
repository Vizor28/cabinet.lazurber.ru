<?php

Route::get('', ['as' => 'admin.dashboard', function () {
	$content = 'Define your dashboard here.';
	return AdminSection::view($content, 'Dashboard');
}]);

Route::post('users_informations/new_user', ['as' => 'admin.info.user','uses'=>'App\Http\Controllers\AdminController@new_user']);