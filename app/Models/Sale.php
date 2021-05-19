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
