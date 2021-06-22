<?php

namespace App\Models;

use App\Helper\Helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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
                'biller_id'      => 'required',
                'stock_id'       => 'required',
                'total'          => 'required|min:1',
                'due_date'       => 'required',
                // 'note'           => 'required',
                // 'discount'       => 'required',
                // 'product_tax'    => 'required',
                'payment_term'   => 'required',
                'total_items'    => 'required',
                // 'pos'            => 'required',
                // 'paid'           => 'required',
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
