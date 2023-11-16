<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Menu;
use Illuminate\Support\Str;

class MenuController extends Controller
{
    //GET:menu/index
    public function index()
    {
        $menus = Menu::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'menus' => $menus],
            200
        );
    }
    //GET:menu/show
    public function show($id)
    {
        $menu = Menu::find($id);
        if ($menu==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'menu' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'menu' => $menu],
            200
        );
    }
    //POST:menu/store
    public function store(Request $request)
    {
        $menu = new Menu();
        $menu->name = $request->name; //form
        $menu->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $menu->slug . '.' . $extension;
                $menu->image = $filename;
                $files->move(public_path('images/menu'), $filename);
            }
        }
        //
        $menu->sort_order = $request->sort_order; //form
        $menu->metakey = $request->metakey; //form
        $menu->metadesc = $request->metadesc; //form
        $menu->created_at = date('Y-m-d H:i:s');
        $menu->created_by = 1;
        $menu->status = $request->status; //form
        $menu->save(); //Luuu vao CSDL
        return response()->json(
            [
                'success' => true, 
                'message' => 'Thành công', 
                'menu' => $menu
            ],
            201
        );
    }

    //POST:menu/update
    public function update(Request $request, $id)
    {
        $menu = Menu::find($id);
        $menu->name = $request->name; //form
        $menu->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $menu->slug . '.' . $extension;
                $menu->image = $filename;
                $files->move(public_path('images/menu'), $filename);
            }
        }
        //
        $menu->sort_order = $request->sort_order; //form
        $menu->metakey = $request->metakey; //form
        $menu->metadesc = $request->metadesc; //form
        $menu->updated_at = date('Y-m-d H:i:s');
        $menu->updated_by = 1;
        $menu->status = $request->status; //form
        $menu->save(); //Luuu vao CSDL
        return response()->json(
            [
                'success' => true, 
                'message' => 'Thành công', 
                'menu' => $menu
            ],
            200
        );
    }

    public function menu_list($position, $parent_id = 0)
    {
        $args = [
            ['position', '=', $position],
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $menus = Menu::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        // return response()->json(
        //     [
        //         'success' => true,
        //         'message' => 'Tải dữ liệu thành công',
        //         'menus' => $menus
        //     ],
        //     200
        // );
        if(count($menus))
        {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'menus' => $menus
                ],
                200
            );
        }else {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'khong co du lieu',
                    'menus' => null
                ],
                200
            );
        }
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $menu=Menu::findOrfail($id);
        $menu->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$menu],
        200
        );
    }
}
