<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    protected $fillable = [
        'user_id',
        'date',
        'reference_no',
        'customer_id',
        'customer',
        'biller_id',
        'biller',
        'stock_id',
        'total',
        'sale_status',
        'payment_status',
        'due_date',
        'note',
        'discount',
        'product_tax',
        'payment_term',
        'total_items',
        'pos',
        'paid',
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
                'date'           => 'required',
                'reference_no'   => 'required|unique:sales'. ($id ? ",reference_no,$id" : ''),
                'customer_id'    => 'required',
                'customer'       => 'required',
                'biller_id'      => 'required',
                'biller'         => 'required',
                'stock_id'       => 'required',
                'total'          => 'required',
                'sale_status'    => 'required',
                'payment_status' => 'required',
                'due_date'       => 'required',
                'note'           => 'required',
                'discount'       => 'required',
                'product_tax'    => 'required',
                'payment_term'   => 'required',
                'total_items'    => 'required',
                'pos'            => 'required',
                'paid'           => 'required',
            ],
            $merge
        );
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }
    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }
    public function biller()
    {
        return $this->belongsTo(User::class, 'biller_id');
    }

}
