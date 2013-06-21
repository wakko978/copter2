class Malekus < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case recruit.level
    when 1
      return 0
    when 2..5
      return recruit.level - 1
    when 6..50
      return 2 + (recruit.level - 4) * 2
    end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','Moltensteel Blade')
    attack += 3 if profile.inventory_exists?('weapons','Moltensteel Axe')

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

    defense += 4 if profile.inventory_exists?('items','Conquerors War Helm')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    count = profile.recruits.count
    case recruit.level
    when 1
      attack += count * 0.15
    when 2
      attack += count * 0.25
    when 3
      attack += count * 0.35
    when 4
      attack += count * 0.45
    when 5..50
      attack += count * (0.50 + (recruit.level - 5) * 0.006)
    end
    e_attack = (attack + defense*0.7)
    
    case recruit.level
    when 5..50
      e_attack += e_attack * (0.001 * step_function(recruit.level,{pos_index: -1, offset: 6, period: 2}))
    end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    count = profile.recruits.count
    case recruit.level
    when 1
      attack += count * 0.15
    when 2
      attack += count * 0.25
    when 3
      attack += count * 0.35
    when 4
      attack += count * 0.45
    when 5..50
      attack += count * (0.50 + (recruit.level - 5) * 0.006)
    end
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
