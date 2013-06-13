class Suri < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('weapons','Windthorn Wand')

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
    
    defense += 2 if profile.inventory_exists?('items','Guilded Tiara')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    defense = profile.defense
    count = profile.recruits.count
    case recruit.level
    when 1
      defense += count * 0.05
    when 2
      defense += count * 0.1
    when 3
      defense += count * 0.15
    when 4
      defense += count * 0.2
    when 5..50
      defense += count * (0.20 + (recruit.level - 4) * 0.003)
    end
    
    e_attack = (profile.ri_attack + (defense + profile.defense_rune + profile.defense_ia)*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense = profile.defense
    count = profile.recruits.count
    case recruit.level
    when 1
      defense += count * 0.05
    when 2
      defense += count * 0.1
    when 3
      defense += count * 0.15
    when 4
      defense += count * 0.2
    when 5..50
      defense += count * (0.20 + (recruit.level - 4) * 0.003)
    end
    
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + profile.ri_attack*0.7)
    return e_defense.round(1)
  end
end
