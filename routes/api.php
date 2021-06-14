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
Route::post('approve/user/{id}', 'UserController@approve')->middleware('auth:api');

// Application Resource Routes
Route::resource('branches', 'BranchController');
Route::resource('accounts', 'AccountController');
Route::resource('customers', 'CustomerController');
Route::resource('vendors', 'VendorController');
Route::resource('categories', 'CategoryController');
Route::resource('stocks', 'StockController');
Route::resource('products', 'ProductController');
Route::resource('sales', 'SaleController');
Route::resource('purchases', 'PurchaseController');
Route::resource('payments', 'PaymentController');
Route::resource('fixpayments', 'FixPaymentController');
Route::resource('transfers', 'TransferController');
Route::get('transactions', 'TransferController@transactions');
Route::get('activity_log', 'UserController@activity_log');
Route::get('sale_max_value/{type}/{id}', 'SaleController@sale_max_value');
Route::get('unread_notifications', 'ApplicationController@unreadNotifications');
Route::get('read_notifications', 'ApplicationController@readNotifications');
Route::post('make_read_notif', 'ApplicationController@MakeReadNotif');

// Custom Routes
Route::get('home', 'UserController@home');