class Adaya < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','True Flight Bow')

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
    
    defense += 3 if profile.inventory_exists?('items','True Flight Glove')
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    ## e_attack = (ri_attack + ri_defense*0.7).round(1)
    ## ri_attack = attack + attack_rune + attack_ia
    case recruit.level
    when 1
      e_attack = (profile.attack + (profile.attack_rune*1.05) + profile.attack_ia) + profile.ri_defense*0.7
    when 2
      e_attack = (profile.attack + (profile.attack_rune*1.06) + profile.attack_ia) + profile.ri_defense*0.7
    when 3
      e_attack = (profile.attack + (profile.attack_rune*1.07) + profile.attack_ia) + profile.ri_defense*0.7
    when 4
      e_attack = (profile.attack + (profile.attack_rune*1.08) + profile.attack_ia) + profile.ri_defense*0.7
    when 5
      e_attack = (profile.attack + (profile.attack_rune*1.09) + profile.attack_ia) + profile.ri_defense*0.7
    else
      e_attack = (profile.attack + (profile.attack_rune*1.09) + profile.attack_ia) + profile.ri_defense*0.7
    end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    ## e_defense = (ri_defense + ri_attack*0.7).round(1)
    ## ri_defense = defense + defense_rune + defense_ia
    case recruit.level
    when 1
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.05) + profile.attack_ia)*0.7
    when 2
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.06) + profile.attack_ia)*0.7
    when 3
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.07) + profile.attack_ia)*0.7
    when 4
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.08) + profile.attack_ia)*0.7
    when 5
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.09) + profile.attack_ia)*0.7
    else
      e_defense = profile.ri_defense + (profile.attack + (profile.attack_rune*1.09) + profile.attack_ia)*0.7
    end
    return e_defense.round(1)
  end
end
