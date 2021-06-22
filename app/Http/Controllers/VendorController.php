<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class VendorController extends Controller
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
        return Vendor::all();
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
        $this->validate($request, Vendor::rules(), Vendor::messages());
        DB::beginTransaction();
        try {
            Helper::file_upload_update($request, 'logo', null, 'product');
            $vendor = Vendor::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($vendor)
                ->withProperties($vendor)
                ->log('Created');

            // add related notification to this operation in system
            Helper::notify('A new vendor had been created in the system!' , 'Creation', 'vendor', $vendor->id, 'success');
            DB::commit();
            return $vendor;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function show(Vendor $vendor)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function edit(Vendor $vendor)
    {
        return $vendor;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Vendor $vendor)
    {
        $this->validate($request, Vendor::rules($vendor->id), Vendor::messages());
        DB::beginTransaction();
        try {
            Helper::file_upload_update($request, 'logo', $vendor, 'vendor');
            unset($request->email);
            $result = $vendor->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($vendor)
                ->withProperties($vendor)
                ->log('Updated');
            // add related notification to this operation in system
            Helper::notify('A vendor had been updated in the system!' , 'Modification', 'vendor', $vendor->id, 'warning');
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
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vendor $vendor)
    {
        DB::beginTransaction();
        try {
            $result = $vendor->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($vendor)
                ->withProperties($vendor)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('A vendor removed from system!' , 'Deletion', 'vendor', $vendor->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
