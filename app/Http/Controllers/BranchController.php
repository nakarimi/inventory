<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\Branch;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class BranchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Branch::all();
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
        $this->validate($request, Branch::rules());
        DB::beginTransaction();
        try {
            $branch = Branch::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($branch)
                ->withProperties($branch)
                ->log('Created');
                DB::commit();
            // add related notification to this operation in system
            Helper::notify('A new branch had been created in the system!' , 'Creation', 'branch', $branch->id, 'success');
            return ['msg' => 'Branch successfully inserted'];
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function show(Branch $branch)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function edit(Branch $branch)
    {
        return $branch;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Branch $branch)
    {
        $this->validate($request, Branch::rules($branch->id));
        DB::beginTransaction();
        try {
            $branch->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($branch)
                ->withProperties($branch->getChanges())
                ->log('Updated');
            // add related notification to this operation in system
            Helper::notify('A branch had been updated in the system!' , 'Modification', 'branch', $branch->id, 'warning');
            if ($branch->getChanges()) {
                DB::commit();
            }
            return ['msg' => 'Branch successfully updated'];
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function destroy(Branch $branch)
    {
        DB::beginTransaction();
        try {

            $result = $branch->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($branch)
                ->withProperties($branch)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('A Branch removed from system!' , 'Deletion', 'branch', $branch->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
