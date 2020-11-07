$(function()
{
	$( '.btnCreateVirtualHost' ).on( 'click', function () {
		alert('Not Implemented Yet!!!');
		
		
		$( "#host-create-modal" ).modal( 'show' );
	});
	
	$( '#host-change-php-version-modal' ).on( 'shown.bs.modal', function ( event ) {
		var url	= $( event.relatedTarget ).attr( 'data-url' );
	    $( '#host-change-php-version-form').attr( 'action', url );
	});
	
});
