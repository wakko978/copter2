class Annika < General
  def piercing(recruit)
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.piercing * 0.5).floor
      mod2 = (alliance.tertiary.piercing * 0.33).floor unless alliance.tertiary.nil?
    end
      
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10 + mod1 + mod2
    else
      return 50 + mod1 + mod2
    end
    # unless recruit.profile.recruits.includes(:general).where("generals.name = 'Odin'").first
    #   if (alliance = recruit.profile.recruits.includes(:general).where("generals.name = 'Aesir'").first)
    #     case alliance.level
    #     when 1..4
    #       mod = (alliance.level * 10) * 0.5
    #     else
    #       mod = 40 * 0.5
    #     end
    #   else
    #     mod = 0
    #   end
    # else
    #   mod = 0
    # end
    # case recruit.level
    # when 1..4
    #   return (recruit.level + 1) * 10 + mod
    # else
    #   return 50 + mod
    # end
  end
  
  def resistance(recruit)
    super
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('items','Devarian Cloak')

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

    defense += 3 if profile.inventory_exists?('items','Templars Mask')
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    puts e_attack
    e_attack += (piercing(recruit) / 1000.0) * e_attack
    puts piercing(recruit)
    puts e_attack
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end