$(function()
{
	$( '.btnCreateVirtualHost' ).on( 'click', function () {
		$( "#host-create-modal" ).modal( 'show' );
	});
	
	$( '#host-change-php-version-modal' ).on( 'shown.bs.modal', function ( event ) {
		var url	= $( event.relatedTarget ).attr( 'data-url' );
	    $( '#host-change-php-version-form').attr( 'action', url );
	});
	
	$( '.btnDeleteHost' ).on( 'click', function( e )
	{
		var url	= $( this ).attr( 'data-url' );
		
		$.ajax({
			type: "GET",
		 	url: url,
			success: function( response )
			{
				window.location.reload();
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
	
});
