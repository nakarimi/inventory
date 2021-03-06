<?php

namespace App\Models;

use App\Helper\Helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class StockRecord extends Model
{
    protected $fillable = [
        'type_id',
        'type',
        'unit_id',
        'increment',
        'decrement',
        'unit_price',
        'total_price',
        'category_id',
        'stock_id',
        'product_id',
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
                'code' => 'required|min:3|unique:branches'. ($id ? ",code,$id" : ''),
                'name' => 'required|min:3',
                'address' => 'required|min:10',
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
    
    public function item_id()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    public function category_id()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

}
