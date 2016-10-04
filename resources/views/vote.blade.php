@if (isset($votes["ITEM"]) && !empty($votes["ITEM"]))
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="cabinet_vote mTop30">
            <div class="cabinet_vote_title main_h1">Голосование</div>
            <div class="cabinet_vote_text mTop30">
                Нам важно Ваше мнение! Собственники квартир ЖК “Лазурный берег 2” могут принять участие в голосовании по вопросам, касающимся развития комплекса и благоустройства территории.
            </div>
            <div class="cabinet_vote_question mTop20">
                Вопрос
            </div>
            <div class="cabinet_vote_text cabinet_vote_question_text mTop10">
                {!! $votes["ITEM"]->question !!}
            </div>
            @if (empty($votes["USER"]))
                <div class="cabinet_vote_form">
                    <form method="POST" action="{{ url('/cabinet/vote') }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="option" id="option" value="{{ $votes["OPTIONS"][0]->id }}">
                        <input type="hidden" name="vote" id="vote" value="{{ $votes["ITEM"]->id }}">
                        <div class="cabinet_vote_variant">
                            @foreach($votes["OPTIONS"] as $key=>$option)
                                <div class="vote mTop20 @if (!$key) active @endif" data-variant="{{ $option->id }}">
                                    {{ $option->text }}
                                </div>
                            @endforeach
                        </div>
                        <button class="cabinet_vote_button mTop30 hvr-bounce-to-right" type="button">Проголосовать</button>
                        <div class="cabinet_vote_count mTop10">
                            Уже проголосовало <span>{{ $votes["COUNT"]["ALL"] }}</span> человек
                        </div>
                    </form>
                </div>
            @else
                {{ csrf_field() }}
                <div class="cabinet_vote_list_block">
                    <div class="cabinet_vote_list">
                        @foreach($votes["OPTIONS"] as $option)
                            <div class="vote mTop20">
                                {{ $option->text }} {{ $votes["COUNT"]["OPTIONS"][$option->id] }}
                                <div class="vote_line">
                                    <div class="vote_line_in" style="width:{{
                                    $votes["COUNT"]["OPTIONS"][$option->id]>0 ? ceil($votes["COUNT"]["OPTIONS"][$option->id]/$votes["COUNT"]["ALL"]*100) : 0 }}%;">

                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="cabinet_vote_count mTop10">
                        Уже проголосовало <span>{{ $votes["COUNT"]["ALL"] }}</span> человек
                    </div>
                </div>
            @endif
        </div>
        <div class="next_vote mtop30">
            <a href="{{ url('/cabinet/next_vote') }}" data-vote="{{ $votes["ITEM"]->id }}" id="next_question">Перейти к следующему вопросу</a>
        </div>
        <div class="next_vote mtop30">
            <a href="{{ url('/cabinet/vote') }}"  id="vote_page">Результаты всех голосований</a>
        </div>
    </div>
@endif