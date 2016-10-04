<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Auth;
use App\Article;
use App\Vote;
use Log;
use App\User_vote;
use Mail;

class CabinetController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	public function __construct()
    {
        $this->middleware('auth');
    }

    public function getLogout()
    {
        Auth::logout();
        return redirect()->guest('/');
    }

    public function getBlockArticles(Request $request){
        //$id=$request->input("vote");

        if(intval($request->input("page")) == 1){
            $request->input("page",0);
        }
        $articles = Article::paginate(intval($request->input("perPage")));
        $articles->setPath('/cabinet/getBlockArticles');

        $template=view('block_articles',array("articles"=>$articles))->render();

        return response()->json(['success' => true,"template"=>$template], 200);
    }

    public function pageArticles(){
        $arResult=array();

        $arResult["ARTICLES"]=Article::paginate(15);

        $arResult["ARTICLES"]->setPath('/cabinet/getBlockArticles');

        if(empty($arResult["ARTICLES"])){
            return redirect('/cabinet');
        }

        return view('pageArticles',array("arResult"=>$arResult));
    }

    public function getArticle($id){
        $arResult=array();
        $id=intval($id);

        $arResult["ARTICLE"]=Article::find($id);
        if(empty($arResult["ARTICLE"])){
            return redirect('/cabinet');
        }

        return view('pageArticle',array("arResult"=>$arResult));
    }

    public function createdQuestion(Request $request){

        $user=Auth::user();
        $this->validate($request, [
            'question'	=>	'required|string'
        ]);
        $question=strip_tags($request->input('question'));
        $email=$user->email;
        $room=$user->info->room;

        $text="Пользователь(".$email.")\r\n 
        с блока ".$room->block." 
        c квартиры ".$room->number."\r\n 
        с сайта cabinet.lazurber.ru\r\n 
        отправил такое сообщение:\r\n".$question;

        //Log::info(["room"=>$room]);

        Mail::raw($text, function ($message) {
            $message->from('cabinet@lazurber.ru', 'cabinet.lazurber.ru');
            $message->to('vizor@poiskovoeprodvigenie.ru');
        });

        return response()->json(['success' => true,"message"=>'Вопрос принят'], 200);

    }

    public function votePage(){

        $arResult=array();

        $votes=array();
        $user_id=Auth::user()->id;

        $arResult["ITEMS"] = Vote::orderBy('created_at', 'desc')->get();


        if(isset($arResult["ITEMS"]) && !empty($arResult["ITEMS"])){

            foreach ($arResult["ITEMS"] as &$item){

                $item["VOTES"]=$this->getOptionAndCount($item,$user_id);

            }
        }

        return view('votePage',array("arResult"=>$arResult));
    }

    public function createdSpecialist(Request $request){

        $user=Auth::user();
        $this->validate($request, [
            "specialist"  =>	'required',
            "datetime"    =>	'required',
            'problems'	  =>	'required|string'
        ]);
        $specialist=strip_tags($request->input('specialist'));
        $datetime=strip_tags($request->input('datetime'));
        $problems=strip_tags($request->input('problems'));

        $email=$user->email;
        $room=$user->info->room;

        $text="Пользователь(".$email.")\r\n 
        с сайта cabinet.lazurber.ru\r\n 
        с блока ".$room->block." 
        c квартиры ".$room->number."\r\n 
        хочет специалиста: ".$specialist."\r\n
        на такое время: ".$datetime."\r\n
        отправил такое сообщение:\r\n".$problems;

        Mail::raw($text, function ($message) {
            $message->from('cabinet@lazurber.ru', 'cabinet.lazurber.ru');
            $message->to('vizor@poiskovoeprodvigenie.ru');
        });

        return response()->json(['success' => true,"message"=>'Проблема принята'], 200);

    }

	 
    public function index()
    {
		$arResult=array();
		
		$arResult["USER"]=Auth::user()->info;
        $arResult["ARTICLES"]=Article::paginate(3);

        $arResult["ARTICLES"]->setPath('/cabinet/getBlockArticles');

        $arResult["VOTES"]=$this->getVote();

		return view('cabinet',array("arResult"=>$arResult));	
    }



    public function createdVote(Request $request){

        $user_vote=new User_vote();

        $user_vote->user_id=Auth::user()->id;
        $user_vote->vote_id=intVal($request->input("vote"));
        $user_vote->option_id=intVal($request->input("option"));

        $user_vote->save();

        $votes=$this->getThisVote($user_vote->vote_id);
        $template=view('vote',array("votes"=>$votes))->render();

        //Log::info(["temp"=>$template]);

        return response()->json(['success' => true,"template"=>$template], 200);

    }

    public function nextVote(Request $request){

        $id=$request->input("vote");

        $votes=$this->getNextVote($id);
        $template=view('vote',array("votes"=>$votes))->render();

        return response()->json(['success' => true,"template"=>$template], 200);
    }


    protected function getVote(){

        $votes=array();
        $user_id=Auth::user()->id;


        //All id vote what user voted
        $user_voted=array();
        $user_voted=User_vote::where("user_id",$user_id)->lists("vote_id");

        $votes["ITEM"] = Vote::whereNotIn("id", $user_voted)
            ->orderBy('created_at', 'desc')->first();

        //if not vote without voted - get first vote
        if (empty($votes["ITEM"])) {
            $votes["ITEM"] = Vote::orderBy('created_at', 'desc')->first();
        }

        if(isset($votes["ITEM"]) && !empty($votes["ITEM"])){

            $user_options=$this->getOptionAndCount($votes["ITEM"],$user_id);

            $votes=array_merge($votes,$user_options);
        }

        return $votes;

    }

    protected function getThisVote($id){

        $votes=array();
        $user_id=Auth::user()->id;

        $votes["ITEM"]=Vote::find(intval($id));

        if (empty($votes["ITEM"])) {
            $votes["ITEM"] = Vote::orderBy('created_at', 'desc')->first();
        }

        if(isset($votes["ITEM"]) && !empty($votes["ITEM"])){

            $user_options=$this->getOptionAndCount($votes["ITEM"],$user_id);

            $votes=array_merge($votes,$user_options);
        }

        return $votes;

    }


    protected function getNextVote($id){

        $votes=array();
        $user_id=Auth::user()->id;

        $first=Vote::find(intval($id));

        $votes["ITEM"] = Vote::where("created_at","<",$first->created_at)->orderBy('created_at', 'desc')->first();


        if (empty($votes["ITEM"])) {
            $votes["ITEM"] = Vote::orderBy('created_at', 'desc')->first();
        }

        if(isset($votes["ITEM"]) && !empty($votes["ITEM"])){

            $user_options=$this->getOptionAndCount($votes["ITEM"],$user_id);

            $votes=array_merge($votes,$user_options);
        }

        return $votes;

    }

    protected function getOptionAndCount($vote,$user_id){

        $votes=array();
        $votes["OPTIONS"] = $vote->options()->get();

        $votes["USER"] = User_vote::where([
            "vote_id"=>$vote->id,
            "user_id"=>$user_id
        ])->first();


        //Count user who vote this questions

        foreach($votes["OPTIONS"] as $option){
            $votes["COUNT"]["OPTIONS"][$option->id]=User_vote::where([
                "vote_id"=>$vote->id,
                "option_id"=>$option->id
            ])->count();
        }


        $votes["COUNT"]["ALL"]=User_vote::where("vote_id",$vote->id)->count();

        return $votes;

    }




}
