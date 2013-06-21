class EternalAlystra < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 1 if profile.inventory_exists?('items','Gladiators Signet')
    attack += 2 if profile.inventory_exists?('weapons','Heros War Bow')
    attack += 3 if profile.inventory_exists?('items','Vanguards Gauntlets')

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

    defense += 1 if profile.inventory_exists?('items','Brawlers Armor')
    defense += 2 if profile.inventory_exists?('items','Swordsman Circlet')
    defense += 3 if profile.inventory_exists?('items','Warriors Greaves')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    div_power = [ profile.div_weapons, profile.div_powers, profile.div_generals,
      profile.div_items('shield'), profile.div_items('helmet'), profile.div_items('armor'),
      profile.div_items('amulet'), profile.div_items('glove'), profile.div_items('boot')
    ].collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      attack += div_power * 0.1
    when 2..15
      attack += div_power * (0.1 + (recruit.level.to_f - 1.0)*0.01)
    when 16..50
      attack += div_power * 0.24
    end
    
    e_attack = (attack + defense*0.7)
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    
    div_power = [ profile.div_weapons, profile.div_powers, profile.div_generals,
      profile.div_items('shield'), profile.div_items('helmet'), profile.div_items('armor'),
      profile.div_items('amulet'), profile.div_items('glove'), profile.div_items('boot')
    ].collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
    attack = profile.ri_attack + attack_with_mods(profile,recruit)
    defense = profile.ri_defense + defense_with_mods(profile,recruit)
    case recruit.level
    when 1
      attack += div_power * 0.1
    when 2..15
      attack += div_power * (0.1 + (recruit.level.to_f - 1.0)*0.01)
    when 16..50
      attack += div_power * 0.24
    end
    
    e_defense = (defense + attack*0.7)
    return e_defense.round(1)
  end
end
