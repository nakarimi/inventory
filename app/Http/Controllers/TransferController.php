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
    // Approve user status
    public function approve($id, Request $request)
    {
        try {
            //code...
            $transfer = Transfer::findOrFail($id);
            $transfer->update([
                'approval_status' => $request->status,
            ]);
            return Response::json($transfer, 200);

        } catch (\Throwable $th) {
            return Response::json($th, 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, Transfer::rules());
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {
            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'source_stock');
            Helper::get_id($request, 'target_stock');
            $request['amount'] = (isset($request['total']) && $request['total'] != null) ? $request['total'] : null;
            $transfer = Transfer::create($request->all());

            // Add all items to the stock from the target stock.
            $request['stock_id'] = (isset($request['target_stock']) && $request['target_stock'] != null) ? $request['target_stock'] : null;
            Helper::store_items('in-transfer', $transfer->id, $request, true);

            // decrement all items from source stock.
            $request['stock_id'] = (isset($request['source_stock']) && $request['source_stock'] != null) ? $request['source_stock'] : null;
            Helper::store_items('out-transfer', $transfer->id, $request);
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($transfer)
                ->withProperties($transfer)
                ->log('Created');
            
            // add related notification to this operation in system
            Helper::notify('A new transfer had been created in the system!' , 'Creation', 'transfer', $transfer->id, 'success');
            DB::commit();
            return $transfer;
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
            ->select('decrement AS amount', 'stock_records.*')
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
        $this->validate($request, Transfer::rules($transfer->id));
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {
            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'source_stock');
            Helper::get_id($request, 'target_stock');
            $request['amount'] = (isset($request['total']) && $request['total'] != null) ? $request['total'] : null;
            $result = $transfer->update($request->all());

            // Add all items to the stock from the source stock.
            $request['stock_id'] = (isset($request['target_stock']) && $request['target_stock'] != null) ? $request['target_stock'] : null;
            Helper::store_items('in-transfer', $transfer->id, $request, true);

            // decrement all items from source stock.
            $request['stock_id'] = (isset($request['source_stock']) && $request['source_stock'] != null) ? $request['source_stock'] : null;
            Helper::store_items('out-transfer', $transfer->id, $request);

            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($transfer)
                ->withProperties($transfer)
                ->log('Updated');

            // add related notification to this operation in system
            Helper::notify('A transfer had been updated in the system!' , 'Modification', 'transfer', $transfer->id, 'warning');
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
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($transfer)
                ->withProperties($transfer)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('A transfer removed from system!' , 'Deletion', 'transfer', $transfer->id, 'danger');
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
