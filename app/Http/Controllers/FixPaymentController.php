<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use Illuminate\Http\Request;
use App\Models\FixPayment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class FixPaymentController extends Controller
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
        // Load All FixPayments with associate vendor and stock.
        return FixPayment::with(['account_id'])->get();
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

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'account_id');

            $result = FixPayment::create($request->all());

            // Add transaction records.
            $data = [
                'type' => 'fixpayment',
                'type_id' => $result->id,
                'credit' => ($result->type == 'In') ? $result->ammount : 0,
                'debit' => ($result->type == 'Out') ? $result->ammount : 0,
                'account_id' => $request->account_id,
                'status' => $result->type,
                'description' => '---',
                'user_id' => $request->user_id,
            ];
            Helper::do_transaction($data);

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
     * @param  \App\Models\FixPayment  $fixpayment
     * @return \Illuminate\Http\Response
     */
    public function show(FixPayment $fixpayment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FixPayment  $fixpayment
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Load All FixPayments with associate vendor and stock.
        return FixPayment::with(['account_id'])->find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FixPayment  $fixpayment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FixPayment $fixpayment)
    {
        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'account_id');

            $result = $fixpayment->update($request->all());


            // Add Transaction recored.
            $data = [
                'type' => 'fixpayment',
                'type_id' => $fixpayment->id,
                'credit' => ($fixpayment->type == 'In') ? $fixpayment->ammount : 0,
                'debit' => ($fixpayment->type == 'Out') ? $fixpayment->ammount : 0,
                'account_id' => $request->account_id,
                'status' => $fixpayment->type,
                'description' => '---',
                'user_id' => $request->user_id,
            ];
            Helper::do_transaction($data, true);

            DB::commit();
            return $fixpayment;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FixPayment  $fixpayment
     * @return \Illuminate\Http\Response
     */
    public function destroy(FixPayment $fixpayment)
    {
        //
    }
}
