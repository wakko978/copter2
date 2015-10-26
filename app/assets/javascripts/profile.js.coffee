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

  $('body').on 'change', '#general_file', (event) ->
    $.ajax({
      url: $('#general_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        generalFileSelect(data)
    })

  $('body').on 'change', '#soldier_file', (event) ->
    $.ajax({
      url: $('#soldier_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        soldierFileSelect(data)
    })

  $('body').on 'change', '#item_file', (event) ->
    $.ajax({
      url: $('#item_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        itemFileSelect(data)
    })

  $('body').on 'change', '#magic_file', (event) ->
    $.ajax({
      url: $('#magic_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        magicFileSelect(data)
    })

  $('body').on 'change', '#land_file', (event) ->
    $.ajax({
      url: $('#land_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        landFileSelect(data)
    })

  $('body').on 'change', '#keep_file', (event) ->
    $.ajax({
      url: $('#keep_file').data('url'),
      type: 'get',
      dataType: 'json',
      success: (data) ->
        keepFileSelect(data)
    })

  $('body').on 'click', '#reset_form', (event) ->
    $('#parse_output').empty()
    $('#data_output').empty()

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

this.generalFileSelect = (current_generals) ->
  files = $('#general_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  general_file = files[0]
  unless general_file.name.match(/generals\.(php|php.html|php.htm|html|htm)/)
    alert "Not a generals file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_generals) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)
      
      doc.find("div div .generalSmallContainer2").each((i,e) ->
        t = $(this)
        general = t.find("div .general_name_div3_padding").text().trim()
        level = /\d+/.exec(t.find('div:contains("Level"):last').text().trim())[0]
        promo = parseInt(/.*banner_star_(\d).*/.exec(t.find("div .stars img[src]")[0].src)[1])
        if !current_generals[general] or current_generals[general] != (level + ":" + promo)
          output.push "<dd>" + general + ": " + level + ":" + promo + "</dd>"
          to_update[general] = level + ":" + promo
      )

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Generals:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#general_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Generals Updated:</b><br/>' +  data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Generals:</b><br/><dd>Nothing to update</dd>')
  )(general_file,current_generals)

  # Read in the text file as a string.
  blob = general_file.slice(0, general_file.size + 1)
  reader.readAsBinaryString blob

this.soldierFileSelect = (current_soldiers) ->
  files = $('#soldier_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  soldier_file = files[0]
  unless soldier_file.name.match(/soldiers\.(php|php.html|php.htm|html|htm)/)
    alert "Not a soldiers file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_soldiers) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)
      soldiers = doc.find("div[style*=town_unit_bar]").each((i,e) ->
        t = $(this)
        soldier = t.find("div div strong:first").text().trim()
        attack = t.find('div div div:contains("Attack")').text().match(/\d+/)[0]
        defense = t.find('div div div:contains("Defense")').text().match(/\d+/)[0]
        amount = t.find('div div span:contains("Owned:")').text().match(/\d+/)[0]
        if !current_soldiers[soldier] or (current_soldiers[soldier][0] != amount && current_soldiers[soldier][1] == attack && current_soldiers[soldier][2] == defense)
          output.push "<dd>" + soldier + ": " + amount + "</dd>"
          to_update[soldier] = {owned: amount, attack: attack, defense: defense}
      )

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Soldiers:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#soldier_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Soldiers Updated:</b><br/>' +  data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Soldiers:</b><br/><dd>Nothing to update</dd>')
  )(soldier_file,current_soldiers)

  # Read in the text file as a string.
  blob = soldier_file.slice(0, soldier_file.size + 1)
  reader.readAsBinaryString blob

this.itemFileSelect = (current_items) ->
  files = $('#item_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  item_file = files[0]
  unless item_file.name.match(/item\.(php|php.html|php.htm|html|htm)/)
    alert "Not an item file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_items) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)
      items = doc.find("div[style*=town_unit_bar]").each((i,e) ->
        t = $(this)
        item = t.find("div div strong:first").text().trim()
        if item.length > 0
          attack = t.find('div div div:contains("Attack")').text().match(/\d+/)[0]
          defense = t.find('div div div:contains("Defense")').text().match(/\d+/)[0]
          amount = t.find('div div span:contains("Owned:")').text().match(/\d+/)[0]
          if !current_items[item] or (current_items[item][0] != amount && current_items[item][1] == attack && current_items[item][2] == defense)
            output.push "<dd>" + item + ": " + amount + "</dd>"
            to_update[item] = {owned: amount, attack: attack, defense: defense}
      )

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Items & Weapons:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#item_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Items & Weapons Updated:</b><br/>' +  data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Items & Weapons:</b><br/><dd>Nothing to update</dd>')
  )(item_file,current_items)

  # Read in the text file as a string.
  blob = item_file.slice(0, item_file.size + 1)
  reader.readAsBinaryString blob

this.magicFileSelect = (current_powers) ->
  files = $('#magic_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  magic_file = files[0]
  unless magic_file.name.match(/magic\.(php|php.html|php.htm|html|htm)/)
    alert "Not a magic file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_powers) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)
      items = doc.find("div[style*=town_unit_bar]").each((i,e) ->
        t = $(this)
        magic = t.find("div div strong:first").text().trim()
        attack = t.find('div div div:contains("Attack")').text().match(/\d+/)[0]
        defense = t.find('div div div:contains("Defense")').text().match(/\d+/)[0]
        amount = t.find('div div span:contains("Owned:")').text().match(/\d+/)[0]
        if !current_powers[magic] or (current_powers[magic][0] != amount && current_powers[magic][1] == attack && current_powers[magic][2] == defense)
          output.push "<dd>" + magic + ": " + amount + "</dd>"
          to_update[magic] = {owned: amount, attack: attack, defense: defense}
      )

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Magic:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#magic_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Magic Updated:</b><br/>' +  data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Magic:</b><br/><dd>Nothing to update</dd>')
  )(magic_file,current_powers)

  # Read in the text file as a string.
  blob = magic_file.slice(0, magic_file.size + 1)
  reader.readAsBinaryString blob
  
this.landFileSelect = (current_lands) ->
  files = $('#land_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  land_file = files[0]
  unless land_file.name.match(/land\.(php|php.html|php.htm|html|htm)/)
    alert "Not a land file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_lands) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)

      doc.find("div[style*=town_land_bar]").each((i,e) ->
        t = $(this)
        land = t.find("div div strong:first").text().trim()
        amount = t.find('div div span:contains("Owned:")').text().match(/\d+/)[0]
        if !current_lands[land] or current_lands[land] != amount
          output.push "<dd>" + land + ": " + amount + "</dd>"
          to_update[land] = amount
      )

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Land:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#land_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Land Updated:</b><br/>' +  data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Land:</b><br/><dd>Nothing to update</dd>')
  )(land_file,current_lands)

  # Read in the text file as a string.
  blob = land_file.slice(0, land_file.size + 1)
  reader.readAsBinaryString blob

this.keepFileSelect = (current_stats) ->
  files = $('#keep_file')[0].files
  unless files.length
    alert "Please select a file!"
    return
  keep_file = files[0]
  unless keep_file.name.match(/keep\.(php|php.html|php.htm|html|htm)/)
    alert "Not a keep file"
    return

  reader = new FileReader()
  output = []

  # Closure to capture the file information.
  reader.onload = ((theFile,current_stats) ->
    (e) ->
      to_update = {}
      doc = $(e.target.result)

      level = parseInt(doc.find("a div:contains('Level:'):last").text().match(/\d+/)[0])
      energy = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(0).text(), 10)
      stamina = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(1).text(), 10)
      attack = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(2).text(), 10)
      defense = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(3).text(), 10)
      health = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(4).text(), 10)
      army_size = parseInt(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(5).text(), 10)
      attack_ia = parseInt(/(\d+) Item Archive Bonus/.exec(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(2).text())[1], 10)
      defense_ia = parseInt(/(\d+) Item Archive Bonus/.exec(doc.find('#app_body').find('div[style="width:240px;height:54px;overflow:hidden;"]').eq(3).text())[1], 10)
      attack_rune = parseInt(/(\d+).*(Atk|Attack)/.exec(doc.find('div#runes_2').text())[1], 10)
      defense_rune = parseInt(/(\d+).*(Def|Defense)/.exec(doc.find('div#runes_2').text())[1], 10)
      health_rune = parseInt(/(\d+).*(Hth|Health)/.exec(doc.find('div#runes_2').text())[1], 10)
      damage_rune = parseInt(/(\d+).*(Dmg|Damage)/.exec(doc.find('div#runes_2').text())[1], 10)
      
      output.push "<dd>Level: " + level + "</dd>" unless current_stats['level'] == level
      to_update['level'] = level
      output.push "<dd>Energy: " + energy + "</dd>" unless current_stats['energy'] == energy
      to_update['energy'] = energy
      output.push "<dd>Stamina: " + stamina + "</dd>" unless current_stats['stamina'] == stamina
      to_update['stamina'] = stamina
      output.push "<dd>Attack: " + attack + "</dd>" unless current_stats['attack'] == attack
      to_update['attack'] = attack
      output.push "<dd>Defense: " + defense + "</dd>" unless current_stats['defense'] == defense
      to_update['defense'] = defense
      output.push "<dd>Health: " + health + "</dd>" unless current_stats['health'] == health
      to_update['health'] = health
      output.push "<dd>Army Size: " + army_size + "</dd>" unless current_stats['army_size'] == army_size
      to_update['army_size'] = army_size
      output.push "<dd>Attack IA: " + attack_ia + "</dd>" unless current_stats['attack_ia'] == attack_ia
      to_update['attack_ia'] = attack_ia
      output.push "<dd>Defense IA: " + defense_ia + "</dd>" unless current_stats['defense_ia'] == defense_ia
      to_update['defense_ia'] = defense_ia
      output.push "<dd>Attack Rune: " + attack_rune + "</dd>" unless current_stats['attack_rune'] == attack_rune
      to_update['attack_rune'] = attack_rune
      output.push "<dd>Defense Rune: " + defense_rune + "</dd>" unless current_stats['defense_rune'] == defense_rune
      to_update['defense_rune'] = defense_rune
      output.push "<dd>Health Rune: " + health_rune + "</dd>" unless current_stats['health_rune'] == health_rune
      to_update['health_rune'] = health_rune
      output.push "<dd>Damage Rune: " + damage_rune + "</dd>" unless current_stats['damage_rune'] == damage_rune
      to_update['damage_rune'] = damage_rune

      if output.length
        $('#parse_output').html($('#parse_output').html() + "<br/><b>Stats:</b><br/>" + output.join(""))
        $('body').on 'click', "#update_button", (event) ->
          $.ajax({
            url: $('#keep_file').data('update'),
            type: 'post',
            data: {to_update},
            dataType: 'html',
            success: (data) ->
              $('#data_output').html($('#data_output').html() + '<br/><b>Stats Updated:</b><br/>' + data)
              $('body').off('click', '#update_button')
              $('#my_form')[0].reset()
          })
      else
        $('#parse_output').html($('#parse_output').html() + '<br/><b>Stats:</b><br/><dd>Nothing to update</dd>')
  )(keep_file,current_stats)

  # Read in the text file as a string.
  blob = keep_file.slice(0, keep_file.size + 1)
  reader.readAsBinaryString blob