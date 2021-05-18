<?php

namespace App\Helper;

use App\Models;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class Helper
{
    public static function get_id(&$request, $field)
    {
        $request[$field] = (isset($request[$field]) && $request[$field] != null) ? $request[$field]['id'] : null;
    }
}