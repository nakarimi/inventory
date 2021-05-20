<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StockRecord extends Model
{
    protected $fillable = [
        'type_id',
        'type',
        'unit_id',
        'increment',
        'decrement',
        'unit_price',
        'total_price',
        'category_id',
        'stock_id',
        'product_id',
        'user_id',
    ];

    public function item_id()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    public function category_id()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

}
