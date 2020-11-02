var spinner = '<div style="text-align:center;"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>';

$(function()
{
	// Init Delete Form
	$( '#sectionProjects' ).on( 'click', '.btnDelete', function( e )
	{
		$( '#project_delete_projectId' ).val( $( this ).attr( 'data-projectId' ) );
	});

    $( '#create-project-modal' ).on( 'hidden.bs.modal', function ()
    {
        $( '#formProjectContainer' ).html( '' );
    });

    $( '#btnCreateProject' ).on( 'click', function( e )
    {
        $( '#formProjectContainer' ).html( spinner );
        
        $.ajax({
            type: "GET",
            url: "/projects/edit/0",
            success: function( response )
            {
                $( '#formProjectContainer' ).html( response );
            },
            error: function()
            {
                alert( "SYSTEM ERROR!!!" );
            }
        });
    });
    
	$( '#sectionProjects' ).on( 'click', '.btnEdit', function( e )
	{
        $( '#formProjectContainer' ).html( spinner );
        
		$.ajax({
			type: "GET",
		 	url: "/projects/edit/" + $( this ).attr( 'data-projectId' ),
			success: function( response )
			{
				$( '#formProjectContainer' ).html( response );
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});

	$( '#sectionProjects' ).on( 'click', '.btnInstall', function( e )
	{
		var spinner   = '<div class="spinner-border" role="status"  id="projectSpinner"><span class="sr-only">Loading...</span></div>';
		$( this ).before( spinner );
		
		$( '#btnEditInstallManual' ).attr( 'data-projectId', $( this ).attr( 'data-projectId' ) );
		
		$.ajax({
			type: "GET",
		 	url: "/projects/install/" + $( this ).attr( 'data-projectId' ),
			success: function( response )
			{
				$( "#projectSpinner" ).remove();
				
				$( '#installManual > div.card-body' ).html( response );
				$( '#install-manual-modal' ).modal( 'toggle' );
				$( '#btnEditInstallManual').show();
			},
			error: function()
			{
				$( "#projectSpinner" ).remove();
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
	
	$( '#install-manual-modal' ).on( 'click', '#btnEditInstallManual', function( e )
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

	// Submit Delete Form
	$( '#btnDeleteProject' ).on( 'click', function( e )
	{
		var form	= $( '#formDeleteProject' );
		$.ajax({
			type: "POST",
		 	url: form.attr( 'action' ),
		 	data: form.serialize(),
		 	dataType: 'json',
			success: function( response )
			{
				form[0].reset();
				if ( response.status == 'error' ) {
					alert( "FORM ERROR!!!" );

				} else {
					$( '#delete-project-modal' ).modal( 'toggle' );
					
					$( '#submitMessage > div.card-body' ).html( 'Successfuly deleting project.' );
					$( '#submitMessage' ).show();
					$( '#sectionProjects' ).html( response.data );
				}
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
		
	$( '#create-project-modal' ).on( 'click', '#btnSaveProject', function( e )
	{
		var form	= $( '#formProject' );
		
		$.ajax({
			type: "POST",
		 	url: form.attr( 'action' ),
		 	data: form.serialize(),
		 	dataType: 'json',
			success: function( response )
			{
				form[0].reset();
				if ( response.status == 'error' ) {
					
					if ( response.errType == 'alert' ) {
						alert( response.data );
						return;
					}
					
					var ul = $( '<ul>' );
					$.each( response.errors, function( key, value ) {
						ul.append(
    				        $( document.createElement( 'li' ) ).text( key + ': ' + value )
    				    );
					});
					
					$( '#errorMessage > div.card-body' ).html( ul );
					$( '#errorMessage' ).show();
				} else {
					$( '#create-project-modal' ).modal( 'toggle' );
					
					$( '#submitMessage > div.card-body' ).html( 'Successfuly adding project.' );
					$( '#submitMessage' ).show();
					$( '#sectionProjects' ).html( response.data );
				}
			},
			error: function(  )
			{
				alert( "SYSTEM ERROR!!!" );
			}
       });
	});
	
	$( '#create-category-modal' ).on( 'click', '#btnSaveCategory', function( e )
	{
		
		var form	= $( '#formCategory' );
		alert( form.attr( 'action' ) );
		$.ajax({
			type: "POST",
		 	url: form.attr( 'action' ),
		 	data: form.serialize(),
		 	dataType: 'json',
			success: function( response )
			{
				form[0].reset();
				if ( response.status == 'error' ) {
					var ul = $( '<ul>' );
					$.each( response.errors, function( key, value ) {
						ul.append(
    				        $( document.createElement( 'li' ) ).text( key + ': ' + value )
    				    );
					});
					
					$( '#errorMessage > div.card-body' ).html( ul );
					$( '#errorMessage' ).show();
				} else {
					$( '#create-project-modal' ).modal( 'toggle' );
					
					$( '#submitMessage > div.card-body' ).html( 'Successfuly create category.' );
					$( '#submitMessage' ).show();
					$( '#sectionProjects' ).html( response.data );
				}
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
       });
	});
});

