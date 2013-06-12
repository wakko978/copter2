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
    defense_rune = profile.defense_rune
    e_attack = super
    
    case recruit.level
    when 1
      defense_rune += defense_rune * 1.005
    when 2
      defense_rune += defense_rune * 1.006
    when 3, 4
      defense_rune += defense_rune * 1.007
    end

    e_attack = (profile.ri_attack + (profile.defense + defense_rune + profile.defense_ia)*0.7).round(1)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    defense_rune = profile.defense_rune
    e_defense = super
    
    case recruit.level
    when 1
      defense_rune += defense_rune * 1.005
    when 2
      defense_rune += defense_rune * 1.006
    when 3, 4
      defense_rune += defense_rune * 1.007
    end
    
    e_defense = ((profile.defense + defense_rune + profile.defense_ia) + profile.ri_attack*0.7).round(1)
    return e_defense.round(1)
  end
end
