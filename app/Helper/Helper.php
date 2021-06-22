<?php

namespace App\Helper;

use App\Models;
use Carbon\Carbon;
use App\Models\User;
use App\Models\StockRecord;
use App\Models\Transaction;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class Helper
{
    public static function get_id(&$request, $field)
    {
        $request[$field] = (isset($request[$field]) && $request[$field] != null) ? $request[$field]['id'] : null;
    }

    // General function to store multiple items recored for the created entity.
    public static function store_items($type, $type_id, $request, $in = false)
    {
        StockRecord::where('type', $type)->where('type_id', $type_id)->delete();
        DB::table('item_records')->where('type', $type)->where('type_id', $type_id)->delete();
        foreach ($request->items as $key => $item) {
            $item['type'] = $type;
            $item['type_id'] = $type_id;
            if ($in) {
                $item['increment'] = $item['amount'];
                $item['decrement'] = 0;
            } else {
                $item['decrement'] = $item['amount'];
                $item['increment'] = 0;
            }
            Helper::get_id($item, 'unit_id');
            Helper::get_id($item, 'category_id');
            Helper::get_id($item, 'item_id');
            $item['stock_id'] = $request['stock_id'];
            $item['product_id'] = $item['item_id'];
            $item['user_id'] = $request['user_id'];

            $result = StockRecord::create($item);
        }
    }

    public static function store_fix_items($type, $type_id, $request, $in = false)
    {
        DB::table('item_records')->where('type', $type)->where('type_id', $type_id)->delete();
        StockRecord::where('type', $type)->where('type_id', $type_id)->delete();
        foreach ($request->fix_items as $key => $item) {
            $item['type'] = $type;
            $item['type_id'] = $type_id;
            if ($in) {
                $item['increment'] = $item['amount'];
                $item['decrement'] = 0;
            } else {
                $item['decrement'] = $item['amount'];
                $item['increment'] = 0;
            }
            unset($item['amount']);
            $item['stock_id'] = $request->stock_id;
            $item['user_id'] = $request->user_id;
            $result = DB::table('item_records')->insert($item);
        }
    }
    public static function do_transaction($data, $update = false)
    {
        if ($update) {
            $trans = Transaction::where('type', $data['type'])
                ->where('type_id', $data['type_id'])->update([
                    'status' => 'rejected'
                ]);
            $trs = Transaction::create($data);
        } else {
            $trs = Transaction::create($data);
        }
        // Log this activity to the system by user and entity data.
        activity()
            ->causedBy(auth()->guard('api')->user())
            ->performedOn($trs)
            ->withProperties($trs)
            ->log('Created');
    }

    // Get users ids where branch id is same as logged in user branch.
    public static function sameBranchUsers()
    {
        return User::where('branch_id', auth()->guard('api')->user()->branch_id)->pluck('id')->toArray();
    }

    public static function file_upload_update(&$request, $field, $entity, $entity_name)
    {
        $photoname = NULL;
        if ($request->image != null && strpos($request->image, ';base64,')) {
            $photoname = time() . '.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            \Image::make($request->image)->save(public_path('img/' . $entity_name . '/') . $photoname);
            $request->merge([$field => $photoname]);
        } else {
            $request[$field] = $entity->getOriginal($field);
        }
    }
    public static function notifyStatus($id, $status){
        DB::table('notifs')->where('id', $id)->update(['status' => $status]);
    }
    public static function notify($msg, $action, $type, $type_id, $color = 'primary')
    {
        $data = [
            'action' => $action,
            'msg' => $msg,
            'color' => $color,
            'type' => $type,
            'type_id' => $type_id,
            'user_id' => auth()->guard('api')->user()->id,
            'branch_id' => auth()->guard('api')->user()->branch_id,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ];
        $result = DB::table('notifs')->insert($data);
    }

    public static function getUser($id){
        $user = User::find($id);
        return $user->first_name . ' ' . $user->last_name;
    }
    public static function findUnit($id){
        switch ($id) {
            case 1:
                return 'KG';
                break;
            case 2:
                return 'Gram';
                break;            
            case 3:
                return 'Liter';
                break;
            case 3:
                return 'Pack';
                break;
            default:
                return '';
                break;
        }
    }
}
