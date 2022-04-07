<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class StockController extends Controller
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
        return Stock::all();
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
        $this->validate($request, Stock::rules());
        DB::beginTransaction();
        try {
            $stock = Stock::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($stock)
                ->withProperties($stock)
                ->log('Created');

            // add related notification to this operation in system
            Helper::notify('A new stock had been created in the system!' , 'Creation', 'stock', $stock->id, 'success');
            DB::commit();
            return $stock;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function show(Stock $stock)
    {
        $products = Product::where('stock_id', $stock->id)->get();
        $stock = ['products' => $products];
        return $stock;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function edit(Stock $stock)
    {
        return $stock;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Stock $stock)
    {
        $this->validate($request, Stock::rules($stock->id));
        DB::beginTransaction();
        try {
            unset($request->code);
            $result = $stock->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($stock)
                ->withProperties($stock)
                ->log('Updated');

            // add related notification to this operation in system
            Helper::notify('A stock had been updated in the system!' , 'Modification', 'stock', $stock->id, 'warning');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function destroy(Stock $stock)
    {
        DB::beginTransaction();
        try {
            $result = $stock->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($stock)
                ->withProperties($stock)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('An stock removed from system!' , 'Deletion', 'stock', $stock->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
