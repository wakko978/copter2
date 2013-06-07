jQuery ->
	$('body').on 'change', "#income_bonus", (event) ->
		$.ajax({
			url: $('#income_bonus').data('url'),
			data: { profile: {income_bonus: this.value}},
			type: 'post',
			success: (data) ->
      	$("#properties").html(data)
		})
		
	$('body').on 'change', ".property", (event) ->
		$.ajax({
			url: $(this).data('url'),
			data: { property: {owned: this.value}},
			type: 'put',
			success: (data) ->
      	$("#properties").html(data)
		})
		false

	$('body').on 'click', ".togglable", (event) ->
		event.preventDefault()
		if $(this).data('remote')
			toggleAjaxDiv($(this).data('id'))
		else
			toggleDiv($(this).data('id'))

	$('body').on 'change', "#army_bonus", (event) ->
		$.ajax({
			url: $('#army_bonus').data('url'),
			data: { profile: {army_bonus: this.value}},
			type: 'post',
			success: (data) ->
      	$("#army_stats").html(data)
		})
	
	$('body').on 'change', "#profile_army_size", (event) ->
		$.ajax({
			url: $('#profile_army_size').data('url'),
			data: { profile: {army_size: this.value}},
			type: 'post',
			success: (data) ->
				unless( $('#army_stats').is(':empty') )
      		$("#army_stats").html(data)
		})
			
	$('body').on 'change', "#profile_level", (event) ->
		$.ajax({
			url: $('#profile_level').data('url'),
			data: { profile: {level: this.value}},
			type: 'post',
			success: (data) ->
				$('#bsi').text(data.bsi)
				$('#bsi').effect('pulsate')
				$('#rbsi').text(data.rbsi)
				$('#rbsi').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				$('#lsi').text(data.lsi)
				$('#lsi').effect('pulsate')
				$("#properties").html(data.html)
		})
		
	$('body').on 'change', "#profile_energy", (event) ->
		$.ajax({
			url: $('#profile_energy').data('url'),
			data: { profile: {energy: this.value}},
			type: 'post',
			success: (data) ->
				$('#lsi').text(data.lsi)
				$('#lsi').effect('pulsate')
		})

	$('body').on 'change', "#profile_stamina", (event) ->
		$.ajax({
			url: $('#profile_stamina').data('url'),
			data: { profile: {stamina: this.value}},
			type: 'post',
			success: (data) ->
				$('#lsi').text(data.lsi)
				$('#lsi').effect('pulsate')
		})
		
	$('body').on 'change', "#profile_health", (event) ->
		$.ajax({
			url: $('#profile_health').data('url'),
			data: { profile: {health: this.value}},
			type: 'post',
			success: (data) ->
				$('#profile_health').effect('pulsate')
		})
		
	$('body').on 'change', "#profile_health_rune", (event) ->
		$.ajax({
			url: $('#profile_health_rune').data('url'),
			data: { profile: {health_rune: this.value}},
			type: 'post',
			success: (data) ->
				$('#profile_health_rune').effect('pulsate')
		})
		
	$('body').on 'change', "#profile_damage_rune", (event) ->
		$.ajax({
			url: $('#profile_damage_rune').data('url'),
			data: { profile: {damage_rune: this.value}},
			type: 'post',
			success: (data) ->
				$('#profile_damage_rune').effect('pulsate')
		})
		
	$('body').on 'change', "#profile_attack", (event) ->
		$.ajax({
			url: $('#profile_attack').data('url'),
			data: { profile: {attack: this.value}},
			type: 'post',
			success: (data) ->
				$('#eAtt').text('eAtt:'+data.e_attack)
				$('#eAtt').effect('pulsate')
				$('#rAtt').text('rAtt:'+data.r_e_attack)
				$('#rAtt').effect('pulsate')
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#eDef').text('eDef:'+data.e_defense)
				$('#eDef').effect('pulsate')
				$('#rDef').text('rDef:'+data.r_e_defense)
				$('#rDef').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#bsi').text(data.bsi)
				$('#bsi').effect('pulsate')
				$('#rbsi').text(data.rbsi)
				$('#rbsi').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
				toggleAjaxDiv('army_stats',true)
		})
		
	$('body').on 'change', "#profile_attack_rune", (event) ->
		$.ajax({
			url: $('#profile_attack_rune').data('url'),
			data: { profile: {attack_rune: this.value}},
			type: 'post',
			success: (data) ->
				$('#rAtt').text('rAtt:'+data.r_e_attack)
				$('#rAtt').effect('pulsate')
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#rDef').text('rDef:'+data.r_e_defense)
				$('#rDef').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#rbsi').text(data.rbsi)
				$('#rbsi').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
		})
		
	$('body').on 'change', "#profile_attack_ia", (event) ->
		$.ajax({
			url: $('#profile_attack_ia').data('url'),
			data: { profile: {attack_ia: this.value}},
			type: 'post',
			success: (data) ->
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
		})
		
	$('body').on 'change', "#profile_defense", (event) ->
		$.ajax({
			url: $('#profile_defense').data('url'),
			data: { profile: {defense: this.value}},
			type: 'post',
			success: (data) ->
				$('#eAtt').text('eAtt:'+data.e_attack)
				$('#eAtt').effect('pulsate')
				$('#rAtt').text('rAtt:'+data.r_e_attack)
				$('#rAtt').effect('pulsate')
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#eDef').text('eDef:'+data.e_defense)
				$('#eDef').effect('pulsate')
				$('#rDef').text('rDef:'+data.r_e_defense)
				$('#rDef').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#bsi').text(data.bsi)
				$('#bsi').effect('pulsate')
				$('#rbsi').text(data.rbsi)
				$('#rbsi').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
				toggleAjaxDiv('army_stats',true)
		})

	$('body').on 'change', "#profile_defense_rune", (event) ->
		$.ajax({
			url: $('#profile_defense_rune').data('url'),
			data: { profile: {defense_rune: this.value}},
			type: 'post',
			success: (data) ->
				$('#rAtt').text('rAtt:'+data.r_e_attack)
				$('#rAtt').effect('pulsate')
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#rDef').text('rDef:'+data.r_e_defense)
				$('#rDef').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#rbsi').text(data.rbsi)
				$('#rbsi').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
		})

	$('body').on 'change', "#profile_defense_ia", (event) ->
		$.ajax({
			url: $('#profile_defense_ia').data('url'),
			data: { profile: {defense_ia: this.value}},
			type: 'post',
			success: (data) ->
				$('#riAtt').text('riAtt:'+data.ri_e_attack)
				$('#riAtt').effect('pulsate')
				$('#riDef').text('riDef:'+data.ri_e_defense)
				$('#riDef').effect('pulsate')
				$('#ribsi').text(data.ribsi)
				$('#ribsi').effect('pulsate')
				toggleAjaxDiv('duel_stats',true)
		})

this.toggleDiv = (id) ->
	$('#'+id).toggle()
	false

this.toggleAjaxDiv = (id,refresh) ->
	refresh = (typeof refresh != 'undefined') ? false : refresh
	if ($('#'+id).is(':empty') && !refresh) || (refresh && !$('#'+id).is(':empty'))
		$.ajax({
			url: $('#'+id).data('url'),
			type: 'get',
			dataType: 'html',
			success: (data) ->
      	$('#'+id).html(data)
		})
	else
		$('#'+id).empty()