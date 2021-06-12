<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
                'amount'         => 'required',
                'approval_status' => 'required',
            ],
            $merge
        );
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
