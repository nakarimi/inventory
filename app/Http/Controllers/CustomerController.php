<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Helper\Helper;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;

class CustomerController extends Controller
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
        return Customer::all();
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

        $this->validate($request, Customer::rules(), Customer::messages());
        DB::beginTransaction();
        try {
            Helper::file_upload_update($request, 'logo', null, 'customer');
            $customer = Customer::create($request->all());
            $user = User::create([
                'email' => $request->email,
                'website' => $request->website,
                'branch' =>  auth()->guard('api')->user()->branch_id,
                'first_name' =>  $request->name,
                'last_name' => $request->name,
                'phone' => $request->phone,
                'address' => $request->address,
                'password' => Hash::make($request->phone),
                'status' => 'Approved',
            ]);

            // All current roles will be removed from the user and replaced by the array given
            $user->syncRoles('customer');
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($user)
                ->withProperties($user)
                ->log('Created');

            // add related notification to this operation in system
            Helper::notify('A new user had been created in the system!' , 'Creation', 'user', $user->id, 'success');

            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($customer)
                ->withProperties($customer)
                ->log('Created');
            // add related notification to this operation in system
            Helper::notify('A new customer had been created in the system!' , 'Creation', 'customer', $customer->id, 'success');
            DB::commit();
            return $customer;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show(Customer $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function edit(Customer $customer)
    {
        return $customer;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Customer $customer)
    {
        $this->validate($request, Customer::rules($customer->id), Customer::messages());

        DB::beginTransaction();
        try {
            unset($request->email);
            Helper::file_upload_update($request, 'logo', $customer, 'customer');
            $customer->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($customer)
                ->withProperties($customer)
                ->log('Updated');
            // add related notification to this operation in system
            Helper::notify('A customer had been updated in the system!' , 'Modification', 'customer', $customer->id, 'warning');
            DB::commit();
            return $request->all();
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Customer $customer)
    {
        DB::beginTransaction();
        try {
            $result = $customer->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($customer)
                ->withProperties($customer)
                ->log('Deleted');
            // add related notification to this operation in system
            Helper::notify('A customer removed from system!' , 'Deletion', 'customer', $customer->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
