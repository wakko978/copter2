class Odin < General
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

    ### Strider example
    # attack += 3 if profile.inventory_exists?('weapons','Assassins Blade')
    # attack += 2 if profile.inventory_exists?('items','Amulet of Despair')

    ### Penelope
    # attack += 3 if profile.inventory_exists?('weapons','Scepter of Light')
    return attack
  end

  def defense_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's defense on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    defense = super

    ### Strider
    # defense += 5 if profile.inventory_exists?('items','Assassins Cloak')

    ### Penelope example
    # Nothing to do as nothing modifies Penelope's defense
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    
    e_attack = super

    # if (alliance = profile.recruits.includes(:general).where("generals.name = 'Aesir'").first)
    #   case alliance.level
    #   when 1
    #     mod = 0.01 * 0.5
    #   when 2
    #     mod = 0.02 * 0.5
    #   when 3
    #     mod = 0.03 * 0.5
    #   when 4
    #     mod = 0.04 * 0.5
    #   else
    #     mod = 0.04 * 0.5
    #   end
    # else
    #   mod = 0
    # end
    # case recruit.level
    # when 1
    #   e_attack += (0.02 + mod) * e_attack
    # when 2
    #   e_attack += (0.03 + mod) * e_attack
    # when 3
    #   e_attack += (0.04 + mod) * e_attack
    # when 4
    #   e_attack += (0.05 + mod) * e_attack
    # else
    #   e_attack += (0.05 + mod) * e_attack
    # end
    
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
