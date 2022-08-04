<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketStop extends Model
{
    use HasFactory;

    protected $table = 'tickets_stops';

    protected $fillable = ['trip_id', 'line_id', 'seat_id', 'bus_id', 'stop_id'];
}
