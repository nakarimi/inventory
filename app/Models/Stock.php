<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    protected $fillable = [
        'code',
        'name',
        'manager',
        'phone',
        'address',
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
                'code'    => 'required|min:3|unique:stocks'. ($id ? ",code,$id" : ''),
                'name'    => 'required|min:3',
                'address' => 'required|min:10',
                'manager' => 'required',
                'phone'   => 'required|min:11|numeric',
            ],
            $merge
        );
    }

}
