class Azorah < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('weapons','Blindfaith, Blade')
    attack += 3 if profile.inventory_exists?('weapons','Pristine Chakram')

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

    defense += 2 if profile.inventory_exists?('items','Pristine Shield')
    defense += 4 if profile.inventory_exists?('items','Pristine Plate')

    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    defense_rune = profile.defense_rune
    e_attack = super
    
    defense_rune += defense_rune * (2 + (recruit.level * 0.25))

    e_attack = (profile.ri_attack + (profile.defense + defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    defense_rune = profile.defense_rune
    e_defense = super
    
    defense_rune += defense_rune * (2 + (recruit.level * 0.25))
    
    e_defense = ((profile.defense + defense_rune + profile.defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
