class Sahar < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.monster_attack * 0.5).floor
      mod2 = (alliance.tertiary.monster_attack * 0.33).floor unless alliance.tertiary.nil?
    end
    
    case recruit.level
    when 1
      monster_attack += 212 + mod1 + mod2
    when 2
      monster_attack += 230 + mod1 + mod2
    when 3
      monster_attack += 245 + mod1 + mod2
    when 4
      monster_attack += 260 + mod1 + mod2
    when 5..50
      monster_attack += ((recruit.level - 4) * 30) + 260 + mod1 + mod2
    end
    
    return monster_attack
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 5 if profile.inventory_exists?('weapons','Sahars Scimitar')

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
    defense += 5 if profile.inventory_exists?('items','Sahars Headdress')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
