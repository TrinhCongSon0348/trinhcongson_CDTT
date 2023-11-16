<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Topic;
use Illuminate\Support\Str;

class PostController extends Controller
{
    //post/index
    public function index()
    {
        $posts = Post::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'posts' => $posts],
            200
        );
    }
    //GET:post/show
    public function show($id)
    {
        $post = Post::find($id);
        if ($post==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'post' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'post' => $post],
            200
        );
    }
    //POST:post/store
    public function store(Request $request)
    {
        $post = new Post();
        $post->title = $request->title; //form
        $post->slug = Str::of($request->title)->slug('-');
        $post->replay_id = $request->replay_id; //from
        $post->topic_id = $request->topic_id; //from
        $post->sort_order = $request->sort_order; //form
        $post->created_at = date('Y-m-d H:i:s');
        $post->created_by = 1;
        $post->status = $request->status; //form
        $post->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            201
        );
    }
    //POST:post/update
    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        if ($post==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $post->title = $request->title; //form
        $post->slug = Str::of($request->title)->slug('-');
        $post->replay_id = $request->replay_id; //from
        $post->topic_id = $request->topic_id; //from
        $post->sort_order = $request->sort_order; //form
        $post->updated_at = date('Y-m-d H:i:s');
        $post->updated_by = 1;
        $post->status = $request->status; //form
        $post->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            200
        );
    }

    //lay tat ca bai viet co phan trang
    public function post_all($limit, $page = 1)
    {
        $offset = ($page - 1) * $limit;
        $posts = Post::where('status', 1)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }
    
    //lay tat ca bai viet theo chu de co phan trang
    public function post_topic($limit, $topic_id, $page = 1)
    {
        $listid = array();
        array_push($listid, $topic_id + 0);
        $args_top1 = [
            ['parent_id', '=', $topic_id + 0],
            ['status', '=', 1]
        ];
        $list_topic1 = Topic::where($args_top1)->get();
        if (count($list_topic1) > 0) {
            foreach ($list_topic1 as $row1) {
                array_push($listid, $row1->id);
                $args_top2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_topic2 = Topic::where($args_top2)->get();
                if (count($list_topic2) > 0) {
                    foreach ($list_topic2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $offset = ($page - 1) * $limit;
        $posts = Post::where('status', 1)
            ->whereIn('topic_id', $listid)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }
    //bai viet moi nhat    
    function post_list($type, $limit)
    {
        $args = [
            ['type', '=', $type],
            ['status', '=', 1]
        ];
        $posts = Post::where($args)
            ->orderBy('created_at', 'DESC')
            -> limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }
    //chi tiet bai viet
    public function post_detail($slug)
    {
        $post=Post::where([['slug','=',$slug],['status','=',1]])->first();
        if($post==null)
        {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không tìm thấy dữ liệu',
                    'post' => null
                ],
               404
            );
        }
        $listid = array();
        array_push($listid, $post->topic_id);
        $args_top1 = [
            ['parent_id', '=', $post->topic_id],
            ['status', '=', 1]
        ];
        $list_topic1 = Topic::where($args_top1)->get();
        if (count($list_topic1) > 0) {
            foreach ($list_topic1 as $row1) {
                array_push($listid, $row1->id);
                $args_top2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_topic2 = Topic::where($args_top2)->get();
                if (count($list_topic2) > 0) {
                    foreach ($list_topic2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $post_other=Post::where([['id','!=',$post->id],['status','=',1]])
        ->whereIn('topic_id',$listid)
        ->orderBy('created_at','DESC')
        ->limit(8)
        ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'post' => $post,
                'post_other'=>$post_other,
            ],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $post=Post::findOrfail($id);
        $post->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$post],
        200
        );
    }

}
