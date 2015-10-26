jQuery ->
	$('body').on 'change', ".recruit", (event) ->
		$.ajax({
			url: $(this).data('url'),
			data: { recruit: {level: this.value}},
			type: 'put',
			dataType: 'json',
			success: (data) ->
	    	$('#row_'+data.id).effect('pulsate')
	    	$('#attack_'+data.id).text(data.attack)
	    	$('#defense_'+data.id).text(data.defense)
	    	$('#eAtt_'+data.id).text(data.e_attack)
	    	$('#eDef_'+data.id).text(data.e_defense)
	    	$('#attack_w_mods_'+data.id).text(data.attack_with_mods)
	    	$('#defense_w_mods_'+data.id).text(data.defense_with_mods)
	    	$('#eAtt_w_bonus_'+data.id).text(data.e_attack_with_bonus)
	    	$('#eDef_w_bonus_'+data.id).text(data.e_defense_with_bonus)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})
  
	$('body').on 'change', ".recruitp", (event) ->
		$.ajax({
			url: $(this).data('url'),
			data: { recruit: {promote_level: this.value}},
			type: 'put',
			dataType: 'json',
			success: (data) ->
	    	$('#row_'+data.id).effect('pulsate')
	    	$('#attack_'+data.id).text(data.attack)
	    	$('#defense_'+data.id).text(data.defense)
	    	$('#eAtt_'+data.id).text(data.e_attack)
	    	$('#eDef_'+data.id).text(data.e_defense)
	    	$('#attack_w_mods_'+data.id).text(data.attack_with_mods)
	    	$('#defense_w_mods_'+data.id).text(data.defense_with_mods)
	    	$('#eAtt_w_bonus_'+data.id).text(data.e_attack_with_bonus)
	    	$('#eDef_w_bonus_'+data.id).text(data.e_defense_with_bonus)
			error: (data) ->
				errors = $.parseJSON(data.responseText).errors
				alert(errors.join('\n'))
		})