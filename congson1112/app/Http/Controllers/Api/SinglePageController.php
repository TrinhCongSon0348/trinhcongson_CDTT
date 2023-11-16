<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SinglePage;
use Illuminate\Support\Str;

class SinglePageController extends Controller
{
    //singlepage/index
    public function index()
    {
        $singlepages = SinglePage::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'singlepages' => $singlepages],
            200
        );
    }
    //GET:singlepage/show
    public function show($id)
    {
        $singlepage = SinglePage::find($id);
        if ($singlepage==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'singlepage' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'singlepage' => $singlepage],
            200
        );
    }
    //singlepage:singlepage/store
    public function store(Request $request)
    {
        $singlepage = new SinglePage();
        $singlepage->title = $request->title; //form
        $singlepage->slug = Str::of($request->title)->slug('-');
        $singlepage->replay_id = $request->replay_id; //from
        $singlepage->topic_id = $request->topic_id; //from
        $singlepage->created_at = date('Y-m-d H:i:s');
        $singlepage->created_by = 1;
        $singlepage->status = $request->status; //form
        $singlepage->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $singlepage],
            201
        );
    }
    //singlepage:singlepage/update
    public function update(Request $request, $id)
    {
        $singlepage = SinglePage::find($id);
        if ($singlepage==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $singlepage->title = $request->title; //form
        $singlepage->slug = Str::of($request->title)->slug('-');
        $singlepage->replay_id = $request->replay_id; //from
        $singlepage->topic_id = $request->topic_id; //from
        $singlepage->updated_at = date('Y-m-d H:i:s');
        $singlepage->updated_by = 1;
        $singlepage->status = $request->status; //form
        $singlepage->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $singlepage],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $singlepage=SinglePage::findOrfail($id);
        $singlepage->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$singlepage],
        200
        );
    }

}
