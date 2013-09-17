class Zarevok < General
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
    when 1..4
      monster_attack += recruit.level * 5 + mod1 + mod2
    when 5..General.max_level
      monster_attack += (recruit.level - 5) * 30 + 50 + mod1 + mod2
    end
    
    return monster_attack
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('weapons','Meat Cleaver')

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

    defense += 3 if profile.inventory_exists?('weapons','Meat Cleaver')
    defense += 3 if profile.inventory_exists?('items','Zarevok Plate')

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
    return bonus.round()
  end
end
