<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Block extends Model
{
    //
    public $timestamps = false;

    public function wave(){
        return $this->belongsTo('App\Wave');
    }
}
