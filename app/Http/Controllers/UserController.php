<?php

namespace App\Http\Controllers;

use App\Models\User;

use App\Models\Branch;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;


class UserController extends Controller
{

    public function home(Request $request)
    {
        return 'API CONNECED';
    }
    public function user(Request $request)
    {
        $user = $request->user();
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
        return User::with('branch')->whereNotIn('id', [1, auth()->guard('api')->user()->id])->get();
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
        $this->validate($request, [
            'branch' =>  'required|max:191',
            'first_name' =>  'required|max:191',
            'last_name' => 'required|max:191',
            'email' => 'required|string|email|max:191|unique:users',
            'phone' => 'required|max:12',
            'address' => 'required',
            'password' => 'required|string|min:6'
        ]);

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
                DB::commit();
                return ["Success"];
            } catch (Exception $e) {
                DB::rollback();
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
        return ['message' => 'User Deleted'];
    }

    // Approve user status
    public function approve($id){
        $user = User::findOrFail($id);
        $user->update(['status' => 'Approved']);
    }
}
