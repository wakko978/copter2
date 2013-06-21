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
    
    attack_rune = profile.attack_rune
    attack = profile.attack + profile.attack_ia + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    attack_rune += attack_rune * (2 + ((recruit.level - 1) * 0.25)) * 0.01
    
    case recruit.level
    when 1
      attack_rune += attack_rune * 0.05
    when 2
      attack_rune += attack_rune * 0.06
    when 3
      attack_rune += attack_rune * 0.07
    when 4
      attack_rune += attack_rune * 0.08
    when 5..50
      attack_rune += attack_rune * 0.09
    end
    
    e_attack = (attack + attack_rune + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack_rune = profile.attack_rune
    attack = profile.attack + profile.attack_ia + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      attack_rune += attack_rune * 0.05
    when 2
      attack_rune += attack_rune * 0.06
    when 3
      attack_rune += attack_rune * 0.07
    when 4
      attack_rune += attack_rune * 0.08
    when 5..50
      attack_rune += attack_rune * 0.09
    end
    
    e_defense = (defense + (attack + attack_rune)*0.7)
    return e_defense.round(1)
  end
end
