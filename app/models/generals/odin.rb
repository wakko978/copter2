class Odin < General
  def piercing(recruit)
    mod = 0
    if (alliance = recruit.profile.recruits.includes(:general).where("generals.name = 'Annika'").first)
      case alliance.level
      when 1..4
        mod += (alliance.level * 10) * 0.5
      else
        mod += 50 * 0.5
      end
    else
      mod += 0
    end
    if (alliance = recruit.profile.recruits.includes(:general).where("generals.name = 'Aesir'").first)
      case alliance.level
      when 1..4
        mod += ((alliance.level * 10) * 0.33).floor
      else
        mod += (40 * 0.33).floor
      end
    else
      mod += 0
    end
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10 + mod
    else
      return 50 + mod
    end
  end
  
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
    attack += 4 if profile.inventory_exists?('weapons','Gladiators Warstaff')
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
    defense += 1 if profile.inventory_exists?('items','Brawler Boots')
    defense += 2 if profile.inventory_exists?('items','Warriors Helm')
    defense += 4 if profile.inventory_exists?('items','Legends Wargear')

    ### Penelope example
    # Nothing to do as nothing modifies Penelope's defense
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    e_attack += (piercing(recruit) / 1000) * e_attack
    
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
