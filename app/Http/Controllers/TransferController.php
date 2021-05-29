<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Transfer;
use App\Models\StockRecord;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class TransferController extends Controller
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
        // Load All Transfers with associate stock.
        return Transfer::with(['source_stock', 'target_stock'])->get();
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
            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'source_stock');
            Helper::get_id($request, 'target_stock');
            $request['ammount'] = (isset($request['total']) && $request['total'] != null) ? $request['total'] : null;
            $result = Transfer::create($request->all());

            // Add all items to the stock from the target stock.
            $request['stock_id'] = (isset($request['target_stock']) && $request['target_stock'] != null) ? $request['target_stock'] : null;
            Helper::store_items('in-transfer', $result->id, $request, true);

            // decrement all items from source stock.
            $request['stock_id'] = (isset($request['source_stock']) && $request['source_stock'] != null) ? $request['source_stock'] : null;
            Helper::store_items('out-transfer', $result->id, $request);
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
     * @param  \App\Models\Transfer  $transfer
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Transfer  $transfer
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Load transfer data to be inserted in the form.
        $data = Transfer::with(['source_stock', 'target_stock'])->find($id);

        // Find Items based on type and it.
        $data['items'] = StockRecord::where('type', 'out-transfer')->where('type_id', $id)
            ->with(['category_id', 'item_id'])
            ->select('decrement AS ammount', 'stock_records.*')
            ->get();
        return $data;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Transfer  $transfer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Transfer $transfer)
    {
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {
            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'source_stock');
            Helper::get_id($request, 'target_stock');
            $request['ammount'] = (isset($request['total']) && $request['total'] != null) ? $request['total'] : null;
            $result = $transfer->update($request->all());

            // Add all items to the stock from the source stock.
            $request['stock_id'] = (isset($request['target_stock']) && $request['target_stock'] != null) ? $request['target_stock'] : null;
            Helper::store_items('in-transfer', $transfer->id, $request, true);

            // decrement all items from source stock.
            $request['stock_id'] = (isset($request['source_stock']) && $request['source_stock'] != null) ? $request['source_stock'] : null;
            Helper::store_items('out-transfer', $transfer->id, $request);
            DB::commit();
            return $result;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Transfer  $transfer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Transfer $transfer)
    {
        DB::beginTransaction();
        try {
            $result = $transfer->delete();
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
    public function transactions(){
        return Transaction::with('account_id')->get();
    }
}
