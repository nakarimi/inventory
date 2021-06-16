<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Sale;
use App\Models\User;
use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Payment;
use App\Models\Customer;
use App\Models\StockRecord;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

use function GuzzleHttp\json_decode;

class SaleController extends Controller
{

    public function __construct(Request $request)
    {
        $request['user_id'] = auth()->guard('api')->user()->id;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Sale::with(['customer', 'stock'])->get();
    }
    public function storeOrderList()
    {
        if(auth()->guard('api')->user()->hasRole('customer')){
            $orders = DB::table('orders')
            ->where('user_id', auth()->guard('api')->user()->id)
            ->get();
        }else{
            $orders = DB::table('orders')->get();
        }
        return $orders;
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeOrder(Request $request){
        $data = [
            'title' => $request->title,
            'note' => $request->note,
            'items' => json_encode($request->items),
            'user_id' => auth()->guard('api')->user()->id,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ];

        DB::table('orders')->insert($data);
    }
    public function store(Request $request)
    {
        $this->validate($request, Sale::rules());
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {
            // Extract object label to be stored in database.
            $request['customer'] = (isset($request['customer_id']) && $request['customer_id'] != null) ? $request['customer_id']['name'] : null;
            $request['stock'] = (isset($request['stock_id']) && $request['stock_id'] != null) ? $request['stock_id']['name'] : null;
            $request['biller'] = (isset($request['biller_id']) && $request['biller_id'] != null) ? $request['biller_id']['first_name'] : null;

            // Set two default status.
            $request['sale_status'] = 'active';
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'stock_id');
            Helper::get_id($request, 'biller_id');
            Helper::get_id($request, 'customer_id');
            $sale = Sale::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($sale)
                ->withProperties($sale)
                ->log('Created');
            // store related items.
            Helper::store_items('sale', $sale->id, $request);
            Helper::notify('New Sale created!' , 'Creation', 'sale', $sale->id);

            // add related notification to this operation in system
            Helper::notify('A new sale had been created in the system!' , 'Creation', 'sale', $sale->id, 'success');
            DB::commit();
            return $sale;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function storeOrderGetItems($id)
    {
        $data = DB::table('orders')->where('id', $id)->get();
        $data[0]->customer = Customer::where('email', User::find($data[0]->user_id)->email)->first();
        
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        // Load sale data to be inserted in the form.
        $sale = Sale::with(['customer', 'stock', 'biller'])->find($id);

        // These should be object to be fill by default in select list.
        $sale['biller_id'] = User::find($sale['biller_id']);
        $sale['customer_id'] = Customer::find($sale['customer_id']);
        $sale['stock_id'] = Stock::find($sale['stock_id']);

        // Find Items based on type and it.
        $sale['items'] = StockRecord::where('type', 'sale')->where('type_id', $id)
            ->with(['category_id', 'item_id'])
            ->select('decrement AS amount', 'stock_records.*')
            ->get();
        return $sale;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, Sale::rules($id));
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Extract object label to be stored in database.
            $request['customer'] = (isset($request['customer_id']) && $request['customer_id'] != null) ? $request['customer_id']['name'] : null;
            $request['stock'] = (isset($request['stock_id']) && $request['stock_id'] != null) ? $request['stock_id']['name'] : null;
            $request['biller'] = (isset($request['biller_id']) && $request['biller_id'] != null) ? $request['biller_id']['first_name'] : null;

            // Set two default status.
            $request['sale_status'] = 'active';
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'stock_id');
            Helper::get_id($request, 'biller_id');
            Helper::get_id($request, 'customer_id');

            // Load the main sale object and update it with new data.
            $sale = Sale::find($id);
            $sale->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($sale)
                ->withProperties($sale)
                ->log('Updated');
            Helper::store_items('sale', $id, $request);
            // add related notification to this operation in system
            Helper::notify('A Sale updated in system!' , 'Modification', 'sale', $sale->id, 'warning');
            DB::commit();
            return $sale;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sale $sale)
    {
        DB::beginTransaction();
        try {
            $result = $sale->delete();
            // Log this activity to the system by user and entity data.
            activity()
            ->causedBy(auth()->guard('api')->user())
            ->performedOn($sale)
            ->withProperties($sale)
            ->log('Deleted');
            // add related notification to this operation in system
            Helper::notify('A Sale removed from system!' , 'Deletion', 'sale', $sale->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }   
    public function storeOrderDelete($id)
    {
        DB::beginTransaction();
        try {
            $result = DB::table('orders')->where('id', $id)->delete();
            // Log this activity to the system by user and entity data.
            activity()
            ->causedBy(auth()->guard('api')->user())
            ->withProperties($id)
            ->log('Deleted');
            // add related notification to this operation in system
            Helper::notify('An Order removed from system!' , 'Deletion', 'Order', $id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }    
    /**
     * Calculate the paid amount for the sale or purchase.
     *
     * @param  mixed $type
     * @param  mixed $id
     * @return void
     */
    public function sale_max_value($type, $id){
        $paid = 0;
        foreach (Payment::where($type .'_id', $id)->get() as $key => $pay) {
            $paid += $pay->amount;
        }
        return $paid;
    }
}
