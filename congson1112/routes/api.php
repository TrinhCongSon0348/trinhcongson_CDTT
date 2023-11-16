<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;	
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\TopicController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\MemberController;
use App\Http\Controllers\Api\SinglePageController;
use App\Http\Controllers\Api\PostDetailController;


Route::get('menu_list/{position}/{parent_id?}',[MenuController::class, 'menu_list']);
Route::get('slider_list/{position}',[SliderController::class, 'slider_list']);
Route::get('category_list/{parent_id?}',[CategoryController::class, 'category_list']);
Route::get('topic_list/{parent_id?}',[TopicController::class, 'topic_list']);
Route::get('post_list/{type}/{limit}',[PostController::class, 'post_list']);
Route::get('post_all/{limit}/{page?}', [PostController::class, 'post_all']);
Route::get('post_topic/{topic_id}/{limit}/{page?}', [PostController::class, 'post_topic']);
Route::get('post_detail/{slug}',[PostController::class, 'post_detail']);
Route::get('post_other/{slug}/{limit}', [PostController::class, 'post_other']);
Route::get('product_home/{limit}/{category_id?}',[ProductController::class, 'product_home']);
Route::get('product_all/{limit}/{page?}',[ProductController::class, 'product_all']);
Route::get('product_category/{category_id}/{limit}/{page?}',[ProductController::class, 'product_category']);
Route::get('product_brand/{brand_id}/{limit}/{page?}',[ProductController::class, 'product_brand']);
Route::get('product_detail/{slug}',[ProductController::class, 'product_detail']);
Route::get('product_list/{type}/{limit}',[ProductController::class, 'product_list']);

Route::prefix('brand')->group(function(){
    Route::get('index', [BrandController::class, 'index']);
    Route::get('show/{id}', [BrandController::class, 'show']);
    Route::post('store', [BrandController::class, 'store']);
    Route::post('update/{id}', [BrandController::class, 'update']);
    Route::delete('destroy/{id}', [BrandController::class, 'destroy']);
});

Route::prefix('category')->group(function(){
    Route::get('index', [CategoryController::class, 'index']);
    Route::get('show/{id}', [CategoryController::class, 'show']);
    Route::post('store', [CategoryController::class, 'store']);
    Route::post('update/{id}', [CategoryController::class, 'update']);
    Route::delete('destroy/{id}', [CategoryController::class, 'destroy']);
});
Route::prefix('contact')->group(function () {
    Route::get('index', [ContactController::class, 'index']);
    Route::get('show/{id}', [ContactController::class, 'show']);
    Route::post('store', [ContactController::class, 'store']);
    Route::post('update/{id}', [ContactController::class, 'update']);
    Route::delete('destroy/{id}', [ContactController::class, 'destroy']);
});
Route::prefix('menu')->group(function () {
    Route::get('index', [MenuController::class, 'index']);
    Route::get('show/{id}', [MenuController::class, 'show']);
    Route::post('store', [MenuController::class, 'store']);
    Route::post('update/{id}', [MenuController::class, 'update']);
    Route::delete('destroy/{id}', [MenuController::class, 'destroy']);
});
Route::prefix('order')->group(function () {
    Route::get('index', [OrderController::class, 'index']);
    Route::get('show/{id}', [OrderController::class, 'show']);
    Route::post('store', [OrderController::class, 'store']);
    Route::post('update/{id}', [OrderController::class, 'update']);
    Route::delete('destroy/{id}', [OrderController::class, 'destroy']);
});
Route::prefix('post')->group(function () {
    Route::get('index', [PostController::class, 'index']);
    Route::get('show/{id}', [PostController::class, 'show']);
    Route::post('store', [PostController::class, 'store']);
    Route::post('update/{id}', [PostController::class, 'update']);
    Route::delete('destroy/{id}', [PostController::class, 'destroy']);
});
Route::prefix('product')->group(function () {
    Route::get('index', [ProductController::class, 'index']);
    Route::get('show/{id}', [ProductController::class, 'show']);
    Route::post('store', [ProductController::class, 'store']);
    Route::post('update/{id}', [ProductController::class, 'update']);
    Route::delete('destroy/{id}', [ProductController::class, 'destroy']);
});
Route::prefix('slider')->group(function () {
    Route::get('index', [SliderController::class, 'index']);
    Route::get('show/{id}', [SliderController::class, 'show']);
    Route::post('store', [SliderController::class, 'store']);
    Route::post('update/{id}', [SliderController::class, 'update']);
    Route::delete('destroy/{id}', [SliderController::class, 'destroy']);
});
Route::prefix('topic')->group(function () {
    Route::get('index', [TopicController::class, 'index']);
    Route::get('show/{id}', [TopicController::class, 'show']);
    Route::post('store', [TopicController::class, 'store']);
    Route::post('update/{id}', [TopicController::class, 'update']);
    Route::delete('destroy/{id}', [TopicController::class, 'destroy']);
});

Route::prefix('user')->group(function () {
    Route::post('/register',[UserController::class,'register']);
    Route::get('index', [UserController::class, 'index']);
    Route::get('show/{id}', [UserController::class, 'show']);
    Route::post('store', [UserController::class, 'store']);
    Route::post('update/{id}', [UserController::class, 'update']);
    Route::delete('destroy/{id}', [UserController::class, 'destroy']);
});

Route::prefix('member')->group(function () {
    Route::get('index', [MemberController::class, 'index']);
    Route::get('show/{id}', [MemberController::class, 'show']);
    Route::post('store', [MemberController::class, 'store']);
    Route::post('update/{id}', [MemberController::class, 'update']);
    Route::delete('destroy/{id}', [MemberController::class, 'destroy']);
});

Route::prefix('postdetail')->group(function () {
    Route::get('index', [PostDetailController::class, 'index']);
    Route::get('show/{id}', [PostDetailController::class, 'show']);
    Route::post('store', [PostDetailController::class, 'store']);
    Route::post('update/{id}', [PostDetailController::class, 'update']);
    Route::delete('destroy/{id}', [PostDetailController::class, 'destroy']);
});

Route::prefix('singlepage')->group(function () {
    Route::get('index', [SinglePageController::class, 'index']);
    Route::get('show/{id}', [SinglePageController::class, 'show']);
    Route::post('store', [SinglePageController::class, 'store']);
    Route::post('update/{id}', [SinglePageController::class, 'update']);
    Route::delete('destroy/{id}', [SinglePageController::class, 'destroy']);
});

//Rating Star
Route::post('/rating',[App\Http\Controllers\RatingController::class, 'store']);
Route::get('/rating',[App\Http\Controllers\RatingController::class, 'getRating']);
