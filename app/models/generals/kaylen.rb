class Kaylen < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('weapons','Stormwind Saber')

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

    defense += 2 if profile.inventory_exists?('items','Azure Armor')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    attack = profile.attack
    count = profile.recruits.count
    case recruit.level
    when 1
      attack += count * 0.04
    when 2
      attack += count * 0.07
    when 3
      attack += count * 0.1
    when 4
      attack += count * 0.15
    when 5..50
      attack += count * (0.150 + (recruit.level - 4) * 0.006)
    end
    
    e_attack = ((attack + profile.attack_rune + profile.attack_ia) + profile.ri_defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.attack
    count = profile.recruits.count
    case recruit.level
    when 1
      attack += count * 0.04
    when 2
      attack += count * 0.07
    when 3
      attack += count * 0.1
    when 4
      attack += count * 0.15
    when 5..50
      attack += count * (0.150 + (recruit.level - 4) * 0.006)
    end
    
    e_defense = (profile.ri_defense + (attack + profile.attack_rune + profile.attack_ia)*0.7)
    return e_defense.round(1)
  end
end
