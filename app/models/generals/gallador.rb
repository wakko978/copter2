class Gallador < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 1 if profile.inventory_exists?('weapons','Divinity Mace')

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

    defense += 2 if profile.inventory_exists?('items','Divinity Plate')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    count = profile.inventory_count('soldiers','Valor Knights') / 50
    case recruit.level
    when 1
      defense += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      defense += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      defense += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      defense += count > 10 ? 10 : count
    when 5..50
      max = step_function(recruit.level,{pos_index: -2, multiplier: 3, offset: 4, period: 3})
      defense += count > max ? max : count
    end
    e_attack = (attack + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    count = profile.inventory_count('soldiers','Valor Knights') / 50
    case recruit.level
    when 1
      defense += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      defense += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      defense += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      defense += count > 10 ? 10 : count
    when 5..50
      max = step_function(recruit.level,{pos_index: -2, multiplier: 3, offset: 4, period: 3})
      defense += count > max ? max : count
    end
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
