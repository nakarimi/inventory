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

    public function home(Request $request){
        return 'API CONNECED';
    }
    public function user(Request $request)
    {
        $user = $request->user();
        $user['branch_id'] = Branch::find($user->branch_id);
        // $user['permission_keys'] = $user->permissions->pluck('id')->toArray();
        return $user;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::with('branch')->get();
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
        $this->validate($request,[
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
        return User::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
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
        DB::beginTransaction();
        try {
            $photoname = NULL;
            if ($request->image != null) {
                if (strpos($request->image, 'base64')) {
                    $photoname = time() . '.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                    \Image::make($request->image)->save(public_path('img/user/') . $photoname);
                    $request->merge(['photo' => $photoname]);
                } else {
                    $photoname = $request->image;
                }
            }


            $user = User::findOrFail($id);
            $request['password'] =  Hash::make($request['password']);
            $request['image'] =  ($photoname) ? $photoname : '';
            $user->update($request->all());
            // if($request->userleaders != null){
            //     foreach ($request->userleaders as $key => $val) {
            //         if(!UserAssignment::where(['lead_user_id' => $val['id'], 'user_id'=> $id])->get()){
            //             UserAssignment::create(['lead_user_id' => $val['id'], 'user_id'=> $id]);
            //         }
            //     }
            // }
            DB::commit();
            return ["message" => "موفقانه معلومات اصلاح شد"];
        } catch (\Exception $e) {
            DB::rollback();
            return Response::json($e, 400);
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
}
