<?php

use Illuminate\Database\Seeder;

class BlocksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('blocks')->insert(['name' => "А", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "АБ", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "АГ", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "АД", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "Б", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "Б1", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "Б*", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "А1", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "А3", "wave_id"=>1]);
        DB::table('blocks')->insert(['name' => "А4", "wave_id"=>1]);

        DB::table('blocks')->insert(['name' => "А", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "АБ", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "АГ", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "АД", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "Б", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "Б1", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "Б*", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "А1", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "А3", "wave_id"=>2]);
        DB::table('blocks')->insert(['name' => "А4", "wave_id"=>2]);


        DB::table('blocks')->insert(['name' => "А1", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "А2", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "А3", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "А4", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Б1", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Б2", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Б3", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Б4", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Г1", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Г2", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Г3", "wave_id"=>3]);
        DB::table('blocks')->insert(['name' => "Г4", "wave_id"=>3]);

    }
}
