<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transfer extends Model
{
    protected $fillable = [
        'source_stock',
        'target_stock',
        'ammount',
        'approval_status',
        'user_id',
    ];

    public function source_stock()
    {
        return $this->belongsTo(Stock::class, 'source_stock');
    }
    public function target_stock()
    {
        return $this->belongsTo(Stock::class, 'target_stock');
    }

    
}
