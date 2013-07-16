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

    if (alliance = profile.recruits.includes(:general).where("generals.name = 'Annika'").first)
      case alliance.level
      when 1
        mod = 0.02 * 0.5
      when 2
        mod = 0.03 * 0.5
      when 3
        mod = 0.04 * 0.5
      when 4
        mod = 0.05 * 0.5
      else
        mod = 0.05 * 0.5
      end
    else
      mod = 0
    end
    if (alliance = profile.recruits.includes(:general).where("generals.name = 'Aesir'").first)
      case alliance.level
      when 1
        mod2 = 0.01 * 0.33
      when 2
        mod2 = 0.02 * 0.33
      when 3
        mod2 = 0.03 * 0.33
      when 4
        mod2 = 0.04 * 0.33
      else
        mod2 = 0.04 * 0.33
      end
      mod2.round(3)
    else
      mod2 = 0
    end
    case recruit.level
    when 1
      e_attack += (0.02 + mod + mod2) * e_attack
    when 2
      e_attack += (0.03 + mod + mod2) * e_attack
    when 3
      e_attack += (0.04 + mod + mod2) * e_attack
    when 4
      e_attack += (0.05 + mod + mod2) * e_attack
    else
      e_attack += (0.05 + mod + mod2) * e_attack
    end
    
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
