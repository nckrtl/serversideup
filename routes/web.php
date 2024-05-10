<?php

use App\Jobs\SSULongRunningJob;
use App\Jobs\SSUShortRunningJob;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/long-running-job', function () {
    SSULongRunningJob::dispatch();

    return view('welcome');
})->name('dispatch-job');

Route::get('/multiple-shorter-jobs', function(){
    for( $i = 0; $i < 100; $i++){
        SSUShortRunningJob::dispatch();
    }

    return view('welcome');

})->name('dispatch-short-jobs');
