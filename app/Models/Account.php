<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    protected $fillable = [
        'user_id', 
        'account_user_id', 
        'name', 
        'status', 
    ];
    public function user_account()
    {
        return $this->belongsTo(User::class, 'account_user_id');
    }
}
