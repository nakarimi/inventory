<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Sale;
use App\Helper\Helper;
use App\Models\Account;
use App\Models\Payment;
use App\Models\Purchase;
use App\Models\Transfer;
use Barryvdh\DomPDF\PDF;
use App\Models\StockRecord;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Artisan;
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
        'MortazaOmid Company.', 'Shahr-e-naw', 'Kabul-Afghanistan'
      ],
      'reciever_info' => [
        'Central Office',
        'mortazaomid@gmail.com',
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
    $name = 'invoice-' . time() . '.pdf';
    $filename = 'reports/' . $name;
    file_put_contents($filename, $pdf->output());
    $file= public_path() . '/' . $filename;

    $headers = array(
      'Content-Type: application/pdf',
    );
    // dd($file, $filename);
    return Response::download($file, $name, $headers);
    // return $pdf->save('reports/invoice-' . Carbon::now() . '.pdf')->download('invoice-' . Carbon::now() . '.pdf');
  }

  public function allReports(Request $request)
  {
    $path = public_path('reports');
    $filesInFolder = File::allFiles($path);
    
    
    foreach($filesInFolder as $key => $path){
      $files = pathinfo($path);
      $allMedia[] = $files['basename'];
    }
    return Response::json($allMedia, 200);
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
    return file_put_contents('reports/sales-report-' . time() . '.pdf', $pdf->output());
    // return $pdf->save('sales-report-' . Carbon::now() . '.pdf');
    // return $pdf->save('reports/sales-report-' . Carbon::now() . '.pdf')->download('sales-report-' . Carbon::now() . '.pdf');
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
    return file_put_contents('reports/purchases-report-' . time() . '.pdf', $pdf->output());
    //$pdf->loadView('print_purchases_report', compact('logo', 'data', 'purchases'));
    //return $pdf->save('reports/purchases-report-' . Carbon::now() . '.pdf')->download('purchases-report-' . Carbon::now() . '.pdf');
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
    return file_put_contents('reports/transfers-report-' . time() . '.pdf', $pdf->output());
    //$pdf->loadView('print_transfers_report', compact('logo', 'data', 'transfers'));
    //return $pdf->save('reports/transfers-report-' . Carbon::now() . '.pdf')->download('transfers-report-' . Carbon::now() . '.pdf');
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
    return file_put_contents('reports/transactions-report-' . time() . '.pdf', $pdf->output());
    //$pdf->loadView('print_transactions_report', compact('logo', 'data', 'transactions'));
    //return $pdf->save('reports/transactions-report-' . Carbon::now() . '.pdf')->download('transactions-report-' . Carbon::now() . '.pdf');
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
      $account->t_discount = 0;
      $account->t_tax = 0;
      $account->t_balance = 0;
      foreach ($account->transactions as $key => $value) {
        if($value->type == "payment"){
          $payments = Payment::find($value->type_id);
          if($payments){

            if($value->credit){
              // It is sale
              $sale = Sale::find($payments->sale_id);
              if($sale){
                $tax = $sale->product_tax;
                $discount = $sale->discount;
              }
            }else{
              // It is purchase
              $purchase = Purchase::find($payments->purchase_id);
              if($purchase){
                $tax = $purchase->total_tax;
                $discount = $purchase->discount;                
              }
            }              
          }else{
            $tax = 0;
            $discount = 0;
          }
        }

        $account->t_credit += abs($value->credit);
        $account->t_debit += abs($value->debit);
        $account->t_discount += abs($discount);
        $account->t_tax += abs($tax);
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
    return file_put_contents('reports/Balance-Sheet-report-' . time() . '.pdf', $pdf->output());
    //$pdf->loadView('print_balance_sheet_report', compact('logo', 'data', 'accounts'));
    //return $pdf->save('reports/balancesheet-report-' . Carbon::now() . '.pdf')->download('balancesheet-report-' . Carbon::now() . '.pdf');
  }
  public function download(Request $request){
    return response()->download(public_path('reports/' . $_GET['file']));
  }
  
  public function downloadBackup(Request $request){
    return response()->download(storage_path('app/Laravel/' . $_GET['file']));
  }

  public function newBackup(Request $request){
    try {
      Artisan::call("backup:run");
    } catch (\Throwable $th) {
      throw $th;
    }

  }
  public function allBackup(Request $request)
  {
    $path = storage_path('app/Laravel');
    $filesInFolder = File::allFiles($path);
    
    
    foreach($filesInFolder as $key => $path){
      $files = pathinfo($path);
      $allMedia[] = $files['basename'];
    }
    return Response::json($allMedia, 200);
  }
 
  
}
