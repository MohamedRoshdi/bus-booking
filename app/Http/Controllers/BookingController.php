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

        $trip = Trip::query()
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
        $seatId = $request->seat_id;

        $trip = Trip::query()
            ->where('start_city_id', $request->start_city_id)
            ->where('end_city_id', $request->end_city_id)
            ->first();

        $msg = 'This is no trip exits';
        $ticket = [];
        if ($trip) {
            $lineId = $trip->line_id;

            $ticket = Ticket::create([
                'trip_id' => $trip->id,
                'line_id' => $lineId,
                'seat_id' => $seatId,
                'bus_id' => $trip->bus_id,
            ]);

            $this->reserveTicketsForSubTrips($trip, $seatId);

            if ($ticket)
                $msg = 'Ticket created successfully.';
            else
                $msg = 'Something went wrong.';
        }


        return response()->json([
            'msg' => $msg,
            'ticket' => $ticket
        ]);
    }


    public function reserveTicketsForSubTrips($trip, $seatId = 0)
    {
        $lineId = $trip->line_id;
        $tripId = $trip->id;
        $busId = $trip->bus_id;
        $stopId = Stop::where('line_id', $lineId)->first()->id ?? 0;

        $ticketStops = [];
        $ticketStops[] = [
            'trip_id' => $tripId,
            'line_id' => $lineId,
            'seat_id' => $seatId,
            'bus_id' => $busId,
            'stop_id' => $stopId,
        ];

        foreach ($trip->sub_trips as $subTrip) {
            $ticketStops[] = [
                'trip_id' => $subTrip->sub_trip_id,
                'line_id' => $lineId,
                'seat_id' => $seatId,
                'bus_id' => $busId,
                'stop_id' => $stopId,
            ];
        }

        TicketStop::insert($ticketStops);
    }
}
