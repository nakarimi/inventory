<?php

namespace App\Models;

use App\Helper\Helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class FixPayment extends Model
{
    protected $fillable = [
        'amount',
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
                'amount'        => 'required|min:1',
                'receiver'       => 'required',
                'title'          => 'required',
                'type'           => 'required',
                'date'           => 'required',
                // 'payment_status' => 'required',
                // 'note'           => 'required',
                'approval_code'  => 'required',
                'account_id'     => 'required',
            ],
            $merge
        );
    }

    // Global condition to be used on each query.
    protected static function boot()
    {
        parent::boot();
        // Just load users with same branch, except for adminstrator.
        if(auth()->guard('api')->user() && !auth()->guard('api')->user()->hasRole('admin')){
            $user_ids_in_same_branch = Helper::sameBranchUsers();
            static::addGlobalScope('user_id', function (Builder $builder) use ($user_ids_in_same_branch) {
                $builder->whereIn('user_id',  $user_ids_in_same_branch);
            });
        }
    }
  
}
