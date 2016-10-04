<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Users_information as info;
use Log;
use Auth;
use Mail;
use App\User;
use App\User_group;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return view("admin.entry");
    }


    public function entry(Request $request){

        $input=$request->all();

        //echo "<pre>";print_r($arResult);echo "</pre>";

        $this->validate($request, [
            'email'	=>	'required|email|max:255|exists:users,email',
            'password' => 'required',
        ]);

        $user=User::where('email',$input['email'])->first();
        if($user->is_admin()) {
            if (Auth::attempt(['email' => $input['email'], 'password' => $input['password']])) {

                return response()->json([
                    'success' => true,
                    'link' => '/admin',
                ], 200);

            } else {

                return response()->json([
                    'success' => false,
                    'message' => 'Пароль неверный',
                ], 423);

            }
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Вы не являетесь админом',
            ], 423);
        }


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function new_user(Request $request)
    {
        //
        $data=$request->all();
        $ids=$data["user_info_id"];

        foreach ($ids as $id){

            $info=info::find($id);

            $email=$info->email;
            $password=substr(md5($email),0,8);

            $user=User::where('email',$email)->get();

            if(!is_array($user)){

                $new_user=User::create(["email"=>$email,"password"=>bcrypt($password)]);

                $info->user_id=$new_user->id;
                $info->save();

                $group=new User_group();
                $group->user_id=$new_user->id;
                $group->group_id=2;
                $group->save();


                $text="Вас зарестрировали! Ваш логин: ".$email." Ваш пароль: ".$password." Чтобы зайти в свой кабинет перейдите по этой ссылке http://cabinet.lazurber.ru/";

                Mail::raw( $text, function ($message) use ($email) {
                    $message->from('cabinet@lazurber.ru', 'cabinet.lazurber.ru');
                    $message->to($email);
                });

            }else{
                return response()->json(['success' => false,"User"=>$user], 501);
            }
        }
        //Log::info([$password,$user,$info]);

        return response()->json(['success' => true], 200);
    }


}
