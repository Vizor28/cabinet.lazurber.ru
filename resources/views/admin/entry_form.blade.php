<div class="form_my">
	<div class="form_my_title">
		Вход в личный кабинет
	</div>
	<div id="entry_message">
	</div>
	<form class="form-horizontal" role="form" action="{{ url('/admin/entry') }}" method="POST" id="entry_form">
		{{ csrf_field() }}
		<div class="form-group">
			<label for="inputEmail" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Адрес электронной почты <span>*</span></label>
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
				<input type="email" name="email" class="form-control input-lg" id="inputEmail" placeholder="Адрес электронной почты" requared>
				<div class="error_message"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 control-label">Пароль</label>
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
				<input type="password" name="password" class="form-control input-lg" id="inputPassword" placeholder="Пароль">
				<div class="error_message"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form_button_block">
			<div class="col-lg-5 col-md-12 col-sm-5 col-xs-12">
				<button type="button" id= "button_entry" class="button_entry form_my_button hvr-bounce-to-right">Войти <i></i></a>
			</div>
			<div class="clearfix"></div>
		</div>
	</form>
</div>