require( '../datepicker' );
require( 'print-this' );
import Routing from '../fos_js_routing.js';

var t;
$( function()
{
	var date = new Date( $( '#workDate' ).data( 'date' ) );
	
    $('#workDate').datepicker({
    	locale: 'bg',
    	language: 'bg',
        autoclose:true,
        defaultDate: date,
    });
    
    $( '#btnPrint' ).on( 'click', function()
    {
    	$( '#ModelsWorkTable' ).printThis();
    } );
    
    var t		= $( '#tableWork' ).DataTable({
    	"sDom": 't'
    });
    
    $( '#btnAddOperator' ).on( 'click', function()
    {
    	if( $.trim( $( "#selOperators" ).val() )=='' )
		{
    		alert( 'Не е избран Оператор' );
    		return;
		}
   
    	var operatorId		= $( "#selOperators" ).val();
    	var operatorName	= $( "#selOperators option:selected" ).text();
    	var row				= createRow( operatorId, operatorName );
    	
    	t.row.add( row ).draw( false );
	});
    
    $( '#btnSave' ).on( 'click', function()
    {
    	var data	= {};
    	$( "#ModelsWorkTable :input" ).each(function()
    	{
    		var operatorId	= $( this ).data( 'operatorId' )
    		var operationId	= $( this ).data( 'operationId' );
    		var key			= operatorId + '_' + operationId;
    		
    		data[key]		= {
    			'operatorId': operatorId,
    			'operationId': operationId,
    			'count': $( this ).val()
    		};
    		
    	});

    	$.post({
    		url: Routing.generate( 'operators_work_add_work' ),
    		dataType: 'json',
    		data:	data,
    		success: function( data )
    		{
    			
    		},
    		error: function ( xhr, desc, err )
            {
                console.log( "Error!" );
            }
    	})
    	console.log( data );
    	

   
    } );
    
    
    
});

function createRow( operatorId, operatorName )
{
    var row = [ operatorName ];
    $("th.headOperation").each( function()
    {
        row.push( '<input type="text" size="3"' 
        		+ 'data-operation-id="' + $( this ).data( 'id' ) + '" ' 
				+ 'data-operator-id="' + operatorId + '" '
				+ 'value="' + operatorId + '">' );
    });
    
    return row;
}
