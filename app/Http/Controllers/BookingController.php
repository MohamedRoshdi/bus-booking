<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    /**
     * Return list of available seats
     *
     * @return \Illuminate\Http\Response
     */
    public function getAvailableSeats()
    {
        return [1, 2, 3];
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
