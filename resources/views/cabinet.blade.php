@extends('layouts.cabinet_app')

@section('content')

	@if (isset($arResult) && !empty($arResult))
		<!--<pre>{{-- print_r($arResult["ARTICLES"]) --}}</pre>-->
	@endif
	<div class="container-fluid" id="cabinet_page">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5 col-sm-6">
					<div class="cabinet_user_name mTop30">
						<div class="cabinet_user_name_title main_h1">Личный кабинет</div>
						<div class="cabinet_user_name_data mTop10">
							Л/С {{ $arResult["USER"]->id }} {{ $arResult["USER"]->surname }} {{ $arResult["USER"]->name }} {{ $arResult["USER"]->secondname }}
						</div>
					</div>
				</div>
				<div class="col-lg-offset-5 col-lg-3 col-md-offset-3 col-md-4 col-sm-6">
					<a href="{{ url("/cabinet/logout") }}" class="cabinet_exit hvr-bounce-to-right mTop30">
						<i></i>
						<span class="mTop20">Выйти из Личного кабинета</span>
					</a>
				</div>
			</div>
			<div class="row mTop40">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="cabinet_balans mTop30 hidden">
						<div class="cabinet_balans_title">
							Баланс Лицевого счета
						</div>
						<div class="cabinet_balans_price">
							-1 400 р. 90 коп.
						</div>
						<a href="#statement" class="hidden mTop10 hvr-bounce-to-right fancybox">Смотреть ведомость</a>
					</div>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-8">
					<div class="cabinet_text mTop30 similar_block" data-mh="group2">
						<div class="cabinet_text_title icon_pay main_h1">
							Оплатить комунальные услуги через сайт
						</div>
						<div class="cabinet_text_text mTop10">
							Внимание! При оплате указывайте Фамилию Имя Отчество собственника полностью
						</div>
						
						<a href="{{ url("/cabinet") }}" class="icon_reloader main_h1 cabinet_text_title mTop30">
							Обновить персональные данные
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-4">
					<div class="cabinet_data mTop30 similar_block" data-mh="group2">
						<div class="cabinet_data_title">
							Управляющая компания
						</div>
						<div class="cabinet_data_block mTop20">
							<div class="cabinet_data_block_text">
								ТСЖ ООС “Лазурный берег”<br>г. Сочи, ул. Российская, д.7
							</div>
						</div>
						<div class="cabinet_data_block mTop20">
							<div class="cabinet_data_block_title">
								Контактный телефон:
							</div>
							<div class="cabinet_data_block_text">
								+7(862) 252 31 01
							</div>
						</div>
						<div class="cabinet_data_block mTop20">
							<div class="cabinet_data_block_title">
								Время работы:
							</div>
							<div class="cabinet_data_block_text">
								9:00–18:00
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row mTop30">
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="cabinet_link mTop60 similar_block" data-mh="group3">
						<div class="cabinet_link_img icon_img_question"></div>
						<div class="cabinet_link_name">
							<a href="#question" class="fancybox">Задать вопрос<br>сотрудникам<br>управляющей компании</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="cabinet_link mTop60 similar_block" data-mh="group3">
						<div class="cabinet_link_img icon_img_blank"></div>
						<div class="cabinet_link_name">
							<a href="#blank">Бланки заявлений</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="cabinet_link mTop60 similar_block" data-mh="group3">
						<div class="cabinet_link_img icon_img_specialist"></div>
						<div class="cabinet_link_name">
							<a href="#specialist" class="fancybox">Вызвать специалиста<br>для выполнения<br>платных работ</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="cabinet_link mTop60 similar_block" data-mh="group3">
						<div class="cabinet_link_img icon_img_base"></div>
						<div class="cabinet_link_name">
							<a href="#documents">Нормативная база<br>(Документы)</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="container-fluid green_background">
		<div class="container">
			<div class="row">

				@if(isset($arResult["ARTICLES"]) && !empty($arResult["ARTICLES"]))
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="news_list mTop30">
						<div class="news_list_title main_h1">Актуальная информация</div>
						<div id="block_articles">
                             @include('block_articles', ['articles' => $arResult["ARTICLES"]])
						</div>
					</div>
                    <div class="next_vote mtop30">
                        <a href="http://cabinet.lazurber.ru/cabinet/articles">Вся информация</a>
                    </div>
				</div>
				@endif

				@if(isset($arResult["VOTES"]) && !empty($arResult["VOTES"]))
				<div id="vote_wrapper">
					@include('vote', ['votes' => $arResult["VOTES"]])
				</div>
				@endif

			</div>
			
			<div class="row mTop40">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="cabinet_partner">
						<div class="clearfix"></div>
						<div class="cabinet_partner_title main_h1 mTop40">
							Организации, оказывающие услуги собственникам квартир
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="cabinet_partner_item mTop20 similar_block" data-mh="group1">
									<div class="cabinet_partner_item_img">
										<img src="/resources/img/partner1.png">
									</div>
									<div class="cabinet_partner_item_text mTop20">
										Телекоммуникационные услуги компания “Дагомыс Телеком”
									</div>
									<div class="cabinet_partner_item_link mTop20">
										<a href="https://dagotel.ru/" target="_blank">Адрес сайта</a>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="cabinet_partner_item mTop20 similar_block" data-mh="group1">
									<div class="cabinet_partner_item_img">
										<img src="/resources/img/partner2.png" class="img-responsive">
									</div>
									<div class="cabinet_partner_item_text mTop20">
										Сочигоргаз
									</div>
									<div class="cabinet_partner_item_link mTop20">
										<a href="http://sochigorgaz.blizko.ru/" target="_blank">Адрес сайта</a>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="cabinet_partner_item mTop20 similar_block" data-mh="group1">
									<div class="cabinet_partner_item_img">
										<img src="/resources/img/partner3.png" class="img-responsive">
									</div>
									<div class="cabinet_partner_item_text mTop20">
										Сочинские электросети
									</div>
									<div class="cabinet_partner_item_link mTop20">
										<a href="http://sochielektroseti.ru/" target="_blank">Адрес сайта</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mTop40">
				<a id="blank"></a>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="cabinet_partner">
						<div class="cabinet_partner_title main_h1 mTop40">
							Бланки заявлений
						</div>
						<div class="blank_lists mTop10">
							<div class="blank_item">
								<a href="/document/1.docx" download>Заявление на прописку</a>
							</div>
							<div class="blank_item">
								<a href="/document/1.docx" download>Бланк предложений для сотрудников управляющей компании</a>
							</div>
							<div class="blank_item">
								<a href="/document/1.docx" download>Заявление на оформление пропуска для машины</a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row mTop40">
				<a id="documents"></a>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="cabinet_partner">
						<div class="cabinet_partner_title main_h1 mTop40">
							Нормативная база (Документы)
						</div>
						<div class="blank_lists mTop10">
							<div class="blank_item">
								<a href="/document/1.docx" download>Документ1</a>
							</div>
							<div class="blank_item">
								<a href="/document/1.docx" download>Документ2</a>
							</div>
							<div class="blank_item">
								<a href="/document/1.docx" download>Документ3</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mTop40"></div>
		</div>
	</div>


	<div id="question" class="popup_block">
		<div class="main_h1">Вопрос сотрудникам компнии</div>
		<form role="form" class="popup_form" action="{{ url('/cabinet/question') }}" method="POST">
			{{ csrf_field() }}
			<div class="popup_message"></div>
			<div class="form-group">
				<label for="inputQuestion" class="control-label">Вопрос</label>
				<textarea  name="question" class="form-control" rows="5" id="inputQuestion" placeholder="Вопрос"></textarea>
				<div class="error_message"></div>
			</div>
			<button type="button" class="popup_form_button hvr-bounce-to-right">Отправить <i></i></button>
		</form>
	</div>

	<div id="specialist" class="popup_block">
		<div class="main_h1">Вызвать специалиста</div>
		<form role="form" class="popup_form" action="{{ url('/cabinet/specialist') }}" method="POST">
			{{ csrf_field() }}
			<div class="popup_message"></div>
			<div class="form-group">
				<label for="inputSpecialist" class="control-label">Специалист</label>
				<select id="inputSpecialist" class="form-control" name="specialist">
					<option value="Сантехник" selected>Сантехник</option>
					<option value="Электрик">Электрик</option>
					<option value="Рабочий">Рабочий</option>
					<option value="Уборщища">Уборщища</option>
				</select>
				<div class="error_message"></div>
			</div>
			<div class="form-group">
				<label for="inputDate" class="control-label">Удобное время визита (Дата и время)</label>
				<div class='input-group date' id='datetimepicker'>
					<input type='text' name="datetime" class="form-control" id="inputDate"/>
					<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
				</div>
				<div class="error_message"></div>
			</div>
			<div class="form-group">
				<label for="inputProblems" class="control-label">Опишите проблему</label>
				<textarea  name="problems" class="form-control" rows="5" id="inputProblems" placeholder="Проблема"></textarea>
				<div class="error_message"></div>
			</div>
			<button type="button" class="popup_form_button hvr-bounce-to-right">Отправить <i></i></button>
		</form>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			$('#inputDate').datetimepicker({lang: 'ru'});
			$('#datetimepicker').on('click', function () {
				$('#inputDate').datetimepicker('show');
			});
		});
	</script>

@endsection
