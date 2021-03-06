<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\Payment;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class PaymentController extends Controller
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
        // Load All Payments with associate vendor and stock.
        return Payment::with(['account_id', 'purchase_id', 'sale_id'])->get();
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
        $this->validate($request, Payment::rules());

        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'account_id');
            Helper::get_id($request, 'user_account');
            Helper::get_id($request, 'sale_id');
            Helper::get_id($request, 'purchase_id');

            $payment = Payment::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($payment)
                ->withProperties($payment)
                ->log('Created');
            // Add transaction records.
            $data = [
                'type' => 'payment',
                'type_id' => $payment->id,
                'credit' => ($payment->type == 'In') ? $payment->amount : 0,
                'debit' => ($payment->type == 'Out') ? $payment->amount : 0,
                'account_id' => $request->account_id,
                'status' => $payment->type,
                'description' => '---',
                'user_id' => $request->user_id,
            ];
            Helper::do_transaction($data);

            // add related notification to this operation in system
            Helper::notify('A new payment had been created in the system!' , 'Creation', 'payment', $payment->id, 'success');
            DB::commit();
            return $payment;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Load All Payments with associate vendor and stock.
        return Payment::with(['account_id', 'purchase_id', 'sale_id'])->find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        $this->validate($request, Payment::rules($payment->id));

        // Using transaction that if process failed the invalid data will be cleared.
        DB::beginTransaction();
        try {

            // Set default status.
            $request['payment_status'] = 'none';

            // Get Id From object as the object can't be stored in DB.
            Helper::get_id($request, 'account_id');
            Helper::get_id($request, 'user_account');
            Helper::get_id($request, 'sale_id');
            Helper::get_id($request, 'purchase_id');

            $result = $payment->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($payment)
                ->withProperties($payment)
                ->log('Updated');


            $data = [
                'type' => 'payment',
                'type_id' => $payment->id,
                'credit' => ($payment->type == 'In') ? $payment->amount : 0,
                'debit' => ($payment->type == 'Out') ? $payment->amount : 0,
                'account_id' => $request->account_id,
                'status' => $payment->type,
                'description' => '---',
                'user_id' => $request->user_id,
            ];
            Helper::do_transaction($data, true);
            // add related notification to this operation in system
            Helper::notify('A payment had been updated in the system!' , 'Modification', 'payment', $payment->id, 'warning');

            DB::commit();
            return $payment;
        } catch (Exception $e) {

            // Rollback the invalid changes on database. and throw the error to API.
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        DB::beginTransaction();
        try {
            $result = $payment->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($payment)
                ->withProperties($payment)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('A payment removed from system!', 'Deletion', 'payment', $payment->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
