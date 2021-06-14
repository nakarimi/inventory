<?php

namespace App\Http\Controllers;

use App\Models\User;

use App\Helper\Helper;

use App\Models\Branch;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use Spatie\Activitylog\Models\Activity;
use Illuminate\Support\Facades\Response;


class UserController extends Controller
{

    public function __construct(Request $request)
    {
        $user = auth()->guard('api')->user();
        $request['user_id'] = $user->id;
    }

    public function user(Request $request)
    {
        $user = User::with('roles')->find($request->user()->id);
        $user['branch_id'] = Branch::find($user->branch_id);
        return $user;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // load all users except admin and current user
        return User::with(['branch', 'roles'])->whereNotIn('id', [1, auth()->guard('api')->user()->id])->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, User::rules(), User::messages());

        DB::beginTransaction();
        try {
            $create = [
                'first_name' => $request['first_name'],
                'last_name' => $request['last_name'],
                'branch_id' => $request['branch']['id'],
                'user_type' => '',
                'position' => '',
                'email' => $request['email'],
                'phone' => $request['phone'],
                'address' => $request['address'],
                'password' => Hash::make($request['password']),
            ];
            $user = User::create($create);
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($user)
                ->withProperties($user)
                ->log('Created');

            // add related notification to this operation in system
            Helper::notify('A new user had been created in the system!' , 'Creation', 'user', $user->id, 'success');
            DB::commit();
            return ['msg' => 'user successfully inserted', $user];
        } catch (Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return User::with('branch')->find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::with('branch')->findOrFail($id);
        // $user['userleaders'] = UserAssignment::where('lead_user_id', $id)->get();
        return $user;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = DB::table('users')->find($id);
        if ($request->change_password) {
            $validated = $request->validate([
                'current_password' => [
                    'required',

                    function ($attribute, $value, $fail) use ($user) {
                        if (!Hash::check($value, $user->password)) {
                            $fail('Your password was not updated, since the provided current password does not match.');
                        }
                    }
                ],
                'new_password' => [
                    'required',
                    'min:6',
                    'confirmed',
                    'different:current_password'
                ]
            ]);
            $user = User::findOrFail($id);
            $password = Hash::make($request['new_password']);
            $user->update(['password' => $password]);
            // Log this activity to the system by user and entity data.
            activity()
                ->causedBy(auth()->guard('api')->user())
                ->performedOn($user)
                ->withProperties($user)
                ->log('Updated - Password Changed');
            return User::findOrFail($id);
        } else {
            DB::beginTransaction();
            try {
                $this->validate($request, [
                    'branch' =>  'required',
                    'first_name' =>  'required|max:191',
                    'last_name' => 'required|max:191',
                    'phone' => 'required|max:12',
                    'address' => 'required',
                ]);
                unset($request['email']);
                $request['branch_id'] = $request['branch']['id'];
                $user = User::find($id);
                $user->update($request->all());
                // Log this activity to the system by user and entity data.
                activity()
                    ->causedBy(auth()->guard('api')->user())
                    ->performedOn($user)
                    ->withProperties($user)
                    ->log('Updated');

                // add related notification to this operation in system
                Helper::notify('A user removed from system!', 'Modification', 'user', $user->id, 'warning');
                DB::commit();
                return ["Success"];
            } catch (Exception $e) {
                DB::rollback();
                // Log this activity to the system by user and entity data.
                activity()
                    ->causedBy(auth()->guard('api')->user())
                    ->withProperties($e)
                    ->log('Operation Failed');
                return Response::json($e, 400);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        // Log this activity to the system by user and entity data.
        activity()
            ->causedBy(auth()->guard('api')->user())
            ->performedOn($user)
            ->withProperties($user)
            ->log('Deleted');
        // add related notification to this operation in system
        Helper::notify('A user removed from system!', 'Deletion', 'user', $user->id, 'danger');
        return ['message' => 'User Deleted'];
    }

    // Approve user status
    public function approve($id, Request $request)
    {
        $user = User::findOrFail($id);
        $user->update([
            'status' => 'Approved',
        ]);
        // All current roles will be removed from the user and replaced by the array given

        $user->syncRoles($request->user_role);
    }

    public function activity_log()
    {
        $act = Activity::with(['subject', 'causer'])->latest()->get();
        return $act;
    }
}
