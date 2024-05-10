<?php

use App\Jobs\LongRunningJob;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/long-running-job', function () {
    LongRunningJob::dispatch();

    return view('welcome');
})->name('dispatch-job');
