<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;




class User extends Authenticatable
{
    use HasApiTokens, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'user_type',
        'position',
        'email',
        'phone',
        'address',
        'password',
        'status',
        'branch_id'
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
                'first_name' => 'required|max:191',
                'last_name'  => 'required|max:191',
                'branch'     => 'required|max:191',
                'email'      => 'required|string|email|max:191|unique:users'. ($id ? ",email,$id" : ''),
                'phone'      => 'required|digits:10|numeric|regex:/(07)[0-9]{8}/',
                'address'    => 'required',
                'password'   => 'required|string|min:6'
                // 'user_type'  => 'required',
                // 'position'   => 'required',
                // 'status'     => 'required',
    
            ],
            $merge
        );
    }
    public static function messages($id = 0)
    {
        return
            [
                'phone.regex' => 'Phone number should follow this format: 07--------',
            ];
    }
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Load data based on user branch
    protected static function boot()
    {
        parent:: boot();
        // Just load users with same branch, except for adminstrator.
        if(auth()->guard('api')->user() && !auth()->guard('api')->user()->hasRole('admin')){
            $bId = auth()->guard('api')->user()->branch_id;
            static::addGlobalScope('branch_id', function (Builder $builder) use ($bId) {
                $builder->where('branch_id',  $bId);
            });
        }
    }
    
    // User relation with branch.
    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }
    public function branch_id()
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }
}
