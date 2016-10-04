$(document).ready(function(){


	if($('.fancybox').length>0){
		$('.fancybox').fancybox();
	}
	
	if($('.cabinet_vote_variant .vote').length>0){
		$(document).on("click touch",".cabinet_vote_variant .vote",function(){
			if(!$(this).hasClass("active")){
				$(".cabinet_vote_variant .vote").removeClass("active");
				$(this).addClass("active");
				
				$(this).parents("form").find("#option").val($(this).data("variant"));
			}
		});
	}
	
	if($('.similar_block').length>0){
		 $('.similar_block').matchHeight();
	}

	if($(".cabinet_vote").length>0){
		$(document).on("click touch",".cabinet_vote_button",function(){

			var form=$(this).parents(".cabinet_vote_form").find("form");
			var action=$(form).attr("action");
			var data=$(form).serialize();

			//debugger;

			$.ajax({
				url: action,
				data: data,
				cache:false,
				type:'POST',
				success: function(data){
					if(data.success==true){
						$('#vote_wrapper').html(data.template);
					}
					//debugger;
				},
				error: function(jqXhr){

					//$errors = jqXhr.responseJSON; //this will get the errors response data.

					//debugger;


				}
			});


		});
	}

	if($("#next_question").length>0){
		$(document).on("click touch","#next_question",function(){

			var action=$(this).attr("href");
			var token=$('#vote_wrapper').find('input[name="_token"]').val();

			var data={"vote":$(this).data("vote"),"_token":token};

			//debugger;

			$.ajax({
				url: action,
				data: data,
				cache:false,
				type:'POST',
				success: function(data){
					if(data.success==true){
						$('#vote_wrapper').html(data.template);
					}
					//debugger;
				},
				error: function(jqXhr){

					//$errors = jqXhr.responseJSON; //this will get the errors response data.

					//debugger;


				}
			});

			return false;
		});
	}

	if($(".popup_form_button").length>0){
		$(".popup_form_button").on("click touch",function(){

			$form=$(this).parents("form");
			var action=$($form).attr("action");
			var data=$($form).serialize();

			//debugger;

			$.ajax({
				url: action,
				data: data,
				cache:false,
				type:'POST',
				success: function(data){
					if(data.success==true){
						$($form).find(".form-group").removeClass("has-error");
						$($form).find(".form-group").find('.error_message').html('');
						$($form).find(".form-group").find('input,textarea').val('');

						$($form).find('.popup_message').html( '<div class="alert alert-success">'+data.message+'</div>' );


					}
					//debugger;
				},
				error: function(jqXhr){

					if( jqXhr.status === 422 ) {
						//process validation errors here.
						var $errors = jqXhr.responseJSON; //this will get the errors response data.

						//debugger;
						$($form).find('.popup_message').html('');
						$($form).find(".form-group").removeClass("has-error");
						$($form).find(".form-group").find('.error_message').html('');

						//show them somewhere in the markup
						//e.g

						$.each( $errors, function( key, value ) {

							//debugger;
							$($form).find('[name="'+key+'"]').parents(".form-group").addClass("has-error");
							$($form).find('[name="'+key+'"]').parents(".form-group").find('.error_message').html('<div class="alert alert-danger">'+ value[0] +'</div>');

						});

					} else {
						// do some thing else
						//$( '#registration_message' ).html( '<div class="alert alert-danger">Попробуйте снова</div>' );
					}

					//debugger;


				}
			});

			return false;
		});
	}

	if($("#articles_pagination").length>0){
		//$("#articles_pagination a").on("click touch",function(){
		$(document).on("click touch","#articles_pagination a",function(){

			var action=$(this).attr("href");
			//var data=$($form).serialize();
			var data='';

			//debugger;
			$.ajax({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				},
				url: action,
				data: data,
				cache:false,
				type:'POST',
				success: function(data){
					if(data.success==true){
						$("#block_articles").html(data.template);
					}
					//debugger;
				},
				error: function(jqXhr){

					if( jqXhr.status === 422 ) {

					}
					//debugger;
				}
			});

			return false;
		});
	}
	
});