<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Vendor;
use App\Models\Purchase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class PurchaseController extends Controller
{
    // Adding the current user to each request.
    // By user id the branch also will be available.
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
        return Purchase::with(['vendor', 'stock'])->get();
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
    public function store(Request $request)
    {
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Extract object label to be stored in database.
            $request['vendor'] = (isset($request['vendor_id']) && $request['vendor_id'] != null) ? $request['vendor_id']['name'] : null;
            $request['stock'] = (isset($request['stock_id']) && $request['stock_id'] != null) ? $request['stock_id']['name'] : null;

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'stock_id');
            Helper::get_id($request, 'vendor_id');
            $result = Purchase::create($request->all());
            DB::commit();
            return $result;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function show(Purchase $purchase)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Load purchase data to be inserted in the form.
        $purchase = Purchase::with(['vendor', 'stock'])->find($id);

        // These should be object to be fill by default in select list.
        $purchase['vendor_id'] = Vendor::find($purchase['vendor_id']);
        $purchase['stock_id'] = Stock::find($purchase['stock_id']);

        return $purchase;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Purchase $purchase)
    {
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Extract object label to be stored in database.
            $request['vendor'] = (isset($request['vendor_id']) && $request['vendor_id'] != null) ? $request['vendor_id']['name'] : null;
            $request['stock'] = (isset($request['stock_id']) && $request['stock_id'] != null) ? $request['stock_id']['name'] : null;

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'stock_id');
            Helper::get_id($request, 'vendor_id');
            $purchase->create($request->all());
            DB::commit();
            return $purchase;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Purchase $purchase)
    {
        //
    }
}
