<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use Illuminate\Support\Str;

class SliderController extends Controller
{
    //GET:Slider/index
    public function index()
    {
        $sliders = Slider::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'sliders' => $sliders],
            200
        );
    }
    //GET:slider/show
    public function show($id)
    {
        $slider = Slider::find($id);
        if ($slider==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'slider' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'slider' => $slider],
            200
        );
    }
    //POST:slider/store
    public function store(Request $request)
    {
        $slider = new Slider();
        $slider->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->slug . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->sort_order = $request->sort_order; //form
        $category->parent_id = $request->parent_id; //from
        $slider->created_at = date('Y-m-d H:i:s');
        $slider->created_by = 1;
        $slider->status = $request->status; //form
        $slider->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            201
        );
    }
    //POST:slider/update
    public function update(Request $request, $id)
    {
        $slider = Slider::find($id);
        if ($slider==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $slider->name = $request->name; //form
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->slug . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->sort_order = $request->sort_order; //form
        $slider->parent_id = $request->parent_id; //from
        $slider->updated_at = date('Y-m-d H:i:s');
        $slider->updated_by = 1;
        $slider->status = $request->status; //form
        $slider->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            200
        );
    }
    //lay du lieu slider
    public function slider_list($position)
    {
        $args = [
            ['position', '=', $position],
            ['status', '=', 1]
        ];
        $sliders = Slider::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [

                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'sliders' => $sliders
            ],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $slider=Slider::findOrfail($id);
        $slider->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$slider],
        200
        );
    }



}
