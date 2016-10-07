<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/




Route::get('/',  ['middleware' => 'guest',"uses"=>"HomeController@index"]);

Route::post('/cabinet/getBlockArticles', 'CabinetController@getBlockArticles');

Route::get('/cabinet/articles/{id}', 'CabinetController@getArticle');
Route::get('/cabinet/articles', 'CabinetController@pageArticles');
Route::get('/cabinet/logout', 'CabinetController@getLogout');
Route::get('/cabinet/vote', "CabinetController@votePage");
Route::get('/cabinet', "CabinetController@index");

Route::post('/cabinet/vote', "CabinetController@createdVote");

Route::post('/cabinet/next_vote', "CabinetController@nextVote");
Route::post('/cabinet/question', "CabinetController@createdQuestion");
Route::post('/cabinet/specialist', "CabinetController@createdSpecialist");


Route::post('/register', "HomeController@register");
Route::post('/entry', "HomeController@entry");
Route::post('/blocks', "HomeController@getBlocks");


// Маршруты запроса ссылки для сброса пароля...
Route::get('password/email', 'Auth\PasswordController@getEmail');
Route::post('password/email', 'Auth\PasswordController@postEmail');

// Маршруты сброса пароля...
Route::get('password/reset/{token}', 'Auth\PasswordController@getReset');
Route::post('password/reset', 'Auth\PasswordController@postReset');

//Route::get('/proba', 'AdminController@proba');

//Route::get('/home', 'HomeController@index');

//Route::get('/rooms', "HomeController@rooms");


Route::get('/admin/login', ['middleware' => 'admin',"uses"=>"AdminController@index"]);
Route::post('/admin/entry', "AdminController@entry");
