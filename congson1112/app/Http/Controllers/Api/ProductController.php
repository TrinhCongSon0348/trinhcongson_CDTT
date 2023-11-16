<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    //product/index
    public function index()
    {
        $products = Product::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'products' => $products],
            200
        );
    }
    //GET:Product/show
    // public function show($id)
    // {
    //     $product = Product::find($id);
    //     if ($product==null){
    //         return response()->json(
    //             ['success' => false, 'message' => 'Tải dữ liệu thành công', 'product' => null],
    //             404
    //         );
    //     }
    //     return response()->json(
    //         ['success' => true, 'message' => 'Tải dữ liệu thành công', 'product' => $product],
    //         200
    //     );
    // }
    public function show($id)
    {
        //note
        if (is_numeric($id)){
            $product = Product::findOrFail($id);
        }
        else{
            $product = Product::where('slug',$id)->first();
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'product' => $product],
            200
        );
    }
    //POST:Product/store
    public function store(Request $request)
    {
        $product = new Product();
        $product->name = $request->name; //form
        $product->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $product->slug . '.' . $extension;
                $product->image = $filename;
                $files->move(public_path('images/product'), $filename);
            }
        }
        $product->metakey = $request->metakey; //form
        $product->metadesc = $request->metadesc; //form
        $product->category_id = $request->category_id; //from
        $product->brand_id = $request->brand_id; //from
        $product->created_at = date('Y-m-d H:i:s');
        $product->created_by = 1;
        $product->status = $request->status; //form
        $product->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'product' => $product],
            201
        );
    }
    //POST:product/update
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        if ($product==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $product->name = $request->name; //form
        $product->slug = Str::of($request->name)->slug('-');
        //upload image
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $product->slug . '.' . $extension;
                $product->image = $filename;
                $files->move(public_path('images/product'), $filename);
            }
        }
        // $product->sort_order = $request->sort_order; //form
        $product->metakey = $request->metakey; //form
        $product->metadesc = $request->metadesc; //form
        $product->category_id = $request->category_id; //from
        $product->brand_id = $request->brand_id; //from
        $product->updated_at = date('Y-m-d H:i:s');
        $product->updated_by = 1;
        $product->status = $request->status; //form
        $product->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $product],
            200
        );
    }
    //lay du lieu sp(product_home)
    public function product_home($limit, $category_id = 0)
    {
        $listid = array();
        array_push($listid, $category_id + 0);
        $args_cat1 = [
            ['parent_id', '=', $category_id + 0],
            ['status', '=', 1]
        ];
        $list_category1 = Category::where($args_cat1)->get();
        if (count($list_category1) > 0) {
            foreach ($list_category1 as $row1) {
                array_push($listid, $row1->id);
                $args_cat2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_category2 = Category::where($args_cat2)->get();
                if (count($list_category2) > 0) {
                    foreach ($list_category2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $products = Product::where('status', '=', 1)
            ->whereIn('category_id', $listid)
            ->orderBy('created_at', 'DESC')->limit($limit)->get();
        if(count($products))
        {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'products' => $products
                ],
                200
            );
        }
        else{
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Tải dữ liệu không thành công',
                    'products' => null
                ],
                200
            );
        }
    }

    //lay tat ca sp co phan trang
    public function product_all($limit, $page = 1)
    {
        $offset = ($page - 1) * $limit;
        $products = Product::where('status', 1)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }

    //lay tat ca sp theo loai co phan trang
    public function product_category($limit, $category_id, $page = 1)
    {
        $listid = array();
        array_push($listid, $category_id + 0);
        $args_cat1 = [
            ['parent_id', '=', $category_id + 0],
            ['status', '=', 1]
        ];
        $list_category1 = Category::where($args_cat1)->get();
        if (count($list_category1) > 0) {
            foreach ($list_category1 as $row1) {
                array_push($listid, $row1->id);
                $args_cat2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_category2 = Category::where($args_cat2)->get();
                if (count($list_category2) > 0) {
                    foreach ($list_category2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $offset = ($page - 1) * $limit;
        $products = Product::where('status', 1)
            ->whereIn('category_id', $listid)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    //lay tat ca sp theo thuong hieu co phan trang
    public function product_brand($limit, $brand_id, $page = 1)
    {
        $listid = array();
        array_push($listid, $brand_id + 0);
        $args_bra1 = [
            ['parent_id', '=', $brand_id + 0],
            ['status', '=', 1]
        ];
        $list_brand1 = Brand::where($args_bra1)->get();
        if (count($list_brand1) > 0) {
            foreach ($list_brand1 as $row1) {
                array_push($listid, $row1->id);
                $args_bra2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_brand2 = Brand::where($args_bra2)->get();
                if (count($list_brand2) > 0) {
                    foreach ($list_brand2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        //
        $offset = ($page - 1) * $limit;
        $products = Product::where('status', 1)
            ->whereIn('brand_id', $listid)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    //chi tiet san pham
    public function product_detail($slug)
    {
        $product=Product::where([['slug','=',$slug],['status','=',1]])->first();
        if($product==null)
        {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không tìm thấy dữ liệu',
                    'product' => null
                ],
               404
            );
        }
        $listid = array();
        array_push($listid, $product->category_id);
        $args_cat1 = [
            ['parent_id', '=', $product->category_id],
            ['status', '=', 1]
        ];
        $list_category1 = Category::where($args_cat1)->get();
        if (count($list_category1) > 0) {
            foreach ($list_category1 as $row1) {
                array_push($listid, $row1->id);
                $args_cat2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_category2 = Category::where($args_cat2)->get();
                if (count($list_category2) > 0) {
                    foreach ($list_category2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $product_other=Product::where([['id','!=',$product->id],['status','=',1]])
        ->whereIn('category_id',$listid)
        ->orderBy('created_at','DESC')
        ->limit(8)
        ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'product' => $product,
                'product_other'=>$product_other,
            ],
            200
        );
    }
    //san pham moi nhat    
    function product_list($type, $limit)
    {
        $args = [
            ['type', '=', $type],
            ['status', '=', 1]
        ];
        $products = Product::where($args)
            ->orderBy('created_at', 'DESC')
            > limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $product=Product::findOrfail($id);
        $product->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$product],
        200
        );
    }
}
