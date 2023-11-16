<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    //GET:Category/index
    public function index()
    {
        $categorys = Category::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'categorys' => $categorys],
            200
        );
    }
    //GET:Category/show
    public function show($id)
    {
        if (is_numeric($id)){
            $category = Category::findOrFail($id);
        }
        else{
            $category = Category::where('slug',$id)->first();
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'category' => $category],
            200
        );
    }
    //POST:Category/store
    public function store(Request $request)
    {
        $category = new Category();
        $category->name = $request->name; //form
        $category->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->slug . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        $category->sort_order = $request->sort_order; //form
        $category->metakey = $request->metakey; //form
        $category->metadesc = $request->metadesc; //form
        $category->parent_id = $request->parent_id; //from
        $category->created_at = date('Y-m-d H:i:s');
        $category->created_by = 1;
        $category->status = $request->status; //form
        $category->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $category],
            201
        );
    }
    //POST:Category/update
    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        if ($category==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $category->name = $request->name; //form
        $category->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->slug . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        $category->sort_order = $request->sort_order; //form
        $category->metakey = $request->metakey; //form
        $category->metadesc = $request->metadesc; //form
        $category->parent_id = $request->parent_id; //from
        $category->updated_at = date('Y-m-d H:i:s');
        $category->updated_by = 1;
        $category->status = $request->status; //form
        $category->save(); //Luuu vao CSDL
        return response()->json(
            [
                'success' => true, 
                'message' => 'Thành công', 
                'data' => $category],
            200
        );
    }
    //category
    public function category_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $categorys = Category::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'categorys' => $categorys
            ],
            200
        );
    }



    //DELETE:DESTROY
    public function destroy($id)
    {
        $category=Category::findOrfail($id);
        $category->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$category],
        200
        );
    }
}

