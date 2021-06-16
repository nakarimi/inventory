<?php

namespace App\Models;

use App\Helper\Helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Transfer extends Model
{
    protected $fillable = [
        'source_stock',
        'target_stock',
        'amount',
        'approval_status',
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
                'source_stock'    => 'required',
                'target_stock'    => 'required',
                'total'         => 'required',
                'approval_status' => 'required',
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
    public function source_stock()
    {
        return $this->belongsTo(Stock::class, 'source_stock');
    }
    public function target_stock()
    {
        return $this->belongsTo(Stock::class, 'target_stock');
    }

    
}
