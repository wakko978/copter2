class Bacalou < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('powers','Shadows Curse')
    attack += 2 if profile.inventory_exists?('weapons','Staff of Curses')

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
    e_attack = super
    
    defense_rune = profile.defense_rune
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.defense + profile.defense_ia + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      defense_rune += defense_rune * 1.005
    when 2
      defense_rune += defense_rune * 1.006
    when 3, 4
      defense_rune += defense_rune * 1.007
    end

    e_attack = (attack + (defense + defense_rune)*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense_rune = profile.defense_rune
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.defense + profile.defense_ia + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      defense_rune += defense_rune * 1.005
    when 2
      defense_rune += defense_rune * 1.006
    when 3, 4
      defense_rune += defense_rune * 1.007
    end
    
    e_defense = (defense + defense_rune + attack*0.7)
    return e_defense.round(1)
  end
end
