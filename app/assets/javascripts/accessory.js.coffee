jQuery ->
	$('body').on 'change', ".accessory", (event) ->
		$.ajax({
			url: $(this).data('url'),
			data: { accessory: {owned: this.value}},
			type: 'put',
			dataType: 'json',
			success: (data) ->
	    	$('#row_'+data.id).effect('pulsate')
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})