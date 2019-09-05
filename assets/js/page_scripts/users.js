require( 'jquery-form' );

function hideModal()
{
	var form			= $('.modal.show').find( 'form' );
	var errorBox		= $('.modal.show').find( "div#UserAddErrors" );
	errorBox[0].text	= '';
	form[0].reset();
	
	$(".modal").removeClass("show");
	$(".modal-backdrop").remove();
	$('body').removeClass('modal-open');
	$('body').css('padding-right', '');
	$(".modal").hide();
}

$( function()
{
	$( "#submitUserAdd" ).click( function() {
		$( "#UserAddSpinner" ).show();
		
        $("#form_users_add").ajaxSubmit({
            url: '/users/user_add',
            type: 'post',
            success: function( data ){
            	$( "#UserAddSpinner" ).hide();
            	
            	if ( data.status == 'error' )
            	{
            		$.each(data.errors, function( k, v ) {
            			$( "#UserAddErrors" ).append( "<p>" + v + "</p>" );
        			});
            		
                	$("#UserAddErrors").show();
            	}
                
                if ( data.status == 'Ok' )
            	{
                	$("#form_users_add")[0].reset();
                	hideModal();
            	}
            },
            error: function( data ) {
            	console.log( data );
                alert( 'ERROR!' );
            }
        });
    });
    $( "#submitGroupAdd" ).click( function() {
    	$( "#GroupAddSpinner" ).show();
    	
        $("#form_users_group_add").ajaxSubmit({
        	url: '/users/group_add',
            type: 'post',
            success: function( data ){
            	$( "#GroupAddSpinner" ).hide();
            	
            	if ( data.status == 'error' )
            	{
            		$.each(data.errors, function( k, v ) {
            			$( "#GroupAddErrors" ).append( "<p>" + v + "</p>" );
        			});
            		
                	$("#GroupAddErrors").show();
            	}
                
                if ( data.status == 'Ok' )
            	{
                	$("#form_users_group_add")[0].reset();
                	hideModal();
            	}
            },
            error: function( data ) {
            	$( "#GroupAddSpinner" ).hide();
            	
                console.log( data );
            }
        });
    });
});