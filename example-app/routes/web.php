<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    Log::info('Welcome page visited');
    return view('welcome');
});
