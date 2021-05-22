<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = [
        'reference_no',
        'amount',
        'paid_by',
        'created_by',
        'type',
        'note',
        'approval_code',
        'sale_id',
        'purchase_id',
        'account_id',
        'user_id',
    ];


    // Payment Database relation diffinition.
    public function account_id()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }
    public function purchase_id()
    {
        return $this->belongsTo(Purchase::class, 'purchase_id');
    }
    public function sale_id()
    {
        return $this->belongsTo(Sale::class, 'sale_id');
    }
}
