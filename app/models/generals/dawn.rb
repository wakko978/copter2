class Dawn < General
  def has_special_leveling_increment?
    false
  end
  
  def special_leveling_increment(recruit,stat)
    # case recruit.level
    # when 1
    #   return 0
    # when 2, 3, 4
    #   return 2 * (recruit.level - 1)
    # else
    #   return 6 + recruit.level - 4
    # end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('weapons','Shimmering Blade')

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

    defense += 4 if profile.inventory_exists?('items','Aegis of Dawn')
    
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    attack = profile.attack
    defense = profile.defense
    attack_rune = profile.attack_rune
    defense_rune = profile.defense_rune
    attack_ia = profile.attack_ia
    defense_ia = profile.defense_ia
    e_attack = super

    ## Aesir example
    # case recruit.level
    # when 1
    #   e_attack += 0.01 * e_attack
    # when 2
    #   e_attack += 0.02 * e_attack
    # when 3
    #   e_attack += 0.03 * e_attack
    # when 4
    #   e_attack += 0.04 * e_attack
    # else
    #   e_attack += 0.04 * e_attack
    # end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    attack = profile.attack
    defense = profile.defense
    attack_rune = profile.attack_rune
    defense_rune = profile.defense_rune
    attack_ia = profile.attack_ia
    defense_ia = profile.defense_ia
    e_defense = super
    return e_defense.round(1)
  end
end
