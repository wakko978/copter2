class Annika < General
  def attack_with_mods(profile,recruit)
    ## recruit object used in cases where something unique
    ## occurs to the general's attack on a level up which is
    ## not accounted for with a standard integer increment
    ## i.e. Cartigan, Kobo, Malekus don't increment linearly
    attack = super

    attack += 3 if profile.inventory_exists?('items','Devarian Cloak')

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

    defense += 3 if profile.inventory_exists?('items','Templars Mask')
    return defense
  end

  def e_attack_with_bonus(profile,recruit)
    e_attack = super

    unless profile.recruits.includes(:general).where("generals.name = 'Odin'").first
      if (alliance = profile.recruits.includes(:general).where("generals.name = 'Aesir'").first)
        case alliance.level
        when 1
          mod = 0.01 * 0.5
        when 2
          mod = 0.02 * 0.5
        when 3
          mod = 0.03 * 0.5
        when 4
          mod = 0.04 * 0.5
        else
          mod = 0.04 * 0.5
        end
      else
        mod = 0
      end
    else
      mod = 0
    end
    case recruit.level
    when 1
      e_attack += (0.02 + mod) * e_attack
    when 2
      e_attack += (0.03 + mod) * e_attack
    when 3
      e_attack += (0.04 + mod) * e_attack
    when 4
      e_attack += (0.05 + mod) * e_attack
    else
      e_attack += (0.05 + mod) * e_attack
    end
    
    return e_attack.round(1)
  end

  def e_defense_with_bonus(profile,recruit)
    e_defense = super
    return e_defense.round(1)
  end
end