<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\Account;
use App\Models\Purchase;
use Carbon\Carbon;
use App\Models\Sale;
use Barryvdh\DomPDF\PDF;
use App\Models\StockRecord;
use App\Models\Transaction;
use App\Models\Transfer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Response;

class PrintController extends Controller
{
  protected $dates = [];
  public function __construct(Request $request)
  {
    $this->dates = [
      date("Y-m-d", strtotime($request->start_date)),
      date("Y-m-d", strtotime($request->end_date))
    ];
  }
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function print(Request $request)
  {
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $data = [
      'label' => 'Invoice',
      'created' => Carbon::now()->format('Y-M-d'),
      'due' => Carbon::today()->addDays(7)->format('Y-M-d'),
      'company_info' => [
        'Sparksuite, Inc.', '12345 Sunny Road', 'Sunnyville, CA 12345'
      ],
      'reciever_info' => [
        'Acme Corp.',
        'John Doe',
        'john@example.com',
      ],
      'sale' => Sale::where('id', $request->id)->with(['customer', 'stock'])->first()
    ];
    $data['sale']['stock'] = $data['sale']['stock']['name'];
    // Find Items based on type and it.
    $data['sale']['items'] = StockRecord::where('type', 'sale')->where('type_id', $request->id)
      ->with(['category_id', 'item_id.category'])
      ->select('decrement AS amount', 'stock_records.*')
      ->get();

    $pdf->loadView('print_invoice', compact('logo', 'data'));

    // Direct download.
    // return $pdf->stream();
    return $pdf->download('invoice-' . Carbon::now() . '.pdf');
  }


  /**
   * load Image by using the path from public directory, convert to base 64 to be used in the pdf generation.
   *
   * @param  mixed $path
   * @return void
   */
  public function loadImg($path)
  {
    return "data:image/png;base64," . base64_encode(file_get_contents(public_path($path)));
  }

  public function salesReport(Request $request)
  {
    $query = Sale::with(['customer', 'stock', 'biller']);
    if (!$request->all) {
      $query = $query->whereBetween('created_at', $this->dates);
    }

    $sales = $query->get();

    $data = [
      'label' => 'Sales Report',
      'created' => Carbon::now()->format('Y-M-d'),
      'start' => $this->dates[0],
      'end' => $this->dates[1]
    ];
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_sales_report', compact('logo', 'data', 'sales'));
    return $pdf->download('sales-report-' . Carbon::now() . '.pdf');
  }
  public function purchaseReport(Request $request)
  {
    $query = Purchase::with(['vendor', 'stock']);
    if (!$request->all) {
      $query = $query->whereBetween('created_at', $this->dates);
    }

    $purchases = $query->get();

    $data = [
      'label' => 'Purchases Report',
      'created' => Carbon::now()->format('Y-M-d'),
      'start' => $this->dates[0],
      'end' => $this->dates[1]
    ];
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_purchases_report', compact('logo', 'data', 'purchases'));
    return $pdf->download('purchases-report-' . Carbon::now() . '.pdf');
  }
  public function transfersReport(Request $request)
  {
    $query = Transfer::with(['source', 'target']);
    if (!$request->all) {
      $query = $query->whereBetween('created_at', $this->dates);
    }

    $transfers = $query->get();

    $data = [
      'label' => 'Transfers Report',
      'created' => Carbon::now()->format('Y-M-d'),
      'start' => $this->dates[0],
      'end' => $this->dates[1]
    ];
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_transfers_report', compact('logo', 'data', 'transfers'));
    return $pdf->download('transfers-report-' . Carbon::now() . '.pdf');
  }
  public function transactionsReport(Request $request)
  {
    $query = Transaction::with(['account']);
    if (!$request->all) {
      $query = $query->whereBetween('created_at', $this->dates);
    }

    $transactions = $query->get()->toArray();

    $data = [
      'label' => 'Transactions Report',
      'created' => Carbon::now()->format('Y-M-d'),
      'start' => $this->dates[0],
      'end' => $this->dates[1]
    ];
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_transactions_report', compact('logo', 'data', 'transactions'));
    return $pdf->download('transactions-report-' . Carbon::now() . '.pdf');
  }
  public function balancesheetReport(Request $request)
  {
    $query = Account::with(['user_account', 'transactions']);
    if (!$request->all) {
      $query = $query->whereHas('transactions', function ($q) {
        return $q->whereBetween('created_at', $this->dates);
      });
      
    }

    $accounts = $query->get();
    foreach ($accounts as $key => &$account) {
      $account->t_credit = 0;
      $account->t_debit = 0;
      $account->t_balance = 0;
      foreach ($account->transactions as $key => $value) {
        $account->t_credit += abs($value->credit);
        $account->t_debit += abs($value->debit);
        $account->t_balance += abs($value->credit) - abs($value->debit);
      }
    }
    // return $accounts;
    $data = [
      'label' => 'Balance Sheet Report',
      'created' => Carbon::now()->format('Y-M-d'),
      'start' => $this->dates[0],
      'end' => $this->dates[1]
    ];
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_balance_sheet_report', compact('logo', 'data', 'accounts'));
    return $pdf->download('balancesheet-report-' . Carbon::now() . '.pdf');
  }
}
