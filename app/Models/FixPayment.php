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
                'ammount'        => 'required',
                'receiver'       => 'required',
                'title'          => 'required',
                'type'           => 'required',
                'date'           => 'required',
                'payment_status' => 'required',
                'note'           => 'required',
                'approval_code'  => 'required',
                'account_id'     => 'required',
            ],
            $merge
        );
    }

}
