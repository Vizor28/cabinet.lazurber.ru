$(document).ready(function(){


	if($('.fancybox').length>0){
		$('.fancybox').fancybox();
	}
	$("#inputWave").change(function(){

		var wave=$(this).val();
		var token=$(this).parents("form").find('[name="_token"]').val();
		//debugger;

		$.ajax({
			url: "/blocks",
			data: {"wave": wave, "_token" : token},
			cache:false,
			type:'POST',
			success: function(data){

				//debugger;
				if(data.success==true){
					$("#inputBlock").html('');
					$.each(data.blocks,function(key,value){
						$("#inputBlock").append('<option value="'+value.id+'">'+value.name+'</option>');
					});
				}

				//debugger;
			},
			error: function(jqXhr){
				//debugger;
			}
		});

	});
	
	$("#button_registration").click(function(){
		var form=$(this).parents("form");
		
		var action=$(form).attr('action');
		
		var data=$(form).serialize();
		
		$( '#registration_message' ).html('');
		
		//debugger;
		
		$.ajax({
			url: action,
			data: data,
			cache:false,
			type:'POST',
			success: function(data){
			
				if(data.success==true){
					$("#registration_form .form-group").removeClass("has-error");
					$("#registration_form .form-group").find('.error_message').html('');
					$("#registration_form .form-group").find('input,textarea').val('');
					
					$( '#registration_message' ).html( '<div class="alert alert-success">'+data.message+'</div>' );
				}
				//debugger;
				
				
				
				//debugger;
			},
			error: function(jqXhr){
			
				if( jqXhr.status === 422 ) {
					//process validation errors here.
					$errors = jqXhr.responseJSON; //this will get the errors response data.
					
					//debugger;
					
					$("#registration_form .form-group").removeClass("has-error");
					$("#registration_form .form-group").find('.error_message').html('');
					//show them somewhere in the markup
					//e.g
	
					$.each( $errors, function( key, value ) {
						
						$("#registration_form").find('[name="'+key+'"]').parents(".form-group").addClass("has-error");
						$("#registration_form").find('[name="'+key+'"]').parent().find('.error_message').html('<div class="alert alert-danger">'+ value[0] +'</div>');
						
					});
		
				} else {
					// do some thing else
					$( '#registration_message' ).html( '<div class="alert alert-danger">Попробуйте снова</div>' );
				}
			}
		});
		
		
		
		return false;
	});
	
	$("#button_entry").click(function(){
		var form=$(this).parents("form");
		
		var action=$(form).attr('action');
		
		var data=$(form).serialize();
		
		$( '#entry_message' ).html('');
		
		//debugger;
		
		$.ajax({
			url: action,
			data: data,
			cache:false,
			type:'POST',
			success: function(data){
				debugger;
				if(data.success==true){
					
					window.location = data.link;
					
				}
				//debugger;
			},
			error: function(jqXhr){
			
				if( jqXhr.status === 422 ) {
					//process validation errors here.
					$errors = jqXhr.responseJSON; //this will get the errors response data.
					
					//debugger;
					
					$("#entry_form .form-group").removeClass("has-error");
					$("#entry_form .form-group").find('.error_message').html('');
					//show them somewhere in the markup
					//e.g
	
					$.each( $errors, function( key, value ) {
						
						$("#entry_form").find('[name="'+key+'"]').parents(".form-group").addClass("has-error");
						$("#entry_form").find('[name="'+key+'"]').parent().find('.error_message').html('<div class="alert alert-danger">'+ value[0] +'</div>');
						
					});
					
				}else if( jqXhr.status === 423 ) {
					$errors = jqXhr.responseJSON;
				
					$( '#entry_message' ).html( '<div class="alert alert-danger">'+ $errors.message +'</div>' );
				
				} else {
					// do some thing else
					$( '#entry_message' ).html( '<div class="alert alert-danger">Попробуйте снова</div>' );
					$( '#error_message' ).html( jqXhr.responseText);
				}
			}
		});
		
		
		
		return false;
	});
	
});