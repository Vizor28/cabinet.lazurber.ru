@extends('layouts.app')

@section('content')
	<div class="container-fluid" id="entry_page">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="form_my">
					@if (!Auth::check() || (Auth::check() && !Auth::user()->is_cabinet()))
						<div class="form_my_title">
							Вход в личный кабинет
						</div>
						<div id="entry_message">
						</div>
						<form class="form-horizontal" role="form" action="{{ url('/entry') }}" method="POST" id="entry_form">
							{{ csrf_field() }}
							<div class="form-group">
								<label for="inputEmail" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Адрес электронной почты <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="email" name="email" class="form-control input-lg" id="inputEmail" placeholder="Адрес электронной почты" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Пароль</label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="password" name="password" class="form-control input-lg" id="inputPassword" placeholder="Пароль">
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="form_button_block">
								<div class="col-lg-5 col-md-12 col-sm-5 col-xs-12">
									<button type="button" id= "button_entry" class="button_entry form_my_button hvr-bounce-to-right">Войти <i></i></button>
								</div>
								<div class="col-lg-7 col-md-12 col-sm-7 col-xs-12">
									<a href="{{ url('/password/email') }}" class="button_forgot form_my_button hvr-bounce-to-right">Забыли пароль</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					@else
						<div class="entry_cabinet">
							<div class="entry_cabinet_name">
								Приветсвую, <span>{{ Auth::user()->info->name }}</span>									
							</div>
							<div class="entry_cabinet_button mTop20">
								<a href="{{ url('/cabinet') }}" class="form_my_button hvr-bounce-to-right">Вход в кабинет</a>							
							</div>
							<div class="clearfix"></div>
						</div>
					
					@endif	
					</div>
				</div>
				
				@if (!Auth::check() || (Auth::check() && !Auth::user()->is_cabinet()))
				<div class="col-lg-6 col-md-6">
					<div class="form_my">
						<div class="form_my_title">
							Регистрация
						</div>
						<div id="registration_message">
						</div>
						<form class="form-horizontal" role="form" action="{{ url('/register') }}" method="POST" id="registration_form">
						{{ csrf_field() }}
							<div class="form-group">
								<label for="inputWave" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Очередь квартир<span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<select class="form-control input-lg" name="wave" id="inputWave">
										@foreach($arResult["WAVES"] as $wave)
											<option value="{{ $wave->id }}">{{ $wave->name }}</option>
										@endforeach
									</select>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputBlock" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Блок квартиры по свидетельству <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<select class="form-control input-lg" name="block" id="inputBlock">
										@foreach($arResult["BLOCKS"] as $block)
											<option value="{{ $block->id }}">{{ $block->name }}</option>
										@endforeach
									</select>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputNumber" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Номер квартиры по свидетельству <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="text" name="number" class="form-control input-lg" id="inputNumber" placeholder="Номер квартиры" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputSurName" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Фамилия <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="text" name="surname" class="form-control input-lg" id="inputSurName" placeholder="Фамилия" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Имя <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="text" name="name" class="form-control input-lg" id="inputName" placeholder="Имя" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputSecondName" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Отчество <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="text" name="secondname" class="form-control input-lg" id="inputSecondName" placeholder="Отчество" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPhone" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Контактный телефон <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="text" name="phone" class="form-control input-lg" id="inputPhone" placeholder="Контактный телефон" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Адрес электронной почты <span>*</span></label>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<input type="email" name="email" class="form-control input-lg" id="inputEmail" placeholder="Адрес электронной почты" requared>
									<div class="error_message">
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="form_button_block">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<button type="button" id="button_registration" class="button_registration form_my_button hvr-bounce-to-right">зарегистрироваться <i></i></button>
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
				</div>
				@endif
				
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div id="error_message">
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row mTop60">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="main_h1">О личном кабинете</div>
				<div class="main_text mTop30">
					<p>Личный кабинет персональное пространство для обслуживания собственников квартир ЖК “Лазурный берег 2”. С его помощью вы сможете своевременно подать сведения о показаниях приборов учета, управлять своим лицевым счетом, получать актуальную информацию от управляющей компании и принимать участие в голосовании.</p>
					<p>Чтобы аоспользоваться услугой, необходимо пройти онлайн-регистрацию в Личном кабинете. Заполните специальную форму регистрации. После проверки сведений вышлем на указанный адрес электронной почты пароль, с помошью которого Вы сможете осуществлять вход в Личный кабинет.</p>
				</div>
			</div>
		</div>	
	</div>
@endsection
