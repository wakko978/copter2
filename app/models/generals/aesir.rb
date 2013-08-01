class Aesir < General
  def piercing(recruit)
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.piercing * 0.5).floor
      mod2 = (alliance.tertiary.piercing * 0.33).floor unless alliance.tertiary.nil?
    end
    
    case recruit.level
    when 1..4
      return recruit.level * 10 + mod1 + mod2
    else
      return 40 + mod1 + mod2
    end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super
    attack += 2 if profile.inventory_exists?('weapons','Thundercrash')
    return attack
  end

  def defense_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's defense on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    defense = super
    defense += 1 if profile.inventory_exists?('items','Aesirs Battle Armor')
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    
    e_attack += (piercing(recruit) / 1000.0) * e_attack
    
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
