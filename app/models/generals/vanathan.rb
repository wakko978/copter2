class Vanathan < General
  def resistance(recruit)
    mod = 0
    if (alliance = recruit.profile.recruits.includes(:general).where("generals.name = 'Vanir'").first)
      case alliance.level
      when 1..4
        mod = (recruit.level * 10) * 0.5
      else
        mod = 40 * 0.5
      end
    else
      mod = 0
    end
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10 + mod
    else
      return 50 + mod
    end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','Lightstrike Sword')

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

    defense += 4 if profile.inventory_exists?('items','Lightstead Plate')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    e_defense += (resistance(recruit) / 1000) * e_defense

    return e_defense.round(1)
  end
end
