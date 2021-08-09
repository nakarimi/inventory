<?php

namespace App\Http\Controllers;

use Carbon\Carbon;

use App\Models\Payment;
use App\Models\Product;
use App\Models\StockRecord;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Account;
use App\Models\Transaction;

class ApplicationController extends Controller
{
    public function __invoke()
    {
        return view('application');
    }

    // Load all unread notifiacitons.
    public function unreadNotifications(Request $request)
    {
        return DB::table('notifs')
            ->join('users', 'users.id', '=', 'notifs.user_id')
            ->where('notifs.status', '<>', 'read')
            ->where('notifs.branch_id', auth()->guard('api')->user()->branch_id)
            ->latest('notifs.created_at')
            ->get(['notifs.*', 'users.first_name', 'users.last_name']);
    }

    // Load all read notifiactions.
    public function readNotifications(Request $request)
    {
        return DB::table('notifs')
            ->join('users', 'users.id', '=', 'notifs.user_id')

            // Load same branch data for this user.
            ->where('notifs.branch_id', auth()->guard('api')->user()->branch_id)
            ->latest('notifs.created_at')
            ->get(['notifs.*', 'users.first_name', 'users.last_name']);
    }

    // Change the notifications as read.
    public function MakeReadNotif(Request $request)
    {
        return DB::table('notifs')->where('id', $request->id)->update(['status' => 'read']);
    }
    public function getProductsSales(Request $request)
    {

        $sr = StockRecord::get()->pluck('product_id')->toArray();
        $sr = array_unique($sr);

        $products = Product::whereIn('id', $sr)->latest()->limit(10)->get();
        $categories = [];
        $data = [];
        foreach ($products as $key => $product) {
            $categories[$key] = $product->name;
            $data[$key] = StockRecord::where('product_id', $product->id)
                ->where('type', 'sale')
                ->sum('total_price');
        }

        return [$categories, $data];
    }
    public function getFinanceStatus(Request $request)
    {
        $series = [
            [
                'name' => 'Purchase',
                'data' => []
            ],
            [
                'name' => 'Sale',
                'data' => []
            ],
            [
                'name' => 'Benefit',
                'data' => []
            ],
        ];

        $categories = [];
        foreach (range(-11, 0, 1) as $key => $m) {
            $thisDate = [
                date("Y-m-d", strtotime('first day of '.$m.'months')),
                date("Y-m-d ", strtotime('last day of '.$m.'months')),
            ];
            // dd($thisDate);
            $series[0]['data'][$key] = Payment::where('sale_id', null)
            ->whereBetween('created_at', $thisDate)
            ->sum('amount');
            $series[1]['data'][$key] = Payment::where('purchase_id', null)
            ->whereBetween('created_at', $thisDate)
            ->sum('amount');
            $series[2]['data'][$key] = $series[1]['data'][$key] - $series[0]['data'][$key];
            $categories[$key] = date("M Y", strtotime('first day of '.$m.'months'));
        }
        return [$categories, $series];
    }
    public function getAccountsBalance(Request $request)
    {
        $ids = Transaction::get()->pluck('account_id')->toArray();
        $ids = array_unique($ids);
        $accounts = Account::find($ids);
        
        $labels = [];
        $data = [];
        
        foreach (range(-11, 0, 1) as $key0 => $m) {
            $thisDate = [
                date("Y-m-d", strtotime('first day of '.$m.'months')),
                date("Y-m-d", strtotime('last day of '.$m.'months')),
            ];
            foreach ($accounts as $key => $acc) {
                $credit = Transaction::where('account_id', $acc->id)
                ->whereBetween('created_at', $thisDate)->sum('credit');
                $debit = Transaction::where('account_id', $acc->id)
                ->whereBetween('created_at', $thisDate)->sum('debit');
                $balance = intval($credit) - intval($debit);
                
                $data[$key]['name'] = $acc->name;
                $data[$key]['data'][$key0] = $balance;
            }
            
            $categories[$key0] = date("M Y", strtotime('first day of '.$m.'months'));
        }
        return [$categories, $data];
    }
}