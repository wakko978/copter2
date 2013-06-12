class Dexter < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 1 if profile.inventory_exists?('weapons','Gorlaks Axe')

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

    defense += 1 if profile.inventory_exists?('items','Retribution Plate')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    defense = profile.defense
    case recruit.level
    when 1, 2, 3, 4
      defense += recruit.level + 2
    when 5..50
      defense += step_function(recruit.level,{pos_index: 2, offset: 3, period: 2})
    end
    
    e_attack = (profile.ri_attack + (defense + profile.defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense = profile.defense
    case recruit.level
    when 1, 2, 3, 4
      defense += recruit.level + 2
    when 5..50
      defense += step_function(recruit.level,{pos_index: 2, offset: 3, period: 2})
    end
    
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
