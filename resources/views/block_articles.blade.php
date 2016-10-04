
    @foreach($articles as $article)
        <div class="news_item mTop40">
            <div class="news_item_date">
                {{ $article->created_at }}
            </div>
            <div class="news_item_text mTop10">
                {!! $article->text !!}
            </div>
            @if (!empty($article->detail_text))
                <div class="news_item_link mTop10">
                    <a href="/cabinet/articles/{{ $article->id }}">Подробнее</a>
                </div>
            @endif
        </div>
    @endforeach
    <div id="articles_pagination">
        {{ $articles->appends(['perPage' => $articles->perPage()])->render() }}
    </div>