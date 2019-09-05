$( function()
{
    $( "#operators_filter_filter_groups_id" ).change( function()
    {
        this.form.submit();
    });

    $( "#submitUserAdd" ).click( function() {
        $("#operators_add").ajaxSubmit();
    })

    $("#operators_add").ajaxForm({
        url: '/users',
        type: 'post',
        success: function( data ){
            $("#operators_add")[0].reset();
            alert( 'ERROR!' );
        },
        error: function() {
            alert( 'ERROR!' );
        }
    });
});
