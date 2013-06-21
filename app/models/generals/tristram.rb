class Tristram < General
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
    isolde = profile.recruits.includes(:general).where("generals.name = 'Isolde'").first
    case recruit.level
    when 1
      attack += 4 if isolde
    when 2
      attack += 5 if isolde
    when 3
      attack += 6 if isolde
    when 4
      attack += 7 if isolde
    when 5..50
      attack += (recruit.level * 2) - 1 if isolde
    end
    
    e_attack = (attack + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    isolde = profile.recruits.includes(:general).where("generals.name = 'Isolde'").first
    case recruit.level
    when 1
      attack += 4 if isolde
    when 2
      attack += 5 if isolde
    when 3
      attack += 6 if isolde
    when 4
      attack += 7 if isolde
    when 5..50
      attack += (recruit.level * 2) - 1 if isolde
    end
    
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
