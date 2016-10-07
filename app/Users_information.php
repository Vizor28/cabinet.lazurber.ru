<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Users_information extends Model
{
    //
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function room(){
        return $this->belongsTo('App\Room');
    }
    public function block(){
        return $this->belongsTo('App\Block');
    }

}
