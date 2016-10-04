<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
       'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'name', 'password', 'remember_token',
    ];
	
	public function groups(){
		return $this->belongsToMany('App\Group','user_groups','user_id','group_id');
	}
	
	public function is_admin(){
		$admin=$this->groups()->where('group_id',1)->first();
		return !empty($admin) ? true : false;
	}
	
	
	public function is_cabinet(){
		$cabinet=$this->groups()->where('group_id',2)->first();
		return !empty($cabinet) ? true : false;
	}
	
	public function info(){
		return $this->hasOne('App\Users_information');
	}
	
}
