class Keira < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('powers','Demon Strength')

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

    ## Aesir example
    # case recruit.level
    # when 1
    #   e_attack += 0.01 * e_attack
    # when 2
    #   e_attack += 0.02 * e_attack
    # when 3
    #   e_attack += 0.03 * e_attack
    # when 4
    #   e_attack += 0.04 * e_attack
    # else
    #   e_attack += 0.04 * e_attack
    # end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      attack += 2
    when 2
      attack += 4
    when 3
      attack += 6
    when 4
      attack += 8
    when 5..50
      attack += 8 + (6.5 * (recruit.level -4)).to_i
    end
    
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
