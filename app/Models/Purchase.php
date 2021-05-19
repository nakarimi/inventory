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

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id');
    }
    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }
}
