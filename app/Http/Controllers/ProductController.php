<?php

namespace App\Http\Controllers;

use App\Models\Stock;
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
        $request['category_id'] = (isset($request['category_id']) && $request['category_id'] != null) ? $request['category_id']['id'] : null;
        $request['stock_id'] = isset($request['stock_id']) && $request['stock_id'] != null ? $request['stock_id']['id'] : null;
        // $this->validate($request,[
        //     'code' => 'required|code|unique:products',
        //     'name' => 'required',
        //     'cost' => 'required',
        // ]);
        DB::beginTransaction();
        try {

            // Image Upload/Store.
            $photoname = NULL;
            if ($request->image != null) {

                $photoname = time() . '.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save(public_path('img/product/') . $photoname);
                $request->merge(['image' => $photoname]);
            }

            // Product being create.
            $result = Product::create($request->all());
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
        $request['category_id'] = (isset($request['category_id']) && $request['category_id'] != null) ? $request['category_id']['id'] : null;
        $request['stock_id'] = isset($request['stock_id']) && $request['stock_id'] != null ? $request['stock_id']['id'] : null;
        // $this->validate($request,[
        //     'code' => 'required|code|unique:products',
        //     'name' => 'required',
        //     'cost' => 'required',
        // ]);
        DB::beginTransaction();
        try {
            $photoname = NULL;
            $product = Product::findOrFail($id);
            if (!($product->image == $request->image)) {
                if ($request->image != null) {
                    $photoname = time() . '.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                    \Image::make($request->image)->save(public_path('img/product/') . $photoname);
                    $request->merge(['image' => $photoname]);
                }
            }
            $result = $product->update($request->all());
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
            DB::commit();
            return $result;
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }
}
