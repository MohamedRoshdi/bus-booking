<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Bus;
use App\Models\Line;
use App\Models\Seat;
use App\Models\Stop;
use App\Models\Ticket;
use App\Models\TicketStop;
use App\Models\Trip;
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
        $msg = 'Here is the available seats for your trip.';

        $trip = Trip::join('lines', 'trips.line_id', '=', 'lines.id')
            ->where('start_city_id', $request->start_city_id)
            ->where('end_city_id', $request->end_city_id)
            ->first();

        if ($trip) {
            $data = DB::table('stops')
                ->crossJoin('seats')
                ->where('stops.line_id', $trip->line_id)
                ->where('seats.bus_id', $trip->bus_id)
                ->whereNotExists(function ($query) use ($trip) {
                    $query->select(DB::raw('*'))
                        ->from('tickets_stops')
                        ->where('tickets_stops.LINE_ID', $trip->line_id)
                        ->where('tickets_stops.BUS_ID', $trip->bus_id)
                        ->where('tickets_stops.TRIP_ID', $trip->id)
                        ->whereRaw("tickets_stops.SEAT_ID = seats.ID AND tickets_stops.STOP_ID = stops.ID");
                })->get();
        } else {
            $msg = 'There is no trip for these cities.';
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
        $seat = Seat::findOrFail($request->seat_id);
        $busId = $seat->bus_id ?? 0;

        $ticket = Ticket::create([
            'line_id' => $request->line_id,
            'seat_id' => $request->seat_id,
            'bus_id' => $busId,
        ]);

//        $this->reserveTicketsForAllCitiesInBetween($line, $busId, $seat->id, $stopId);
//        TicketStop::create([
//            'line_id' => $line->id,
//            'seat_id' => $seat->id,
//            'bus_id' => $busId,
//            'stop_id' => $stopId,
//        ]);
        if ($ticket)
            $msg = 'Ticket created successfully.';
        else
            $msg = 'Something went wrong.';

        return response()->json([
            'msg' => $msg,
            'ticket' => $ticket
        ]);
    }


    public function reserveTicketsForAllCitiesInBetween($line, $busId = 0, $seatId = 0, $stopId = 0)
    {
        foreach ($line->stop_station as $station) {
            $this->reserveTicketsForAllCitiesInBetween($station, $busId, $seatId, $stopId);

            TicketStop::create([
                'line_id' => $line->id,
                'seat_id' => $seatId,
                'bus_id' => $busId,
                'stop_id' => $stopId,
            ]);
        }
    }
}
