<?php

use Illuminate\Database\Seeder;

class WavesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('waves')->insert(['name' => "1-я очередь"]);
        DB::table('waves')->insert(['name' => "2-я очередь"]);
        DB::table('waves')->insert(['name' => "3-я очередь"]);
    }
}
