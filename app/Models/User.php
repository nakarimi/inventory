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


    protected static function boot()
    {
        parent::boot();
        // Just load users with same branch, except for adminstrator.
        if(auth()->guard('api')->user() && auth()->guard('api')->user()->id != 1){
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
