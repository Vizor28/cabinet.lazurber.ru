$(document).ready(function(){
	
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
				if(data.success==true){
					
					window.location = data.link;
				}
				debugger;
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
					//$( '#error_message' ).html( jqXhr.responseText);
				}
			}
		});
		
		
		
		return false;
	});
	
});