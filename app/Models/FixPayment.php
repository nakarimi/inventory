<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FixPayment extends Model
{
    protected $fillable = [
        'ammount',
        'receiver',
        'title',
        'type',
        'date',
        'payment_status',
        'note',
        'approval_code',
        'account_id',
        'user_id',
    ];


    // Payment Database relation diffinition.
    public function account_id()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }
}
