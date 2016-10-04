<?php

//PackageManager::load('admin-default')->css('extend', resources_url('js/users_informations.css'));

//PackageManager::add('users_informations')->js(null, asset('js/controllers.js'));

PackageManager::add('jquery')->js(null, asset('https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'));
PackageManager::add('custom')->js(null, asset('resources/js/admin/users_informations.js'));