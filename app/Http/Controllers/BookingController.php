<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{
    /**
     * Return list of available seats
     *
     * @return \Illuminate\Http\Response
     */
    public function getAvailableSeats(Request $request)
    {
        $data = [];
        $msg = 'Here is the available seats for your trip';

        $line = DB::table('lines')
            ->where('start_city_id', $request->start_city_id)
            ->where('end_city_id', $request->end_city_id)
            ->first();
        if ($line) {
            $data = DB::table('stops')
                ->crossJoin('seats')
                ->where('stops.line_id', $line->id)
                ->where('seats.bus_id', $line->bus_id)
                ->whereNotExists(function ($query) use ($line){
                    $query->select(DB::raw('*'))
                        ->from('tickets_stops')
                        ->where('tickets_stops.LINE_ID', $line->id)
                        ->where('tickets_stops.BUS_ID', $line->bus_id)
                        ->whereRaw("tickets_stops.SEAT_ID = seats.ID AND tickets_stops.STOP_ID = stops.ID");
                })->get();
        } else {
            $msg = 'There is no line for these cities';
        }

        return response()->json([
            'msg' => $msg,
            'data' => $data
        ]);
    }

    /**
     * Booking a seat in the bus.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function bookSeat(Request $request)
    {
        return 'booked';
    }
}
