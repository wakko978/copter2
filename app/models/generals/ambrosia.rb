class Ambrosia < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    ### Strider example
    # attack += 2 if profile.weapons.find{|p| p.name == 'Assassins Blade'}
    
    # end
    # attack += 2 if profile.items.find{|p| p.name == 'Amulet of Despair'}
    #   attack += 2.0
    # end
    # attack += 2 if profile.items.find{|p| p.name == 'Assassins Cloak'}
    #   attack += 5.0
    # end

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

    ### Penelope example
    # attack += 2 if profile.weapons.find{|p| p.name == 'Scepter of Light'}
    
    # end
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

    count = profile.recruits.count
    case recruit.level
    when 1
      defense += count * 0.15
    when 2
      defense += count * 0.25
    when 3
      defense += count * 0.35
    when 4, 5
      defense += count * 0.45
    when 6..50
      defense += count * (0.450 + (recruit.level - 5) * 0.006)
    else
      defense += count * 0.48
    end
    e_attack = (profile.ri_attack + (defense + profile.defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    attack = profile.attack
    defense = profile.defense
    attack_rune = profile.attack_rune
    defense_rune = profile.defense_rune
    attack_ia = profile.attack_ia
    defense_ia = profile.defense_ia
    ri_attack = profile.ri_attack
    ri_defense = profile.ri_defense
    e_defense = super
    
    count = profile.recruits.count
    case recruit.level
    when 1
      defense += count * 0.15
    when 2
      defense += count * 0.25
    when 3
      defense += count * 0.35
    when 4, 5
      defense += count * 0.45
    when 6..50
      defense += count * (0.450 + ((recruit.level - 5) * 0.006))
    else
      defense += count * 0.48
    end
    e_defense = ((defense + defense_rune + defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
