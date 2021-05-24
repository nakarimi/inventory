<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = [
        'type',
        'type_id',
        'credit',
        'debit',
        'account_id',
        'status',
        'description',
        'user_id',
    ];
    public function account_id()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }

}
