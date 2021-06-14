<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ApplicationController extends Controller
{
    public function __invoke()
    {
        return view('application');
    }

    // Load all unread notifiacitons.
    public function unreadNotifications(Request $request){
        return DB::table('notifs')
        ->join('users', 'users.id', '=', 'notifs.user_id')
          ->where('notifs.status', '<>','read')
          ->where('notifs.branch_id', auth()->guard('api')->user()->branch_id)
          ->latest('notifs.created_at')
          ->get(['notifs.*', 'users.first_name', 'users.last_name']);
      }

    // Load all read notifiactions.
    public function readNotifications(Request $request){
        return DB::table('notifs')
        ->join('users', 'users.id', '=', 'notifs.user_id')
        ->where('notifs.branch_id', auth()->guard('api')->user()->branch_id)
        ->latest('notifs.created_at')
        ->get(['notifs.*', 'users.first_name', 'users.last_name']);
    }

    // Change the notifications as read.
    public function MakeReadNotif(Request $request){
        return DB::table('notifs')->where('id', $request->id)->update(['status' => 'read']);
    }
}
