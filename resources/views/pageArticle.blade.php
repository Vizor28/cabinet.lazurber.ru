@extends('layouts.cabinet_app')

@section('content')

    <!--<pre>{{-- print_r($arResult) --}}</pre>-->

    <div class="container-fluid green_background">
        <div class="container">
            <div class="row mTop30">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="cabinet_vote">
                        <div class="cabinet_vote_question mTop20">
                            {{ $arResult["ARTICLE"]->created_at }}
                        </div>
                        <div class="cabinet_vote_text cabinet_vote_question_text mTop10">
                            {!! $arResult["ARTICLE"]->detail_text !!}
                        </div>
                    </div>
                </div>
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