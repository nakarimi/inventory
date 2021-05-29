<?php

namespace App\Models;

use App\Helper\Helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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

    // Global condition to be used on each query.
    protected static function boot()
    {
        parent::boot();
        // Just load users with same branch, except for adminstrator.
        if(auth()->guard('api')->user()){
            $user_ids_in_same_branch = Helper::sameBranchUsers();
            static::addGlobalScope('user_id', function (Builder $builder) use ($user_ids_in_same_branch) {
                $builder->whereIn('user_id',  $user_ids_in_same_branch);
            });
        }
    }    
    
    public function account_id()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }

}
