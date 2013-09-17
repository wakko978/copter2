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
  
  def attack_bonus(profile,recruit)
    bonus = super
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    defense_rune = profile.defense_rune
    case recruit.level
    when 1
      bonus += defense_rune * 1.005
    when 2
      bonus += defense_rune * 1.006
    when 3..General.max_level
      bonus += defense_rune * 1.007
    end
    return bonus.round()
  end
end
