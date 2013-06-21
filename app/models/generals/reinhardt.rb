class Reinhardt < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 1 if profile.inventory_exists?('weapons','Exorcist Cross')

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

    defense += 2 if profile.inventory_exists?('items','Crossguard Plate')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      defense += 3
    when 2
      defense += 5
    when 3
      defense += 7
    when 4..50
      defense += step_function(recruit.level,{pos_index: 4, offset: 5, period: 2})
    end
    
    e_attack = (attack + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      defense += 3 + 5
    when 2
      defense += 5 + 8
    when 3
      defense += 7 + 13
    when 4..50
      defense += step_function(recruit.level,{pos_index: 4, offset: 5, period: 2}) + (recruit.level + 2)*3
    end
    
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
