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
Route::post('approve/transfer/{id}', 'TransferController@approve')->middleware('auth:api');

// Application Resource Routes
Route::resource('branches', 'BranchController');
Route::resource('accounts', 'AccountController');
Route::resource('customers', 'CustomerController');
Route::resource('vendors', 'VendorController');
Route::resource('categories', 'CategoryController');
Route::resource('stocks', 'StockController');
Route::resource('products', 'ProductController');
Route::resource('sales', 'SaleController');
Route::post('orders', 'SaleController@storeOrder');
Route::get('list/orders', 'SaleController@storeOrderList');
Route::get('remove/orders/{id}', 'SaleController@storeOrderDelete');
Route::get('get/items/orders/{id}', 'SaleController@storeOrderGetItems');
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

Route::get('reports/getProductsSales', 'ApplicationController@getProductsSales');
Route::get('reports/getAccountsBalance', 'ApplicationController@getAccountsBalance');
Route::get('reports/getFinanceStatus', 'ApplicationController@getFinanceStatus');
// Custom Routes
Route::get('reports/all_reports', 'PrintController@allReports');
Route::get('reports/sales_report', 'PrintController@salesReport');
Route::get('reports/purchase_report', 'PrintController@purchaseReport');
Route::get('reports/transfers_report', 'PrintController@transfersReport');
Route::get('reports/trnsactions_report', 'PrintController@transactionsReport');
Route::get('reports/balancesheet_report', 'PrintController@balancesheetReport');

Route::get('home', 'UserController@home');
Route::get('download/pdf', 'PrintController@download');
Route::get('download/backup', 'PrintController@downloadBackup');
Route::get('manage/all_backups', 'PrintController@allBackup');
Route::get('manage/new_backup', 'PrintController@newBackup');