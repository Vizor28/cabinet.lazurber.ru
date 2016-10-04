@extends('layouts.cabinet_app')

@section('content')

<!--<pre>{{-- print_r($arResult) --}}</pre>-->

<div class="container-fluid green_background">
    <div class="container">
        <div class="row">
            @foreach($arResult["ITEMS"] as $key=>$item)
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="cabinet_vote mTop30">
                        <div class="cabinet_vote_question mTop20">
                            Вопрос
                        </div>
                        <div class="cabinet_vote_text cabinet_vote_question_text mTop10">
                            {!! $item->question !!}
                        </div>
                        <div class="cabinet_vote_list_block">
                            <div class="cabinet_vote_list">
                                @foreach($item["VOTES"]["OPTIONS"] as $option)
                                    <div class="vote mTop20">
                                        {{ $option->text }} {{ $item["VOTES"]["COUNT"]["OPTIONS"][$option->id] }}
                                        <div class="vote_line">
                                            <div class="vote_line_in" style="width:{{
                                    $item["VOTES"]["COUNT"]["OPTIONS"][$option->id]>0 ? ceil($item["VOTES"]["COUNT"]["OPTIONS"][$option->id]/$item["VOTES"]["COUNT"]["ALL"]*100) : 0 }}%;">

                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <div class="cabinet_vote_count mTop10">
                                Уже проголосовало <span>{{ $item["VOTES"]["COUNT"]["ALL"] }}</span> человек
                            </div>
                        </div>
                    </div>
                </div>
                @if ($key%2==1)
                    <div class="clearfix visible-lg visible-md"></div>
                @endif
            @endforeach
        </div>
        <div class="row mTop30">
            <div class="col-lg-1-12 col-md-12 col-sm-12 col-xs-12">
                <div class="next_vote mtop30">
                    <a href="http://cabinet.lazurber.ru/cabinet/">Назад в кабинет</a>
                </div>
            </div>
        </div>
        <div class="row mTop40"></div>
    </div>
</div>




@endsection