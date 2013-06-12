class Dante < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 1 if profile.inventory_exists?('powers','Breath of Fire')
    attack += 2 if profile.inventory_exists?('weapons','Fiery Blade')

    ### Penelope
    # Nothing as no gear modifies Penelope's attack
    return attack
  end

  def defense_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's defense on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    defense = super

    ### Strider
    # Nothing as no gear modifies Strider's defense

    defense += 3 if profile.inventory_exists?('items','Shield of Dante')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    defense = profile.defense
    attack = profile.attack
    case recruit.level
    when 1
      defense += 4
      attack -= 5
    when 2
      defense += 8
      attack -= 10
    when 3
      defense += 12
      attack -= 15
    when 4, 5
      defense += 20
      attack -= 25
    when 5..50
      defense += step_function(recruit.level,{pos_index: 15, offset: 5, period: 2})
      attack -= step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    
    e_attack = ((attack + profile.attack_rune + profile.attack_ia) + (defense + profile.defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense = profile.defense
    attack = profile.attack
    case recruit.level
    when 1
      defense += 4
      attack -= 5
    when 2
      defense += 8
      attack -= 10
    when 3
      defense += 12
      attack -= 15
    when 4, 5
      defense += 20
      attack -= 25
    when 5..50
      defense += step_function(recruit.level,{pos_index: 15, offset: 5, period: 2})
      attack -= step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + (attack + profile.attack_rune + profile.attack_ia)*0.7).round(1)
    return e_defense.round(1)
  end
end
