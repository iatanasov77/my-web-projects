require( '../css/main.css' );

require( '../vendor/jquery/jquery-3.3.1.min.js' );
require( 'jquery-ui-dist/jquery-ui.css' );
require( 'jquery-ui-dist/jquery-ui.js' );
require( '../vendor/bootstrap/js/bootstrap.bundle.js' );
require( '../vendor/slimscroll/jquery.slimscroll.js' );
require( '../libs/js/main-js.js' );

$( function()
{
	
	$( '.btnDelete' ).on( 'click', function ( e )
	{
		e.preventDefault();
		var confirmed	= confirm( 'Do you realy want delete this item ?' );
		
		if ( confirmed ) {
			$.ajax({
			     url : $( this ).attr( 'href' ),
			     method : 'DELETE',
			     data : {
			    	 _csrf_token: $( this ).attr( 'data-csrfToken' )
			     }
			}).done( function() {
				  document.location = document.location;
			});
		}
		
		return false;
	});
	
});
