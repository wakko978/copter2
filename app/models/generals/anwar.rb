class Anwar < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    ### Strider example
    # attack += 2 if profile.weapons.find{|p| p.name == 'Assassins Blade'}

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

    defense += 1 if profile.inventory_exists?('items','Wildwalker Tunic')
    
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
    
    count = profile.inventory_count('powers','Wolf Spirit') / 3
    case recruit.level
    when 1
      defense += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      defense += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      defense += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      defense += count > 10 ? 10 : count
    else
      defense += count > 10 ? 10 : count
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
    e_defense = super
    
    count = profile.inventory_count('powers','Wolf Spirit') / 3
    case recruit.level
    when 1
      defense += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      defense += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      defense += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      defense += count > 10 ? 10 : count
    else
      defense += count > 10 ? 10 : count
    end
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
