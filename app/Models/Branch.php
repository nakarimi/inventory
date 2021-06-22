<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    protected $fillable = [
        'name',
        'code',
        'address',
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
}
