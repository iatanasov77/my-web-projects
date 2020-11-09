$(function()
{
	$( '.btnCreateVirtualHost' ).on( 'click', function () {
		$( "#host-create-modal" ).modal( 'show' );
	});
	
	$( '#host-change-php-version-modal' ).on( 'shown.bs.modal', function ( event ) {
		var url	= $( event.relatedTarget ).attr( 'data-url' );
	    $( '#host-change-php-version-form').attr( 'action', url );
	});
	
});
