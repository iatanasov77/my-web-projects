require( 'jquery-form' );
import Routing from '../fos_js_routing.js';

function hideModal()
{
	var form			= $('.modal.show').find( 'form' );
	var errorBox		= $('.modal.show').find( "div#ModelAddErrors" );
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
	$( "#models" ).autocomplete({
    	source: function (request, response)
        {
    		$( "#autocompleteSpinner" ).show();
    		
            $.ajax(
            {
                url: Routing.generate( 'listModelNames' ),
                dataType: "json",
                data:
                {
                    term: request.term,
                },
                
                success: function (json)
                {
                    response(json);
                    $( "#autocompleteSpinner" ).hide();
                }
            });
        },
        focus: function( event, ui ) {
            $( "#models" ).val( ui.item.value );
            return false;
        },
        select: function( event, ui )
        {
        	var url					= Routing.generate( 'model_operations', { modelId: ui.item.key });
        	//var url   = '{{ path('model_operations', {'modelId': '--modelId--'}) }}';
        	window.location.href	= url;
    	     
            return false;
        },
        search: function(event, ui) { 
            $('.ui-autocomplete-spinner').show();
        },
        response: function(event, ui) {
            $('.ui-autocomplete-spinner').hide();
        }
    });
	
	$( "#submitModelAdd" ).click( function() {
		$( "#ModelAddSpinner" ).show();
		
        $("#form_models_add").ajaxSubmit({
            url: '/models/model_add',
            type: 'post',
            success: function( data ){
            	$( "#ModelAddSpinner" ).hide();
            	
            	if ( data.status == 'error' )
            	{
            		$.each(data.errors, function( k, v ) {
            			$( "#ModelAddErrors" ).append( "<p>" + v + "</p>" );
        			});
            		
                	$("#ModelAddErrors").show();
            	}
                
                if ( data.status == 'Ok' )
            	{
                	$("#form_models_add")[0].reset();
                	hideModal();
            	}
            },
            error: function( data ) {
            	console.log( data );
                alert( 'ERROR!' );
            }
        });
    });
});
