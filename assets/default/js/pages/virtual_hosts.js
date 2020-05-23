$(function()
{
	$( '#change-version-modal' ).on( 'click', '#btnChangeVersion', function( e )
	{
		var spinner   = '<div class="spinner-border" role="status"  id="projectSpinner"><span class="sr-only">Loading...</span></div>';
		$( this ).before( spinner );
		
		$.ajax({
			type: "GET",
		 	url: "/projects/edit_install_manual/" + $( this ).attr( 'data-projectId' ),
			success: function( response )
			{
				$( "#projectSpinner" ).remove();
				$( '#btnEditInstallManual').hide();
				
				$( '#installManual > div.card-body' ).html( response );
				//$( '#install-manual-modal' ).modal( 'toggle' );
			},
			error: function()
			{
				$( "#projectSpinner" ).remove();
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
});
