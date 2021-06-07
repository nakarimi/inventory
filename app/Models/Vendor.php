<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $fillable = [
        'name',
        'email',
        'phone',
        'website',
        'address',
        'logo',
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
                'email' => 'required|email|unique:customers'. ($id ? ",email,$id" : ''),
                'name'  => 'required',
                'phone' => 'required|min:11|numeric',
            ],
            $merge
        );
    }
}
