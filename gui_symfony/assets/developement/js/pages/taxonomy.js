require( 'bootstrap-gtreetable/dist/bootstrap-gtreetable.css' );
require( 'bootstrap-gtreetable/dist/bootstrap-gtreetable.js' );

$( function()
{
	$( '.btnTaxonomyTaxon' ).on( 'click', function( e ) {
		$.ajax({
			type: "GET",
		 	url: $( this ).attr( 'data-url' ),
			success: function( response )
			{
				$( '#taxonomyTaxonBody > div.card-body' ).html( response );
				$( '#taxonomyTaxonModal' ).modal( 'toggle' );
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
	
	$( '#btnSaveTaxon' ).on( 'click', function( e )
    {
    	var taxonForm	= $( '#taxonomyTaxonModal' ).find( 'form' );
    	
    	taxonForm.submit();
    });
	
	$( '#tableTaxons' ).gtreetable({
		'source': function ( id ) {
			return {
				type: 'GET',
				url: $( '#tableTaxons' ).attr( 'data-url' ),
				data: { 'taxonId': id },
				dataType: 'json',
				error: function( XMLHttpRequest ) {
					alert( 'GTreeTable ERROR !!!' );
					alert( XMLHttpRequest.status + ': ' + XMLHttpRequest.responseText );
				}
  	      	}
  	    }
  	});
});
