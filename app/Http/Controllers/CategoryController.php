<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class CategoryController extends Controller
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
        return Category::all();
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
        $this->validate($request, Category::rules());
        $category = Category::create($request->all());
        // Log this activity to the system by user and entity data.
        activity()
            ->causedBy(auth()->guard('api')->user())
            ->performedOn($category)
            ->withProperties($category)
            ->log('Created');

        // add related notification to this operation in system
        Helper::notify('A new category had been created in the system!', 'Creation', 'category', $category->id, 'success');
        return $category;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, Category::rules($id));

        $category = Category::find($id);
        $category->update($request->all());
        // Log this activity to the system by user and entity data.
        activity()
            ->causedBy(auth()->guard('api')->user())
            ->performedOn($category)
            ->withProperties($category)
            ->log('Updated');
        // add related notification to this operation in system
        Helper::notify('A category had been updated in the system!', 'Modification', 'category', $category->id, 'warning');
        return $category;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        DB::beginTransaction();
        try {
            $result = $category->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($category)
                ->withProperties($category)
                ->log('Deleted');
            // add related notification to this operation in system
            Helper::notify('A category removed from system!', 'Deletion', 'category', $category->id, 'danger');
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
