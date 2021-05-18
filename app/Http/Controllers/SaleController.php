<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Helper\Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

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
        // return Response::json($request, 400);

        DB::beginTransaction();
        try {
            $request['customer'] = (isset($request['customer_id']) && $request['customer_id'] != null) ? $request['customer_id']['name'] : null;
            $request['stock'] = (isset($request['stock_id']) && $request['stock_id'] != null) ? $request['stock_id']['name'] : null;
            $request['biller'] = (isset($request['biller_id']) && $request['biller_id'] != null) ? $request['biller_id']['first_name'] : null;
            $request['sale_status'] = 'active';
            $request['payment_status'] = 'none';

            Helper::get_id($request, 'stock_id');
            Helper::get_id($request, 'biller_id');
            Helper::get_id($request, 'customer_id');
            $result = Sale::create($request->all());
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
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function show(Sale $sale)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function edit(Sale $sale)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Sale $sale)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sale  $sale
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sale $sale)
    {
        //
    }
}
