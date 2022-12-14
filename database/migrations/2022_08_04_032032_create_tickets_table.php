<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('bus_id');
            $table->unsignedBigInteger('line_id');
            $table->unsignedBigInteger('seat_id');
            $table->unsignedBigInteger('trip_id');

            $table->foreign('bus_id')
                ->references('id')
                ->on('buses');
            $table->foreign('line_id')
                ->references('id')
                ->on('lines');
            $table->foreign('seat_id')
                ->references('id')
                ->on('seats');
            $table->foreign('trip_id')
                ->references('id')
                ->on('trips');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
