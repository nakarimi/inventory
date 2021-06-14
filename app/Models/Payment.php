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
                'reference_no'  => 'required|unique:payments'. ($id ? ",reference_no,$id" : ''),
                'amount'        => 'required|min:1',
                'paid_by'       => 'required',
                'created_by'    => 'required',
                'type'          => 'required',
                'note'          => 'required',
                'approval_code' => 'required',
                'sale_id'       => '',
                'purchase_id'   => '',
                'account_id'    => 'required',
            ],
            $merge
        );
    }

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
