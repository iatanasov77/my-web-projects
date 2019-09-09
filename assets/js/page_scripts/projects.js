$( '#manual-ajax' ).click( function( event )
{
	this.blur(); // Manually remove focus from clicked button.
	var href	= this.attr( 'data-url' );
	
	$.get( href, function( html )
	{
		$( html ).appendTo( 'body' ).modal();
	});
});
