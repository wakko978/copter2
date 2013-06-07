class Alexandrium < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    ### Strider example
    # if profile.weapons.exists?(name: 'Assassins Blade')
    #   attack += 3.0
    # end
    # if profile.items.exists?(name: 'Amulet of Despair')
    #   attack += 2.0
    # end
    # if profile.items.exists?(name: 'Assassins Cloak')
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
    # if profile.weapons.exists?(name: 'Scepter of Light')
    #   attack += 3.0
    # end
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    ## Aesir example
    # case recruit.level
    # when 1
    #   e_attack += 0.01 * profile.e_attack
    # when 2
    #   e_attack += 0.02 * profile.e_attack
    # when 3
    #   e_attack += 0.03 * profile.e_attack
    # when 4
    #   e_attack += 0.04 * profile.e_attack
    # else
    #   e_attack += 0.04 * profile.e_attack
    # end
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end
