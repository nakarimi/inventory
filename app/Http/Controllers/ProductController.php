<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class ProductController extends Controller
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
        return Product::with(['category', 'stock'])->get();
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
        $this->validate($request, Product::rules());
        $request['category_id'] = (isset($request['category_id']) && $request['category_id'] != null) ? $request['category_id']['id'] : null;
        $request['stock_id'] = isset($request['stock_id']) && $request['stock_id'] != null ? $request['stock_id']['id'] : null;
        DB::beginTransaction();
        try {
            Helper::file_upload_update($request, 'image', null, 'product');
            // Product being create.
            $product = Product::create($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($product)
                ->withProperties($product)
                ->log('Created');

            // add related notification to this operation in system
            Helper::notify('A new product had been created in the system!' , 'Creation', 'product', $product->id, 'success');
            DB::commit();
            return $product;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Product::with('category')->with('stock')->where('id', $id)->first();

        // Add exist object for select option.
        $data->stock_id = Stock::find($data['stock_id']);
        $data['category_id'] = $data['category'];
        return $data;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Extract the id from objects.
        $request['category_id'] = (isset($request['category_id']) && $request['category_id'] != null) ? $request['category_id']['id'] : null;
        $request['stock_id'] = isset($request['stock_id']) && $request['stock_id'] != null ? $request['stock_id']['id'] : null;
        $this->validate($request, Product::rules($id));

        DB::beginTransaction();
        try {
            $product = Product::findOrFail($id);
            Helper::file_upload_update($request, 'image', $product, 'product');
            $result = $product->update($request->all());
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($product)
                ->withProperties($product)
                ->log('Updated');

            // add related notification to this operation in system
            Helper::notify('A product had been updated in the system!' , 'Modification', 'product', $product->id, 'warning');
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
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        DB::beginTransaction();
        try {
            $result = $product->delete();
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($product)
                ->withProperties($product)
                ->log('Deleted');

            // add related notification to this operation in system
            Helper::notify('A product removed from system!' , 'Deletion', 'product', $product->id, 'danger');

            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
