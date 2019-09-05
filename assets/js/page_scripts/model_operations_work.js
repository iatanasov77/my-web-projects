require( '../datepicker' );
require( 'print-this' );

$( function()
{
    $('#models_work_filter_startDate').datepicker({
    	locale: 'bg',
    	language: 'bg',
    	format: 'dd.mm.yyyy',
        autoclose:true,
        defaultDate: new Date(),
    });
    
    $('#models_work_filter_endDate').datepicker({
    	locale: 'bg',
        language: 'bg',
        format: 'dd.mm.yyyy',
        autoclose:true,
        defaultDate: new Date()
    });
    
    var startDate = new Date( $( '#models_work_filter_startDate' ).data( 'date' ) );
    var endDate = new Date( $( '#models_work_filter_endDate' ).data( 'date' ) );
    
    $('#models_work_filter_startDate').datepicker('setDate', startDate);
    $('#models_work_filter_startDate').datepicker('update');
    
    $('#models_work_filter_endDate').datepicker('setDate', endDate);
    $('#models_work_filter_endDate').datepicker('update');
    
    
    $( '#models_work_filter_startDate, #models_work_filter_endDate' ).datepicker().on( 'changeDate', function( e )
    {
    	$( '#formFilter' ).submit();
    });
    
    $( '#btnPrint' ).on( 'click', function()
    {
    	$( '#ModelsWorkTable' ).printThis();
    } );
});
