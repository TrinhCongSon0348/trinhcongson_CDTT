<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Topic;
use Illuminate\Support\Str;

class TopicController extends Controller
{
    //product/index
    public function index()
    {
        $topics = Topic::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'topics' => $topics],
            200
        );
    }
    //GET:topic/show
    public function show($id)
    {
        if (is_numeric($id)){
            $topic = Topic::findOrFail($id);
        }
        else{
            $topic = Topic::where('slug',$id)->first();
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'topic' => $topic],
            200
        );
    }
    //POST:topic/store
    public function store(Request $request)
    {
        $topic = new Topic();
        $topic->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $topic->slug . '.' . $extension;
                $topic->image = $filename;
                $files->move(public_path('images/topic'), $filename);
            }
        }
        // $topic->sort_order = $request->sort_order; //form
        $topic->parent_id = $request->parent_id; //from
        $topic->created_at = date('Y-m-d H:i:s');
        $topic->created_by = 1;
        $topic->status = $request->status; //form
        $topic->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            201
        );
    }
    //POST:topic/update
    public function update(Request $request, $id)
    {
        $topic = Topic::find($id);
        if ($topic==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $topic->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $topic->slug . '.' . $extension;
                $topic->image = $filename;
                $files->move(public_path('images/topic'), $filename);
            }
        }
        $topic->parent_id = $request->parent_id; //from
        $topic->sort_order = $request->sort_order; //form
        $topic->updated_at = date('Y-m-d H:i:s');
        $topic->updated_by = 1;
        $topic->status = $request->status; //form
        $topic->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            200
        );
    }

    //lay du lieu chu de bai viet
    public function topic_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $topics = Topic::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'topics' => $topics
            ],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $topic=Topic::findOrfail($id);
        $topic->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$topic],
        200
        );
    }
}
