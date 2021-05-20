<?php

namespace App\Helper;

use App\Models;
use Carbon\Carbon;
use App\Models\StockRecord;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class Helper
{
    public static function get_id(&$request, $field)
    {
        $request[$field] = (isset($request[$field]) && $request[$field] != null) ? $request[$field]['id'] : null;
    }
    public static function store_items($type, $type_id, $request, $in = false)
    {
        StockRecord::where('type', $type)->where('type_id', $type_id)->delete();
        foreach ($request->items as $key => $item) {
            $item['type'] = $type;
            $item['type_id'] = $type_id;
            if($in){
                $item['increment'] = $item['ammount'];
                $item['decrement'] = 0;
            }else{
                $item['decrement'] = $item['ammount'];
                $item['increment'] = 0;
            }
            Helper::get_id($item, 'unit_id');
            Helper::get_id($item, 'category_id');
            Helper::get_id($item, 'item_id');
            $item['stock_id'] = $request['stock_id'];
            $item['product_id'] = $item['item_id'];
            $item['user_id'] = $request['user_id'];
            
            $result = StockRecord::create($item);            
        }
    }
}