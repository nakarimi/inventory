<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ApplicationController extends Controller
{
    public function __invoke()
    {
        return view('application');
    }

    // public function __construct(Request $request)
    // {
    //     $request['user_id'] = auth()->guard('api')->user()->id;
    // }

}
