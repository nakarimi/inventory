<?php

namespace App\Models;

use App\Models\Stock;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'code',
        'name',
        'unit',
        'cost',
        'price',
        'image',
        'category_id',
        'stock_id',
        'user_id',
        'quantity',
        'barcode_symbology',
        'product_details',
        'tax',
        'type',
        'supplier',
        'supplier_price',
        'sale_unit',
        'purchase_unit',
        'brand',
        'featured',
    ];


    // Relations
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }

}
