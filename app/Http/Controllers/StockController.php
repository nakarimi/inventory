<?php

namespace App\Http\Controllers;

use App\Models\Stock;
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
        $result = Stock::create($request->all());
        DB::commit();
        return $result;
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
        //
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
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
