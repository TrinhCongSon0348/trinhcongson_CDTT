<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostDetail;
use Illuminate\Support\Str;

class PostDetailController extends Controller
{
    //postdetail/index
    public function index()
    {
        $postdetails = PostDetail::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'postdetails' => $postdetails],
            200
        );
    }
    //GET:postdetail/show
    public function show($id)
    {
        $postdetail = PostDetail::find($id);
        if ($postdetail==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'postdetail' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'postdetail' => $postdetail],
            200
        );
    }
    //postdetail:postdetail/store
    public function store(Request $request)
    {
        $postdetail = new PostDetail();
        $postdetail->title = $request->title; //form
        $postdetail->slug = Str::of($request->title)->slug('-');
        $postdetail->replay_id = $request->replay_id; //from
        $postdetail->topic_id = $request->topic_id; //from
        $postdetail->created_at = date('Y-m-d H:i:s');
        $postdetail->created_by = 1;
        $postdetail->status = $request->status; //form
        $postdetail->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $postdetail],
            201
        );
    }
    //postdetail:postdetail/update
    public function update(Request $request, $id)
    {
        $postdetail = PostDetail::find($id);
        if ($postdetail==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $postdetail->title = $request->title; //form
        $postdetail->slug = Str::of($request->title)->slug('-');
        $postdetail->replay_id = $request->replay_id; //from
        $postdetail->topic_id = $request->topic_id; //from
        $postdetail->updated_at = date('Y-m-d H:i:s');
        $postdetail->updated_by = 1;
        $postdetail->status = $request->status; //form
        $postdetail->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $postdetail],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $postdetail=PostDetail::findOrfail($id);
        $postdetail->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$postdetail],
        200
        );
    }

}

