<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookingController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', 'Auth\UserAuthController@register');
Route::post('/login', 'Auth\UserAuthController@login');

Route::get('/seats',  [BookingController::class, 'getAvailableSeats']);
Route::post('/seats/book',  [BookingController::class, 'bookSeat']);
