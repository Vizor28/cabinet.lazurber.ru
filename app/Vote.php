<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    //
    public function options(){
        return $this->belongsToMany('App\Option','vote_option','vote_id','option_id');
    }
    public function user_vote(){
        return $this->hasOne('App\User_vote');
    }
}
