<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Support\Str;

class BrandController extends Controller
{
    //GET:brand/index
    public function index()
    {
        $brands = Brand::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'brands' => $brands],
            200
        );
    }
    //GET:brand/show
    public function show($id)
    {
        //note
        if (is_numeric($id)){
            $brand = Brand::findOrFail($id);
        }
        else{
            $brand = Brand::where('slug',$id)->first();
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'brand' => $brand],
            200
        );
    }
    //POST:brand/store
    public function store(Request $request)
    {
        $brand = new Brand();
        if ($brand==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $brand->name = $request->name; //form
        $brand->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $brand->slug . '.' . $extension;
                $brand->image = $filename;
                $files->move(public_path('images/brand'), $filename);
            }
        }
        $brand->parent_id = $request->parent_id; //from
        $brand->sort_order = $request->sort_order; //form
        $brand->metakey = $request->metakey; //form
        $brand->metadesc = $request->metadesc; //form
        $brand->created_at = date('Y-m-d H:i:s');
        $brand->created_by = 1;
        $brand->status = $request->status; //form
        $brand->save(); //Luuu vao CSDL
        return response()->json(
            [
                'success' => true, 
                'message' => 'Thành công', 
                'data' => $brand
            ],
            201
        );
    }

    //POST:brand/update
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);
        if ($brand==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $brand->name = $request->name; //form
        $brand->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $brand->slug . '.' . $extension;
                $brand->image = $filename;
                $files->move(public_path('images/brand'), $filename);
            }
        }
        $brand->parent_id = $request->parent_id; //from
        $brand->sort_order = $request->sort_order; //form
        $brand->metakey = $request->metakey; //form
        $brand->metadesc = $request->metadesc; //form
        $brand->updated_at = date('Y-m-d H:i:s');
        $brand->updated_by = 1;
        $brand->status = $request->status; //form
        $brand->save(); //Luuu vao CSDL
        return response()->json(
            [
                'success' => true, 
                'message' => 'Thành công', 
                'data' => $brand
            ],
            200
        );
    }

    //barnd
    public function brand_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $brands = Brand::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'brands' => $brands
            ],
            200
        );
    }

    //DELETE:DESTROY
    public function destroy($id)
    {
        $brand=Brand::findOrfail($id);
        $brand->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$brand],
        200
        );
    }
}
