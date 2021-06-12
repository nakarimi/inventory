<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable = [
        'reference_no',
        'date',
        'vendor_id',
        'vendor',
        'stock_id',
        'note',
        'total',
        'discount',
        'total_tax',
        'payment_status',
        'due_date',
        'user_id',
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
                'reference_no'   => 'required|unique:purchases'. ($id ? ",reference_no,$id" : ''),
                'date'           => 'required',
                'vendor_id'      => 'required',
                // 'vendor'         => 'required',
                'stock_id'       => 'required',
                'note'           => 'required',
                'total'          => 'required',
                'discount'       => 'required',
                'total_tax'      => 'required',
                'payment_status' => 'required',
                'due_date'       => 'required',
            ],
            $merge
        );
    }

    // Database relation diffinition.
    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id');
    }
    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }
}
