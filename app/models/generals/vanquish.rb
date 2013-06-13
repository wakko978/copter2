class Vanquish < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('powers','Wrath of Vanquish')
    attack += 1 if profile.inventory_exists?('weapons','Bloodblade')

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

    defense = profile.defense
    attack = profile.attack
    case recruit.level
    when 1
      attack += 4
      defense -= 5
    when 2
      attack += 8
      defense -= 10
    when 3
      attack += 12
      defense -= 15
    when 4, 5
      attack += 20
      defense -= 25
    when 6..50
      attack += step_function(recruit.level,{pos_index: 15, offset: 5, period: 2})
      defense -= step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    
    e_attack = ((attack + profile.attack_rune + profile.attack_ia) + (defense + profile.defense_rune + profile.defense_ia)*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    defense = profile.defense
    attack = profile.attack
    case recruit.level
    when 1
      attack += 4
      defense -= 5
    when 2
      attack += 8
      defense -= 10
    when 3
      attack += 12
      defense -= 15
    when 4, 5
      attack += 20
      defense -= 25
    when 6..50
      attack += step_function(recruit.level,{pos_index: 15, offset: 5, period: 2})
      defense -= step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    
    e_defense = ((defense + profile.defense_rune + profile.defense_ia) + (attack + profile.attack_rune + profile.attack_ia)*0.7)
    return e_defense.round(1)
  end
end
