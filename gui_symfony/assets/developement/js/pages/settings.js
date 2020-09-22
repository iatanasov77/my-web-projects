$( function ()
{
	$( '.btnSaveSettings' ).on( 'click', function( e )
	{
		var siteId	= $( this ).attr( 'data-siteId' );
		$( '#formSettings_' + siteId ).submit();
	});
});
