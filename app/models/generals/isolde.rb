class Isolde < General
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
    e_attack = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    tristram = profile.recruits.includes(:general).where("generals.name = 'Tristram'").first
    case recruit.level
    when 1
      defense += 4 if tristram
    when 2
      defense += 5 if tristram
    when 3
      defense += 6 if tristram
    when 4
      defense += 7 if tristram
    when 5..50
      defense += (recruit.level * 2) - 1 if tristram
    end
    
    e_attack = (attack + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    tristram = profile.recruits.includes(:general).where("generals.name = 'Tristram'").first
    case recruit.level
    when 1
      defense += 4 if tristram
    when 2
      defense += 5 if tristram
    when 3
      defense += 6 if tristram
    when 4
      defense += 7 if tristram
    when 5..50
      defense += (recruit.level * 2) - 1 if tristram
    end
    
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
