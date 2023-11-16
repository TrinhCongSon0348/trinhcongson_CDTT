<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;
use Illuminate\Support\Str;
class ContactController extends Controller
{
    //GET:contact/index
    public function index()
    {
        $contacts = Contact::all();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'contacts' => $contacts],
            200
        );
    }
    //GET:contact/show
    public function show($id)
    {
        $contact = Contact::find($id);
        if ($contact==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu thành công', 'contact' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'contact' => $contact],
            200
        );
    }
    //POST:contact/store
    public function store(Request $request)
    {
        $contact = new Contact();
        $contact->name = $request->name; //form
        $contact->user_id = $request->user_id; //from
        $contact->replay_id = $request->replay_id; //from
        $contact->created_at = date('Y-m-d H:i:s');
        $contact->created_by = 1;
        $contact->status = $request->status; //form
        $contact->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            201
        );
    }
    //POST:contact/update
    public function update(Request $request, $id)
    {
        $contact = Contact::find($id);
        if ($contact==null){
            return response()->json(
                ['message' =>'Tai du lieu thanh cong', 'success'=> false, 'data'=>null],
                404
            );
        }
        $contact->name = $request->name; //form
        $contact->user_id = $request->user_id; //from
        $contact->replay_id = $request->replay_id; //from
        $contact->email = $request->email;
        $contact->phone = $request->phone;
        $contact->updated_at = date('Y-m-d H:i:s');
        $contact->updated_by = 1;
        $contact->status = $request->status; //form
        $contact->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            200
        );
    }
    //DELETE:DESTROY
    public function destroy($id)
    {
        $contact=Contact::findOrfail($id);
        $contact->delete();
        return response()->json(
            ['message' =>'Xóa dữ liệu thành công', 'success'=> true, 'data'=>$contact],
        200
        );
    }
}
