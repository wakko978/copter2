class Alyzia < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    ### Strider example
    attack += 1 if profile.inventory_exists?('weapons','Alyzias Greatsword')

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

    defense += 1 if profile.inventory_exists?('items','Alyzias Crest')
    defense += 1 if profile.inventory_exists?('items','Alyzias Heirloom')
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    
    defense = profile.defense
    count = profile.inventory_count('soldiers','Guardian of Alyzia')
    case recruit.level
    when 1
      defense += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 2
      defense += count > 50 ? 50 : count
    when 3
      defense += (count * 1.5) > 50 ? 50 : (count * 1.5)
    when 4
      defense += (count * 2.0) > 50 ? 50 : (count * 2.0)
    when 5..50
      max = step_function(recruit.level,{pos_index: 38, multiplier: 3, offset: 4, period: 3})
      defense += (count * 2.0) > max ? max : (count * 2.0)
    end
    e_attack = (profile.ri_attack + (defense + profile.defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense = profile.defense
    count = profile.inventory_count('soldiers','Guardian of Alyzia')
    case recruit.level
    when 1
      defense += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 2
      defense += count > 50 ? 50 : count
    when 3
      defense += (count * 1.5) > 50 ? 50 : (count * 1.5)
    when 4
      defense += (count * 2.0) > 50 ? 50 : (count * 2.0)
    when 5..50
      max = step_function(recruit.level,{pos_index: 38, multiplier: 3, offset: 4, period: 3})
      defense += (count * 2.0) > max ? max : (count * 2.0)
    end
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
