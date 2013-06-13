class Kolrath < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','Bloodcleave')

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

    defense += 4 if profile.inventory_exists?('items','Bloodlords Helm')
    defense += 3 if profile.inventory_exists?('items','Bloodlords Plate')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    attack_rune = profile.attack_rune
    e_attack = super
    
    attack_rune += attack_rune * (2 + ((recruit.level - 1) * 0.25))

    e_attack = ((profile.attack + attack_rune + profile.attack_ia) + profile.ri_defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    attack_rune = profile.attack_rune
    e_defense = super
    
    attack_rune += attack_rune * (2 + ((recruit.level - 1) * 0.25))

    e_defense = (profile.ri_defense + (profile.attack + attack_rune + profile.attack_ia)*0.7)
    return e_defense.round(1)
  end
end
