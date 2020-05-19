require( 'jquery-easyui/css/easyui.css' );
require( 'jquery-easyui/js/jquery.easyui.min.js' );

$( function()
{
	
	// https://www.jeasyui.com/documentation/combotree.php
	//$('#cc').combotree('setValues', [1,3,21]);
	var taxonId	= $( '#page_form_category_taxon' ).attr( 'data-value' );
	$( '#page_form_category_taxon' ).combotree( 'setValue', taxonId );
	
});
