<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateUsersInformationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users_informations', function (Blueprint $table) {
            //$table->dropForeign('room_id')->dropColumn('room_id');
            //$table->integer('room_id')->nullable()->change();
            $table->integer('block_id')->unsigned()->nullable();
            $table->foreign('block_id')->references('id')->on('blocks');
            $table->string('room_number',20);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users_informations', function (Blueprint $table) {
            //
        });
    }
}
