<?php

namespace App\Models;

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
        'stock',
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
    ]
}
