class Ender < General
  def piercing(recruit)
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10
    else
      return 50
    end
  end
  
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 2 if profile.inventory_exists?('weapons','Spirit Render')

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

    defense += 1 if profile.inventory_exists?('items','Ancient Deathplate')
    defense += 1 if profile.inventory_exists?('items','Necrosis Gauntlets')
    
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super
    
    e_attack += (piercing(recruit) / 1000) * e_attack

    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
