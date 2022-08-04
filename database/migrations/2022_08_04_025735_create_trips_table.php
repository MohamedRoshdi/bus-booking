<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTripsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trips', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('bus_id');
            $table->unsignedBigInteger('line_id');
            $table->unsignedBigInteger('start_city_id');
            $table->unsignedBigInteger('end_city_id');

            $table->foreign('bus_id')
                ->references('id')
                ->on('buses');
            $table->foreign('line_id')
                ->references('id')
                ->on('lines');
            $table->foreign('start_city_id')
                ->references('id')
                ->on('cities');
            $table->foreign('end_city_id')
                ->references('id')
                ->on('cities');
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
        Schema::dropIfExists('trips');
    }
}
