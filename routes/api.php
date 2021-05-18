<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::middleware('auth:api')->post('/logout', 'AuthController@logout');
Route::resource('users', 'UserController');
Route::get('user', 'UserController@user')->middleware('auth:api');

// Application Resource Routes
Route::resource('branches', 'BranchController');
Route::resource('accounts', 'AccountController');
Route::resource('customers', 'CustomerController');
Route::resource('vendors', 'VendorController');
Route::resource('categories', 'CategoryController');
Route::resource('stocks', 'StockController');
Route::resource('products', 'ProductController');
Route::resource('sales', 'SaleController');

// Custom Routes
Route::get('home', 'UserController@home');