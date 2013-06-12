class Arielle < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit)
    case recruit.level
    when 1
      return 0
    when 2, 3, 4
      return 2 * (recruit.level - 1)
    else
      return 6 + recruit.level - 4
    end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','Blade of Arielle')
    
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

    defense += 2 if profile.inventory_exists?('items','Armor of Arielle')
    defense += 1 if profile.inventory_exists?('items','Shield of Arielle')
      
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    ## Aesir example
    # case recruit.level
    # when 1
    #   e_attack += 0.01 * profile.e_attack
    # when 2
    #   e_attack += 0.02 * profile.e_attack
    # when 3
    #   e_attack += 0.03 * profile.e_attack
    # when 4
    #   e_attack += 0.04 * profile.e_attack
    # else
    #   e_attack += 0.04 * profile.e_attack
    # end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
