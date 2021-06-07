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

    /**
     * rules of validation to be used for this model. It could be used for update and create.
     *
     * @param  mixed $id
     * @param  mixed $merge
     * @return array
     */
    public static function rules($id = 0, $merge = [])
    {
        return array_merge(
            [            
                'code' => 'required|unique:products'. ($id ? ",code,$id" : ''),
                'name' => 'required',
                'cost' => 'required',
                'supplier_price' => 'required',
            ],
            $merge
        );
    }

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
