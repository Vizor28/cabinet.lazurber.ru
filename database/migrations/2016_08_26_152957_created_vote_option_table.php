<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatedVoteOptionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vote_option', function (Blueprint $table) {
            $table->integer('vote_id')->unsigned();
            $table->foreign('vote_id')->references('id')->on('votes');
            $table->integer('option_id')->unsigned();
            $table->foreign('option_id')->references('id')->on('options');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('vote_option');
    }
}
