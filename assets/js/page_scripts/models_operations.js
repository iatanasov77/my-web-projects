require( 'jquery-form' );
import Routing from '../fos_js_routing.js';

function hideModal()
{
	var form			= $('.modal.show').find( 'form' );
	var errorBox		= $('.modal.show').find( "div#ModelOperationAddErrors" );
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
	$( "#submitModelOperationAdd" ).click( function() {
		$( "#ModelOperationAddSpinner" ).show();
		
        $("#models_operation_add").ajaxSubmit({
            url: $("#models_operation_add").attr('action'),
            type: 'post',
            success: function( data ){
            	$( "#ModelOperationAddSpinner" ).hide();
            	
            	if ( data.status == 'error' )
            	{
            		$.each(data.errors, function( k, v ) {
            			$( "#ModelOperationAddErrors" ).append( "<p>" + v + "</p>" );
        			});
            		
                	$("#ModelOperationAddErrors").show();
            	}
                
                if ( data.status == 'ok' )
            	{
                	$("#models_operation_add")[0].reset();
                	hideModal();
                	location.reload();
            	}
            },
            error: function( data ) {
            	console.log( data );
                alert( 'ERROR!' );
            }
        });
    });
});
