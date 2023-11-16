<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    //
    function register(Request $req)
    {
        $user=new User;
        $user->name=$req->input('name');
        $user->email=$req->input('email');
        $user->password=Hash::make($req->input('password'));
        $user->save();
        return $user;
    }
    //product/index
    public function index()
    {
        $users = User::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'users' => $users],
            200
        );
    }
    //GET:user/show
    public function show($id)
    {
        $user = User::find($id);
        if ($user==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'user' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'user' => $user],
            200
        );
    }
    //POST:user/store
    public function store(Request $request)
    {
        $user = new User();
        $user->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->slug . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->created_at = date('Y-m-d H:i:s');
        $user->created_by = 1;
        $user->status = $request->status; //form
        $user->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            201
        );
    }
    //POST:user/update
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if ($user==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $user->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->slug . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->updated_at = date('Y-m-d H:i:s');
        $user->updated_by = 1;
        $user->status = $request->status; //form
        $user->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $user=User::findOrfail($id);
        $user->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$user],
        200
        );
    }
}
