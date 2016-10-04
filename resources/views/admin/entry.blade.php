@extends('layouts.admin_app')

@section('content')
	
	

	<div class="container-fluid" id="entry_page">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					@include('admin.entry_form')
				</div>
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
@endsection
