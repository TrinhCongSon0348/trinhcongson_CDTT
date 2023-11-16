<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Models;

class Rating extends Models
{
    use HasFactory;
    protected $table='Rating'; 

    protected $primaryKey='rating_id';

    public $timestamps=false;

    protected $fillable = [
        'apartment_id',
        'user_id',
        'number_rating',
        'comment'
    ];
}
