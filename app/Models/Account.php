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
                'account_user_id' => 'required',
                'name' => 'required|min:3',
                'status' => 'required',
            ],
            $merge
        );
    }

    
    public function user_account()
    {
        return $this->belongsTo(User::class, 'account_user_id');
    }
}
