<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Line extends Model
{
    use HasFactory;

    public function stop_station(){
        return $this->hasMany(Line::class);
    }

//    public function all_station_in_way(){
//        return $this->station_stop()->with('all_station_in_way');
//    }
}
