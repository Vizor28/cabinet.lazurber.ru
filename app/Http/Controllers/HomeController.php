<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Room;
use App\Users_information as Info;
use DB;
use Mail;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		$arResult=array();

        $arResult["BLOCKS"]=Room::select('block')->distinct()->get();
        //echo "<pre>";print_r($arResult["BLOCKS"]);echo "</pre>";die();

        return view('home', array("arResult" => $arResult));

    }
	
	public function register(Request $request)
    {
		$input=$request->all();

		$this->validate($request, [
			'block'	=>	'required|max:5|exists:rooms,block',
			'number' => 'required|digits_between:1,5|exists:rooms,number,block,'.$input['block'],
			'secondname'=>'required|string|max:50',
			'surname' => 'required|string|max:50',
			'name' => 'required|string|max:50',
			'phone'=>'required',
			'email'=>'required|email|max:255|unique:users_informations',
		]);
		
		
		$room = Room::where('block',$input["block"])->where('number',$input["number"])->first();
		$info = new Info;
		$info->name=strip_tags(trim($input["name"]));
		$info->surname=strip_tags(trim($input["surname"]));
		$info->secondname=strip_tags(trim($input["secondname"]));	
		$info->phone=strip_tags(trim($input["phone"]));
		$info->email=strip_tags(trim($input["email"]));
		$info->room_id=$room->id;
			
		$info->save();
        $email_user="Спасибо за регистрацию ".$info->name."! После проверки Ваши данных, на указанный вами e-mail придет пароль к личному кабинета кабинету.";

		Mail::raw($email_user, function ($message) use ($input) {
			$message->from('cabinet@lazurber.ru', 'cabinet.lazurber.ru');
			$message->to($input["email"]);
		});
		
		$email_admin="Пользователь на сайте cabinet.lazurber.ru с именем ".$info->name." зарегестрировался.";
		
		Mail::raw($email_admin, function ($message){
			$message->from('cabinet@lazurber.ru', 'cabinet.lazurber.ru');
			$message->to("vizor@poiskovoeprodvigenie.ru");
		});
		
		return response()->json([
			'success' => true,
			'message' => 'Регистрация прошла успешно. В ближайшее время инструкция придет на указанный Вами e-mail.'
		], 200);

    }
	
	public function entry(Request $request){
		
		$input=$request->all();
		
		//echo "<pre>";print_r($arResult);echo "</pre>";
		
		$this->validate($request, [
			'email'	=>	'required|email|max:255|exists:users,email',
			'password' => 'required',
		]);
		
		if (Auth::attempt(['email' => $input['email'], 'password' => $input['password']])) {

			return response()->json([
				'success' => true,
				'link' => '/cabinet',
			], 200);
			
		}else{
		
			return response()->json([
				'success' => false,
				'message' => 'Пароль неверный',	
			], 423);
		
		}
		
		
		
    }
	
	public function rooms(){
        die();
		$rooms = DB::select('select * from room');
		
		
		foreach ($rooms as $item) {
			
			$room = new Room;
			
			$room->number=$item->NUMBER;
			$room->area_all=$item->AREA_ALL;
			$room->area_summer=$item->AREA_SUMMER;
			$room->floor=$item->FLOOR;
			$room->porch=$item->PORCH;
			$room->block=$item->BLOCK;
			
			$room->save();
			
		}
		
		echo "<pre>";print_r($rooms);echo "</pre>";die();
		
    }
	
}
