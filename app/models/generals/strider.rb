class Strider < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super
    
    attack += 3 if profile.inventory_exists?('weapons','Assassins Blade')
    attack += 2 if profile.inventory_exists?('items','Amulet of Despair')
    
    return attack
  end
  
  def defense_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's defense on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    defense = super
    
    defense += 5 if profile.inventory_exists?('items','Assassins Cloak')
    
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
