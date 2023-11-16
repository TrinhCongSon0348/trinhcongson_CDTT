<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Rating;

class RatingController extends Controller
{
    public function Store(Request $request)
    {
        $validatedData=$request->validate([
            'apartment_id'=>'require|integer',
            'user_id'=>'require|integer',
            'number_rating'=>'require|integer',
            'comment'=>'require|string',
        ]);

        $rating=rating::create($validatedData);

        return response()->json($rating, 201);
    }
    public function getRatings(Request $request)
        {
            $apartmentId=$request->inphut('apartment_id');
            $userId=$request->input('user_id');
            $rating=rating::where('apartment_id', $apartmentId)
            ->where('user_id', $userId)
            ->first();
            $numberOfStars=$rating ? $rating->number_rating:0;
            return response()->json(['number_of_stars'=> $numberOfStars]);
        }
    }

