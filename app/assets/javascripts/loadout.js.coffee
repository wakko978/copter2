jQuery ->
	$('body').on 'change', "#loadout_general_id", (event) ->
		$.ajax({
			url: $('#loadout_general_id').data('url'),
			data: { recruit: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#general_piercing').text(data.piercing)
		    $('#general_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
		
	$('body').on 'change', "#loadout_weapon_id", (event) ->
		$.ajax({
			url: $('#loadout_weapon_id').data('url'),
			data: { weapon: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#weapon_piercing').text(data.piercing)
		    $('#weapon_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
		
	$('body').on 'change', "#loadout_shield_id", (event) ->
		$.ajax({
			url: $('#loadout_shield_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#shield_piercing').text(data.piercing)
		    $('#shield_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
    
	$('body').on 'change', "#loadout_banner_id", (event) ->
		$.ajax({
			url: $('#loadout_banner_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#banner_piercing').text(data.piercing)
		    $('#banner_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})

	$('body').on 'change', "#loadout_helmet_id", (event) ->
		$.ajax({
			url: $('#loadout_helmet_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#helmet_piercing').text(data.piercing)
		    $('#helmet_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
	
	$('body').on 'change', "#loadout_power_id", (event) ->
		$.ajax({
			url: $('#loadout_power_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#power_piercing').text(data.piercing)
		    $('#power_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
  
	$('body').on 'change', "#loadout_armor_id", (event) ->
		$.ajax({
			url: $('#loadout_armor_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#armor_piercing').text(data.piercing)
		    $('#armor_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
		
	$('body').on 'change', "#loadout_amulet_id", (event) ->
		$.ajax({
			url: $('#loadout_amulet_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#amulet_piercing').text(data.piercing)
		    $('#amulet_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
		
	$('body').on 'change', "#loadout_glove_id", (event) ->
		$.ajax({
			url: $('#loadout_glove_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#glove_piercing').text(data.piercing)
		    $('#glove_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
		
	$('body').on 'change', "#loadout_boot_id", (event) ->
		$.ajax({
			url: $('#loadout_boot_id').data('url'),
			data: { item: {id: this.value}},
			type: 'get',
			dataType: 'json',
			success: (data) ->
	    	$('#boot_piercing').text(data.piercing)
		    $('#boot_resistance').text(data.resistance)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})