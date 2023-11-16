<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Member;
use Illuminate\Support\Str;

class MemberController extends Controller
{
    //member/index
    public function index()
    {
        $members = Member::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'members' => $members],
            200
        );
    }
    //GET:member/show
    public function show($id)
    {
        $member = Member::find($id);
        if ($member==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'member' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'member' => $member],
            200
        );
    }
    //member:member/store
    public function store(Request $request)
    {
        $member = new Member();
        $member->title = $request->title; //form
        $member->slug = Str::of($request->title)->slug('-');
        $member->replay_id = $request->replay_id; //from
        $member->topic_id = $request->topic_id; //from
        $brand->parent_id = $request->parent_id; //from
        $brand->sort_order = $request->sort_order; //form
        $member->created_at = date('Y-m-d H:i:s');
        $member->created_by = 1;
        $member->status = $request->status; //form
        $member->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $member],
            201
        );
    }
    //member:member/update
    public function update(Request $request, $id)
    {
        $member = Member::find($id);
        if ($member==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $member->title = $request->title; //form
        $member->slug = Str::of($request->title)->slug('-');
        $member->replay_id = $request->replay_id; //from
        $member->topic_id = $request->topic_id; //from
        $brand->parent_id = $request->parent_id; //from
        $brand->sort_order = $request->sort_order; //form
        $member->updated_at = date('Y-m-d H:i:s');
        $member->updated_by = 1;
        $member->status = $request->status; //form
        $member->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $member],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $member=Member::findOrfail($id);
        $member->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$member],
        200
        );
    }

}

